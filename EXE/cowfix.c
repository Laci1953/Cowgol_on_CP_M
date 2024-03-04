// 				COWFIX
//
// 		part of the Cowgol language compiler toolchain
// 			for Z80 based computers
//
// Input: assembler source file build by Cowlink
// Output: assembler source file, modified for the purpose to:
// - be accepted by ZAS/Z80AS ( fix questionable syntax, e.g: 
//				'ld' instead of 'lxi', 
//				'push bc' instead of 'push b',
//				'jp' instead of 'jr' as default )
// - drop non-used labels
// - drop useless statements
// - other optimizations
//
// 		Szilagyi Ladislau, 2023-2024
//

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <conio.h>

char* rindex(char*, char);
void AddJp(char* To);

FILE *in;
FILE *out;
char buf1[512];
char buf2[512];
char buf3[512];
char *s, *p, *q;

int LineCounter = 0;

#define MAX_LABELS_COUNT 1500
struct _labels {
  char	label[9];
  int	refs;
} labels;
struct _labels Labels[MAX_LABELS_COUNT];
int LabelsCount = 0;

#define MAX_ENDLABELS_COUNT 500
char EndLabels[MAX_ENDLABELS_COUNT][9];	//endlabels : end_fnnn
int EndLabelsCount = 0;

int EndCalls[MAX_ENDLABELS_COUNT];
int EndCallsCount = 0;

#define MAX_LDLDRET 50
int LdLdRet[MAX_LDLDRET];
int LdLdRetCount = 0;

char ldwshlnnn[6];			// nnn from ld (ws+nnn),hl
int  ldwshl_Line;
char ldhlws = 0;			// 1: ld hl,(ws+nnn) found
char ldhlwsnnn[6];			// nnn from ld hl,(ws+nnn)

char ldwsannn[6];			// nnn from ld (ws+nnn),a
int  ldwsa_Line;
char ldaws = 0;				// 1: ld a,(ws+nnn) found
char ldawsnnn[6];			// nnn from ld a,(ws+nnn)

char endf = 0;

char jpz = 0;		// =1 if jp z,c01_nnnn found
char jpzaddr[16];
char jpnz = 0;		// =1 if jp nz,c01_nnnn found
char jpnzaddr[16];

char jp = 0;		// =1 if jp c01_nnnn found
char jpaddr[16];

char addr[16];
char fyyy[64];

//--------------------------------

char NormalizedAscii[6];

#define MAX_STORE_COUNT	100
// first char is set to '9' for "register pair" records
char Store[MAX_STORE_COUNT][6];
int CrtStoreIndex;

#define MAX_LOAD_COUNT	200
char Load[MAX_LOAD_COUNT][6];
int CrtLoadIndex;

#define MAX_REMOVE_COUNT 500
struct _toremove {
  int 	SubNr;
  char	Ascii[6];
} toremove;
struct _toremove ToRemove[MAX_REMOVE_COUNT];
int CrtToRemoveIndex;

#define MAX_JP_TO_COUNT 100
struct _jp_to {
  char	From[9];
  char	To[9];
} jpto;
struct _jp_to JpTo[MAX_JP_TO_COUNT];
int JpToIndex = 0;
char PrevLabel[9];

char Workspace[6];
int CrtSubIndex;
char InSubroutine;
char WaitingRet;
char AfterCallCounter;
char Endf;
int PushPopCounter;
char CallReplacedByJp;

void Move(char* dest, char* src, int len)
{
  int n;
  char* d;
  char* s;

  *(dest+len) = 0;

  for (d=dest+len-1, s=src+len-1, n=0; n<len; n++)
    *d-- = *s--;
}

void CommentOut(char* s)
{
  Move(s+1, s, strlen(s));
  *s = ';';
}

// Pass 1 ---------------------------------------------------------------------------------

//- Optimization of 
//
//-------------------------------------------
//
//	ld (ws+nnn),hl
//end_fyyy:
//	ld hl,(ws+nnn)
//	ret
//
//-->	ret
//
//-------------------------------------------
//
//	ld (ws+nnn),a
//end_fyyy:
//	ld a,(ws+nnn)
//	ret
//
//-->	ret
//
//-------------------------------------------

void SaveLdLdRet(int l)
{
  if (LdLdRetCount == MAX_LDLDRET)
  {
    printf("Too many LdLdRet structures!\n");
    exit(1);
  }

  //printf("Saving LdLdRet %d\n", l);
  LdLdRet[LdLdRetCount] = l;
  LdLdRetCount++;
} 

char SearchLdLdRet(int l)
{
  int n;
  
  //printf("Searching LdLdRet for line %d ", l);
  for (n=0; n<LdLdRetCount; n++)
  {
    if (LdLdRet[n] == l)
    {
      //printf("...found\n");
      return 1;
    }
  }

  //printf("...not found\n");
  return 0;
}

//- Optimization of store statements ------------------------------------------------------
//
// Eliminate 'ld (ws+nnn), hl' or 'ld (ws+nnn), a' statements
// if nnn is not used in 'ld hl,(ws+nnn)' statements of the current subroutine, or
//    nnn or nnn+1 is not used in 'ld a,(ws+nnn)' statements of the current subroutine

char SearchEndCall(int line)
{
  int n;
  
  //printf("Searching EndCall for line %d ", line);
  for (n=0; n<EndCallsCount; n++)
  {
    if (EndCalls[n] == line)
    {
      //printf("...found\n");
      return 1;
    }
  }

  //printf("...not found\n");
  return 0;
}

char SearchEndLabel(char* p)
{
  int n;

  //printf("Searching EndLabel %s ", p);
  for (n=0; n<EndLabelsCount; n++)
  {
    if (strcmp(EndLabels[n], p) == 0)
    {
      //printf("...found\n");
      return 1;
    }
  }

  //printf("...not found...\n");
  return 0;
}

void ZeroFill(char* Ascii)
{
  int n;

  for (n=0; n<5; n++)
    *Ascii++ = '0';

  *Ascii = 0;
}

char* Normalize(char* Ascii)
{
  int n,len;
  char* ps;
  char* pd;

  len = 0;

  while (isdigit(*Ascii++))
    len++;

  ps = Ascii - 2;
  pd = NormalizedAscii + 4;

  ZeroFill(NormalizedAscii);

  for (n=0; n<len; n++)
    *pd-- = *ps--;
  
  return NormalizedAscii;
}

void PutInStore(char* Ascii)
{
  if (CrtStoreIndex == MAX_STORE_COUNT)
  {
    printf("Too many stores!\n");
    exit(1);
  }

  strcpy(Store[CrtStoreIndex], Ascii);
  //printf("PutInStore %s\n", Ascii);
  CrtStoreIndex++;
}

void PutInLoad(char* Ascii)
{
  if (CrtLoadIndex == MAX_LOAD_COUNT)
  {
    printf("Too many loads!\n");
    exit(1);
  }

  strcpy(Load[CrtLoadIndex], Ascii);
  //printf("PutInLoad %s\n", Ascii);
  CrtLoadIndex++;
}

char SearchInLoad(char* Ascii)
{
  int n;

  //printf("Search in Load %s ", Ascii);
  for (n=0; n<CrtLoadIndex; n++)
    if (strcmp(Load[n], Ascii) == 0)
    {
      //printf("...found\n");
      return 1;
    }

  //printf("...not found\n");
  return 0;
}

void PutInToRemove(int subnr, char* ascii)
{
  if (CrtToRemoveIndex == MAX_REMOVE_COUNT)
  {
    printf("Too many removes!\n");
    exit(1);
  }

  ToRemove[CrtToRemoveIndex].SubNr = subnr;
  strcpy(ToRemove[CrtToRemoveIndex].Ascii, ascii);
  //printf("Put in ToRemove %d %s\n", subnr, ascii);
  CrtToRemoveIndex++;
}

char SearchInToRemove(int subnr, char* ascii)
{
  int n;

  //printf("Search in ToRemove %d %s ", subnr, ascii);
  for (n=0; n<CrtToRemoveIndex; n++)
    if (ToRemove[n].SubNr == subnr && strcmp(ToRemove[n].Ascii, ascii) == 0)
    {
      //printf("...found\n");
      return 1;
    }

  //printf("...not found\n");
  return 0;
}

char* IncAscii(char* Ascii)
{
  int n;
  char* p = Ascii + 4;
  
  for (n=0; n<5; n++)
  {
    if (*p != '9')
    {
      *p = *p + 1;
      return Ascii;
    }
    else
    {
      *p = '0';
      p = p - 1;
    }
  }
}

//- PASS 1+2 Removal of unused labels ---------------------------------------------------------------

char *strstr(register char *string, char* substring)
{
    char *a, *b;

    if (strlen(substring) > strlen(string))
        return NULL;

    /* First scan quickly through the two strings looking for a
     * single-character match.  When it's found, then compare the
     * rest of the substring.
     */

    b = substring;
    if (*b == 0) {
	return string;
    }
    for ( ; *string != 0; string += 1) {
	if (*string != *b) {
	    continue;
	}
	a = string;
	while (1) {
	    if (*b == 0) {
		return string;
	    }
	    if (*a++ != *b++) {
		break;
	    }
	}
	b = substring;
    }
    return NULL;
}

// return -1 if not found
int SearchLabel(char* l, char terminator)
{
  int n;
  char* tmp;
  
  if (LabelsCount == 0)
    return -1;

  tmp = buf2;

  while (*l != terminator)
    *tmp++ = *l++;

  *tmp = 0;

  for (n = 0; n < LabelsCount; n++)
  {
    if (strcmp(buf2, Labels[n].label) == 0)
    {
      //printf("found label %s\n", buf2);
      return n;
    }
  }

  return -1;
}

void AddLabel(char* p, char terminator)
{
  int n;

  if ((n = SearchLabel(p, terminator)) == -1)
  {
    if (LabelsCount == MAX_LABELS_COUNT)
    {
      printf("Too many local labels!\n");
      exit(1);
    }

    //printf("defining label ");

    for (n = 0; n < 8; n++)
    {
      if (*p == terminator)
        break;

      Labels[LabelsCount].label[n] = *p;
      //putch(*p);
      p++;
    }

    //putch('\n');

    Labels[LabelsCount].label[n] = 0;
    Labels[LabelsCount].refs = 1;

    LabelsCount++;
  }
  else
  {
    Labels[n].refs++;
  }
}

// PASS 1 - identify real labels (those used in ld, dw, jp or call statements)
void BuildLabelTable(void)
{
  int n;
  char tmp[16];

  CrtToRemoveIndex = 0;
  CrtSubIndex = 0;
  InSubroutine = 0;
  WaitingRet = 0;
  AfterCallCounter = 0;
  Endf = 0;

  while (s = fgets(buf1, 512, in))
  {
    LineCounter++;

    if (p = strstr(s, "ld hl,c"))					// ld hl,cxxx_nnnn
        AddLabel(p+6, 0xA);
    else if ( ( (p = strstr(s, "dw")) ) && (q = strstr(p, " c")) )	// dw cxxx_nnnn
        AddLabel(q+1, 0xA);
    else if ( (p = strstr(s, "jr")) || (p = strstr(s, "jp")) )		// jr or jp
    {
      if (q = strstr(p, "end_f"))					// jr end_f
      {
        if (EndLabelsCount == MAX_ENDLABELS_COUNT)
        {
          printf("Too many jp to end_f!\n");
          exit(1);
        }

        p = q + 8; // keep 8 chars
        *p = 0;
        strcpy(EndLabels[EndLabelsCount], q);
        EndLabelsCount++;
      }
      else if ((q = strstr(p, " c,")) && (q = strstr(++q, " c")))	// jp c, cxxx_nnnn or jr c, cxxx_nnnn
        AddLabel(q+1, 0xA);
      else if (q = strstr(p, " c"))					// jp cxxx_nnnn or jp cxxx_nnnn
        AddLabel(q+1, 0xA);
    }
    else if (InSubroutine)
    {
      if (strncmp(s, "end_f", 5) == 0)
      {
        if (AfterCallCounter == 2)					// precedent statement was call ...
          Endf = 1;

        WaitingRet = 1;

        strncpy(tmp, s, 8);
        tmp[8] = 0;
        
        if (!SearchEndLabel(tmp))					// if end_f label was used, do not allow commenting-it
          endf = 1;
      }
      else if (strstr(s, "push "))
        PushPopCounter++;
      else if (strstr(s, "pop bc"))	 
        PushPopCounter = 100;		//routine probably was called with params, forbid call-ret substitution
      else if (strstr(s, "pop "))
        PushPopCounter--;
      else if (strstr(s, "call "))
        AfterCallCounter = 3;
      else if ((p = strstr(s, "ld (")) && (p = strstr(p, "ws+")))	
      {									//ld (ws+nnn)
        p = p + 3;
        Normalize(p);

        if (strstr(p, ", a"))
        {								//ld (ws+nnn),a
          strcpy(ldwsannn, NormalizedAscii);
	  ldwsa_Line = LineCounter;
        }

        if (strstr(p, ", hl"))						//ld (ws+nnn),hl
        {
          strcpy(ldwshlnnn, NormalizedAscii);
          ldwshl_Line = LineCounter;
        }

        if (AfterCallCounter)
        {
          if (!strstr(p, ",a"))
            NormalizedAscii[0] = '9';					//ld (ws+nnnn),rr

          PutInStore(NormalizedAscii);
        }
      }
      else if ((p = strstr(s, "ld ")) && (q = strstr(p, ", (")) && (q = strstr(q, "ws+")))
      {									//ld       ,(ws+nnn)
        q = q + 3;
        Normalize(q);
        PutInLoad(NormalizedAscii);

        if (endf)
        {
          if (strstr(p, "hl,"))
          {								//ld hl,(ws+nnn)
            if ((strcmp(NormalizedAscii, ldwshlnnn) == 0) && (ldwshl_Line == LineCounter - 2))
              ldhlws = 1;
          }
          else if (strstr(p, "a,"))
          {								//ld a,(ws+nnn)
            if ((strcmp(NormalizedAscii, ldwsannn) == 0) && (ldwsa_Line == LineCounter - 2))
              ldaws = 1;
          }
        }
      }
      else if (WaitingRet)
      {
        if (strstr(s, "ret"))
        {
          if (ldhlws)
          {
            SaveLdLdRet(LineCounter - 3);
            ldhlws = 0;
          }
          else if (ldaws)
          {
            SaveLdLdRet(LineCounter - 3);
            ldaws = 0;
          }

          WaitingRet = 0;

          if (Endf && (PushPopCounter == 0) && (AfterCallCounter == 1))		// statements were call, end_f:, ret
          {									// and push-pop counter is 0
            if (EndCallsCount == MAX_ENDLABELS_COUNT)
            {
              printf("Too many calls before end_f!\n");
              exit(1);
            }

            EndCalls[EndCallsCount] = LineCounter - 2;				// store line# of precedent call
            EndCallsCount++;
          }

          //printf("end sub\n");

          for (n=0; n<CrtStoreIndex; n++)
          {
            strcpy(tmp, Store[n]);
            tmp[0] = '0';

            if (strcmp(tmp, Workspace) >= 0)
            {
              if (SearchInLoad(tmp) == 0)
              {
                if (*Store[n] != '9')
                  PutInToRemove(CrtSubIndex, tmp);
                else
                {
                  if (SearchInLoad(IncAscii(tmp)) == 0)
                  {
                    strcpy(tmp, Store[n]);
                    tmp[0] = '0';
                    PutInToRemove(CrtSubIndex, tmp);
                  }
                }
              }
            }
          }

          InSubroutine = 0;
        }
      }
      else if (AfterCallCounter == 2)
        PushPopCounter = 0;
    }
    else if (!strstr(s, "__main") && (p = strstr(s, "workspace at ")))		// workspace at ws+nnn...
    {
      InSubroutine = 1;
      CrtSubIndex++;
      CrtStoreIndex = 0;
      CrtLoadIndex = 0;
      Endf = 0;
      endf = 0;
      PushPopCounter = 0;
      p = strstr(p, "ws+") + 3;
      strcpy(Workspace, Normalize(p));
      //printf("Workspace %s\n", Workspace);
    }

    if (AfterCallCounter)
      AfterCallCounter--;
  } 
}

// drops unreferenced labels
void CheckLabels(char* s)
{
    // dump all unreferenced labels...
    if ( (*s == 'c') && rindex(s, ':') )
    {
      if (SearchLabel(s, ':') == -1)
      {	//if not referenced, comment current line...
        //printf("dropping label %s\n", buf2);
        CommentOut(s);
        return; 		
      }
    }
}

// Pass 2 ---------------------------------------------------------------------------------

long atol(char* p)
{
    long ret = 0;
    char sign = 0;

    if (*p == '-')
      sign = 1;

    while (isdigit(*p))
      ret = (ret * 10) + (*p++ - '0');

    if (sign)
      ret = -ret;

    return ret;
}

// PASS 2 

// returns 1 = break(quit reading file), 2 = continue(do not write current line), else 0
int CheckLine(char* s)
{
    long l;
    short low,high;
    char buf[10];

    //detect "TOP:"
    if (!strncmp(s, "TOP:", 4))
      return 1;

    if (p = strstr(s, "LOMEM"))
    {
      *p++ = '_';
      *p++ = '_';
      *p++ = 'H';
      *p++ = 'b';
      *p++ = 's';
      *p++ = 's';
      *p++ = 0xA;
      *p = 0;
      return 0;
    }

    if (p = rindex(s, '$'))		// $+n in the library routines
    {
      *p++ = '1';
      *p++ = 'f';
      *p++ = ';';

      fputs(buf1, out);			// write the jp cc,1f
      s = fgets(buf1, 512, in);		// then read the next line
      LineCounter++;

      if (p = strstr(s, "0x"))		// check for 0x
      {
        *(p + 1) = *(p + 2);
        *(p + 2) = *(p + 3);
        *(p + 3) = 'h';
      }

      fputs(buf1, out);			// write-it
      fputs("1:\n", out);		// then write a '1:' line	
      return 2;				// then read the next line 
    }

    // change dword n32 to dw low(n32), high(n32)
    if ((p = strstr(s, "dword")))
    {
      q = rindex(p, ' ');
      q++;
      l = atol(q);
      low = l & 0xFFFF;
      high = (l & 0xFFFF0000) >> 16;
      sprintf(s, " dw %d , %d\n", low, high);
    }					//push, pop b,d,h ---> push, pop bc,de,hl
    else if ((p = strstr(s, "push b")) && *(p + 6) != 'c')
    {
      *(p + 6) = 'c';
      *(p + 7) = 0xA;
      *(p + 8) = 0;
    }
    else if ((p = strstr(s, "push d")) && *(p + 6) != 'e')
    {
      *(p + 6) = 'e';
      *(p + 7) = 0xA;
      *(p + 8) = 0;
    }
    else if ((p = strstr(s, "push h")) && *(p + 6) != 'l')
    {
      *(p + 6) = 'l';
      *(p + 7) = 0xA;
      *(p + 8) = 0;
    }
    else if ((p = strstr(s, "pop b")) && *(p + 5) != 'c')
    {
      *(p + 5) = 'c';
      *(p + 6) = 0xA;
      *(p + 7) = 0;
    }
    else if ((p = strstr(s, "pop d")) && *(p + 5) != 'e')
    {
      *(p + 5) = 'e';
      *(p + 6) = 0xA;
      *(p + 7) = 0;
    }
    else if ((p = strstr(s, "pop h")) && *(p + 5) != 'l')
    {
      *(p + 5) = 'l';
      *(p + 6) = 0xA;
      *(p + 7) = 0;
    } 
    else if (p = strstr(s, "jr "))	//jr ---> jp
    {
      *(p + 1) = 'p';
    }
    else if (p = strstr(s, "0x"))	//0xNN ---> 0NNh
    {
      *(p + 1) = *(p + 2);
      *(p + 2) = *(p + 3);
      *(p + 3) = 'h';
    }

    if (p = rindex(s, ':'))		// look for labels with size > 31 ...
    {
      if ((p - s) > 31)
      {			 		// label size > 31, truncate-it to 31 chars
        q = s + 31;
        *q++ = ':';

        while (q <= p)
          *q++ = ' ';
      }
    }

    if (p = strstr(s, "jp"))
    {
      if (q = rindex(p, ','))
      {
        q = q + 2;			//jp cond,label , skip to first char of label
      }
      else
      {
        q = p + 3;			//jp label , skip to first char of label
      }
     
      if (strlen(q) > 31)
      {					// label size > 31, truncate-it to 31 chars
        q = q + 31;

	if (isalnum(*q))
          *q = ';';
      }
    }
    else if (p = strstr(s, "call "))
    {
      if (SearchEndCall(LineCounter))
      {	       				// replace call with jp
        strcpy(buf2, buf1);
	buf1[strlen(buf1)-1] = 0;
        strcat(buf1, " ;");
        strcat(buf1, buf2);
        *p++ = 'j';
        *p++ = 'p';
        *p++ = ' ';
        *p = ' ';
        CallReplacedByJp = 1;
      }

      if (q = rindex(p, ','))
      {
        q = q + 2;			//jp cond,label , skip to first char of label
      }
      else
      {
        q = p + 5;			//jp label , skip to first char of label
      }
     
      if (strlen(q) > 31)
      {					// label size > 31, truncate-it to 31 chars
        q = q + 31;

	if (isalnum(*q) || *q == '_')
          *q = ';';
      }
    }
    else if (strncmp(s, "end_f", 5) == 0)
    {
      InSubroutine = 0;

      strcpy(buf2, s);
      buf2[8] = 0;

      if (!SearchEndLabel(buf2))
      {
	//comment it out
        CommentOut(buf1);
        return 0;
      }
    }
    else if (CallReplacedByJp && strstr(s, "ret"))
      {
	//comment it out
        CommentOut(buf1);
        return 0;
      }

    if (p = strstr(s, "workspace at "))				// workspace at ws+nnn...
    {
      InSubroutine = 1;
      CrtSubIndex++;
      CallReplacedByJp = 0;
    }    
    else if (InSubroutine)
    {
      if (p = strstr(s, "ld ("))
      {
        p = strstr(p, "ws+");
        p = p + 3;
        if (SearchInToRemove(CrtSubIndex, Normalize(p)) == 1)
	{
          *s = ';';						// comment-it out...
        }
      }
    }

    if ((*s != ';') && PrevLabel[0] && (p = strstr(s, "jp c01_")))
    {					// if jp is after a label, add target to jp table
      strncpy(buf, p+3, 8);
      buf[8] = 0;
      AddJp(buf);
    }

    if ((strncmp(s, "c01_", 4) == 0) && rindex(s, ':'))		//if label
    {					//save label into PrevLabel
      strncpy(PrevLabel, s, 8);
      PrevLabel[8] = 0;
    }
    else
      PrevLabel[0] = 0;			//else erase PrevLabel

    return 0;
}

// Pass 3 ---------------------------------------------

// - Optimization of jp -> jp -> ... ------------------

//
// (PrevLabel):
//	jp c01_nnnn
//
// Adds c01_nnnn to JpTo table
//
void AddJp(char* To)
{
  if (JpToIndex == MAX_JP_TO_COUNT)
  {
    printf("Too many JpTo...\n");
    exit(1);
  }

  //printf("Add to Jp table : from %s to %s\n", PrevLabel, To);
  strcpy(JpTo[JpToIndex].From, PrevLabel);
  strcpy(JpTo[JpToIndex].To, To);
  JpToIndex++;
}

//
//	jp c01_nnnn
// (c01_nnnn is the "target")
//
// returns last To in the chain jp -> jp ... -> jp
char* SearchJp(char* target)
{
  int n;

  //printf("Search in Jp table for %s\n", target);
  for (n = 0; n < JpToIndex; n++)
  {
    if (strcmp(JpTo[n].From, target) == 0)
      return SearchJp(JpTo[n].To);
  }
  
  //printf("...returns %s\n", target);
  return target;
}

// - Optimizations for
//
//---------------------------------
//
//	jp nz, c01_xxxx
//	jp c01_yyyy
//c01_xxxx:
//
//-->	jp z, c01_yyyy
//
//---------------------------------
//
//	jp z, c01_xxxx
//	jp c01_yyyy
//c01_xxxx:
//
//-->	jp nz, c01_yyyy
//
//---------------------------------
//
//	jp z, c01_xxxx
//	call fyyy
//c01_xxxx:
//
//-->	call nz,fyyy
//
//--------------------------------
//
//	jp nz, c01_xxx
//	call fyyy
//c01_xxx:
//
//-->	call z,fyyy
//
//--------------------------------
//
//	jp nz, c01_xxx
//	ret
//c01_xxx:
//
//-->	ret z
//
//--------------------------------
//
//	jp z, c01_xxx
//	ret
//c01_xxx:
//
//-->	ret nz
//
//--------------------------------

void READ(char* p)
{
  do
    fgets(p, 512, in);
  while(*p == ';');
}

void WRITE123(void)
{
  fputs(buf1, out);
  fputs(buf2, out);
  fputs(buf3, out);
}

void WRITE12(void)
{
  fputs(buf1, out);
  fputs(buf2, out);
}

void WRITE1(void)
{
  fputs(buf1, out);
}

void Write123Commented(void)
{
  CommentOut(buf1);
  fputs(buf1, out);

  CommentOut(buf2);
  fputs(buf2, out);

  CommentOut(buf3);
  fputs(buf3, out);
}

char tmp[9];
char* Extract(char* p)
{
  strncpy(tmp, p, 8);
  tmp[8] = 0;
  return tmp;
}

void Pass3(char* pbuf)
{
 char buf[64];

 if (p = strstr(pbuf, "jp c01_"))
 {
   strncpy(buf, p+3, 8);
   buf[8] = 0;
   q = SearchJp(buf);

   if (strcmp(buf, q))
   {					// jp target changed!
     strcpy(p+3, q);
     strcat(p+3, " ; ");
     strcat(p+3, buf);
     strcat(p+3, "\n");
   }

   WRITE1();
   return;
 }
 
 if ((p = strstr(pbuf, "jp nz, c01_")) && (Labels[SearchLabel(p+7, '\n')].refs == 1))
 {
   strcpy(jpnzaddr, Extract(p+7));
   READ(buf2);

   if (p = strstr(buf2, "jp c01_"))
   {
     strcpy(jpaddr, Extract(p+3));
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));
       
       if (strcmp(addr, jpnzaddr) == 0)
       { 
         Write123Commented();
         //write 'jp z,jpaddr'
         strcpy(buf, "\tjp z,");
         strcat(buf, jpaddr);
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     }
     else
       WRITE123();
   }
   else if (p = strstr(buf2, "call f"))
   {
     memcpy(fyyy, p+5, strlen(p+5)-1);
     fyyy[strlen(p+5)-1] = 0;
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));

       if (strcmp(addr, jpnzaddr) == 0)
       { 
         Write123Commented();
         //write 'call z,fyyy'
         strcpy(buf, "\tcall z,");
         strcat(buf, fyyy);
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     } 
     else
       WRITE123();
   }
   else if (p = strstr(buf2, "ret"))
   {
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));

       if (strcmp(addr, jpnzaddr) == 0)
       { 
         Write123Commented();
         //write 'ret z'
         strcpy(buf, "\tret z");
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     } 
     else
       WRITE123();
   }
   else
     WRITE12();
 }
 else if ((p = strstr(pbuf, "jp z, c01_")) && (Labels[SearchLabel(p+6, '\n')].refs == 1))
 {
   strcpy(jpzaddr, Extract(p+6));
   READ(buf2);

   if (p = strstr(buf2, "jp c01_"))
   {
     strcpy(jpaddr, Extract(p+3));
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));
       
       if (strcmp(addr, jpzaddr) == 0)
       { 
         Write123Commented();
         //write 'jp nz,jpaddr'
         strcpy(buf, "\tjp nz,");
         strcat(buf, jpaddr);
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     }
     else
       WRITE123();
   }
   else if (p = strstr(buf2, "call f"))
   {
     memcpy(fyyy, p+5, strlen(p+5)-1);
     fyyy[strlen(p+5)-1] = 0;
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));

       if (strcmp(addr, jpzaddr) == 0)
       { 
         Write123Commented();
         //write 'call nz,fyyy'
         strcpy(buf, "\tcall nz,");
         strcat(buf, fyyy);
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     } 
     else
       WRITE123();
   }
   else if (p = strstr(buf2, "ret"))
   {
     READ(buf3);

     if (strncmp(buf3, "c01_", 4) == 0)
     {
       strcpy(addr, Extract(buf3));

       if (strcmp(addr, jpzaddr) == 0)
       { 
         Write123Commented();
         //write 'ret nz'
         strcpy(buf, "\tret nz");
         strcat(buf, "\n");
         fputs(buf, out);
       }
       else
         WRITE123();
     } 
     else
       WRITE123();
   }
   else
     WRITE12();
 }
 else
   WRITE1();
}

int main(int argc, char*argv[])
{
  int n;

  if (argc != 3)
  {
    printf("Invalid parameters!\nUsage is: cowfix in_file out_file\n");
    exit(1);
  }

  if (!(in = fopen(argv[1], "r")))
  {
    printf("Cannot open input file!\n");
    exit(1);
  }

  if (!(out = fopen("cowfix.$$$", "w")))
  {
    printf("Cannot open output file!\n");
    exit(1);
  }

  // First pass : gather labels related info & load/store related info
  //printf("PASS 1\n");

  BuildLabelTable();

  fclose(in);

  // Second pass : apply optimizations #1
  //printf("PASS 2\n");

  InSubroutine = 0;
  CrtSubIndex = 0;
  LineCounter = 0;
  PrevLabel[0] = 0;

  in = fopen(argv[1], "r");

  fgets(buf1, 512, in); //skip "org 100h"
  LineCounter++;
  fgets(buf1, 512, in); //skip "lxi sp,TOP+128"
  LineCounter++;

  fputs("psect text\n", out); //write "psect text"
  fputs("ld sp,TOPSTACK\n", out); //write first line

  while (s = fgets(buf1, 512, in))
  {
    LineCounter++;
    //printf("line %d\n", LineCounter);

    if (!strncmp(s, "\tdb", 3))
    {
      while (strlen(buf1) > 128)
      {					//line too long
	p = buf1 + 128;

        while (*p != ',') p--;		// find first previous ','
					// then split line
	strcpy(buf2, "db ");
	strcat(buf2, p+1);

	*p++ = '\n';
	*p = 0;

	fputs(buf1, out);

	strcpy(buf1, buf2);
      }

      fputs(buf1, out);

      continue;
    }

    if (SearchLdLdRet(LineCounter))	
    {					// drop 3 lines, keep only the next 'ret'
      //printf("Commenting out at line %d :\n", LineCounter);
      CommentOut(buf1);
      fputs(buf1, out);
      //printf(buf1);

      fgets(buf1, 512, in);
      LineCounter++;
      CommentOut(buf1);
      fputs(buf1, out);
      //printf(buf1);

      fgets(buf1, 512, in);
      LineCounter++;
      CommentOut(buf1);
      fputs(buf1, out);
      //printf(buf1);

      fgets(buf1, 512, in);
      LineCounter++;
      fputs(buf1, out);			// ret
      continue;
    }

    CheckLabels(s);

    n = CheckLine(s);

    if (n == 1)
      break;
    else if (n == 2)
      continue;

    fputs(buf1, out);
  }

  fputs("global _exit\n", out);
  fputs("_exit: rst 0\n", out);

  fgets(buf1, 512, in); //skip "ws equ TOP+128"
  fgets(buf1, 512, in); //read "LOMEM equ ws+..."

  fputs("psect data\n", out);
  fputs("ws:\n", out);

  strcpy(buf2, "defs ");
  strcat(buf2, buf1+13);
  fputs(buf2, out);

  fputs("psect bss\n", out);
  fputs("defs 128\n", out);
  fputs("TOPSTACK:\n", out);

  fclose(in);
  fclose(out);

  // Third pass : apply optimizations #2
  //printf("PASS 3\n");

  in = fopen("cowfix.$$$", "r");
  out = fopen(argv[2], "w");

  //n = 1;

  while (s = fgets(buf1, 512, in))
  {
    //printf("line %d: %s\n", n++, buf1);
    //skip commented lines
    if (buf1[0] != ';')
      Pass3(buf1);
    else
      fputs(buf1, out);
  }

  fclose(in);
  fclose(out);

  remove("cowfix.$$$");

  exit(0);
}
