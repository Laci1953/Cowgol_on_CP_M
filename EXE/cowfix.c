// 				COWFIX
//
// 		part of the Cowgol language compiler toolchain
// 			for Z80 based computers
//
// Input: assembler source file build by Cowlink
// Output: assembler source file, modified for the purpose to:
// - be accepted by ZAS/Z80AS ( fix questionable syntax, e.g: 
//				'push h' instead of 'push hl'
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

char* rindex(char* p, char c);

char* IsLabelRef(void);
char* IsEndLabelRef(void);
char* FindString(char* str);
char* FindChar(char ch);
void  ZeroFill(char* Ascii);
int   LabelLen(char* label);

void AddJp(int From, int To);

char Optimize = 0;

FILE *in;
FILE *out;
char buf1[512];
char buf2[512];
char buf3[512];
char buf[64];
char *s, *p, *q;

int LineCounter = 0;

#define LABEL_SIZE 8
#define MAX_LABELS_COUNT 1500
struct _labels {
  char	label[LABEL_SIZE+1];
  char	refs;		//references count
  char	beforeRet;	//1:a 'ret' is next statement
} labels;
struct _labels Labels[MAX_LABELS_COUNT];
int LabelsCount = 0;

int LabelList[10];	//indexes in Labels for successive labels
int LabelListIndex = 0;

#define MAX_ENDLABELS_COUNT 500
char EndLabels[MAX_ENDLABELS_COUNT][LABEL_SIZE+1];	//endlabels : end_fnnn
int EndLabelsCount = 0;

//int EndCalls[MAX_ENDLABELS_COUNT];
//int EndCallsCount = 0;

#define MAX_LDLDRET 50
int LdLdRet[MAX_LDLDRET];
int LdLdRetCount = 0;

#define OFFSET_SIZE 5
char ldwshlnnn[OFFSET_SIZE+1];			// nnn from ld (ws+nnn),hl
int  ldwshl_Line;
char ldhlws = 0;				// 1: ld hl,(ws+nnn) found
char ldhlwsnnn[OFFSET_SIZE+1];			// nnn from ld hl,(ws+nnn)

char ldwsannn[OFFSET_SIZE+1];			// nnn from ld (ws+nnn),a
int  ldwsa_Line;
char ldaws = 0;					// 1: ld a,(ws+nnn) found
char ldawsnnn[OFFSET_SIZE+1];			// nnn from ld a,(ws+nnn)

char endf = 0;

char jpz = 0;		// =1 if jp z,cxx_nnnn found
char jpzaddr[16];
char jpnz = 0;		// =1 if jp nz,cxx_nnnn found
char jpnzaddr[16];

char jp = 0;		// =1 if jp cxx_nnnn found
char jpaddr[16];

char addr[16];
char fyyy[64];

//--------------------------------

char NormalizedAscii[OFFSET_SIZE+1];

// ld r(r), (ws+nnnn) where nnnn < Workspace
#define MAX_REF_COUNT 100
char Refs[MAX_REF_COUNT][OFFSET_SIZE+1];
int CrtRefsIndex = 0;

#define MAX_STORE_COUNT	100
// first char is set to '9' for "register pair" records
char Store[MAX_STORE_COUNT][OFFSET_SIZE+1];
int CrtStoreIndex;

#define MAX_LOAD_COUNT	50
char Load[MAX_LOAD_COUNT][OFFSET_SIZE+1];
int CrtLoadIndex;

#define MAX_REMOVE_COUNT 500
struct _toremove {
  int 	SubNr;
  char	Ascii[OFFSET_SIZE+1];
} toremove;
struct _toremove ToRemove[MAX_REMOVE_COUNT];
int CrtToRemoveIndex;

#define MAX_JP_TO_COUNT 100
struct _jp_to {
  int	From;	//index in Labels
  int	To;	//index in Labels
} jpto;
struct _jp_to JpTo[MAX_JP_TO_COUNT];
int JpToIndex = 0;

char Workspace[OFFSET_SIZE+1];
int CrtSubIndex;
char InSubroutine;
char WaitingRet;
char AfterCallCounter;
char Endf;
//int PushPopCounter;
//char CallReplacedByJp;

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

char SearchLdLdRet(int line)
{
  int n;
  
  //printf("Searching LdLdRet for line %d ", line);
  for (n=0; n<LdLdRetCount; n++)
  {
    if (LdLdRet[n] == line)
    {
      //printf("...found\n");
      return 1;
    }
  }

  //printf("...not found\n");
  return 0;
}

void SaveLdLdRet(int line)
{
  if (LdLdRetCount == MAX_LDLDRET)
  {
    printf("Too many LdLdRet structures!\n");
    exit(1);
  }

  //printf("Saving LdLdRet %d\n", line);
  LdLdRet[LdLdRetCount] = line;
  LdLdRetCount++;
} 

//- Optimization of store statements ------------------------------------------------------
//
// Eliminate 'ld (ws+nnn), hl' or 'ld (ws+nnn), a' statements
// if nnn is not used in 'ld hl,(ws+nnn)' statements of the current subroutine, or
//    nnn or nnn+1 is not used in 'ld a,(ws+nnn)' statements of the current subroutine

/************************************************
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
***********************************************/

void AddEndLabel(char* endlabel)
{
  if (EndLabelsCount == MAX_ENDLABELS_COUNT)
  {
    printf("Too many jp to end_f!\n");
    exit(1);
  }

  // keep only 8 chars

  strncpy(EndLabels[EndLabelsCount], endlabel, LABEL_SIZE);
  EndLabels[EndLabelsCount][LABEL_SIZE] = 0;
  EndLabelsCount++;
}

char SearchEndLabel(char* label)
{
  int n;

  //printf("Searching EndLabel %s ", label);
  for (n=0; n<EndLabelsCount; n++)
  {
    if (strncmp(EndLabels[n], label, LABEL_SIZE) == 0)
    {
      //printf("...found\n");
      return 1;
    }
  }

  //printf("...not found...\n");
  return 0;
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
  pd = NormalizedAscii + OFFSET_SIZE - 1;

  ZeroFill(NormalizedAscii);

  for (n=0; n<len; n++)
    *pd-- = *ps--;
  
  return NormalizedAscii;
}

char SearchInStore(char* Ascii)
{
  int n;

  //printf("Search in Store %s ", Ascii);
  for (n=0; n<CrtStoreIndex; n++)
    if (strcmp(Store[n], Ascii) == 0)
    {
      //printf("...found\n");
      return 1;
    }

  //printf("...not found\n");
  return 0;
}

void PutInStore(char* Ascii)
{
  if (!SearchInStore(Ascii))
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

void PutInLoad(char* Ascii)
{
  if (!SearchInLoad(Ascii))
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

void PutInToRemove(int subnr, char* ascii)
{
  if (!SearchInToRemove(subnr, ascii))
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
}

char SearchInRefs(char* Ascii)
{
  int n;

  //printf("Search in Refs %s ", Ascii);
  for (n=0; n<CrtRefsIndex; n++)
    if (strcmp(Refs[n], Ascii) == 0)
    {
      //printf("...found\n");
      return 1;
    }

  //printf("...not found\n");
  return 0;
}

void PutInRefs(char* Ascii)
{
  if (!SearchInRefs(Ascii))
  {
    if (CrtRefsIndex == MAX_REF_COUNT)
    {
      printf("Too many refs!\n");
      exit(1);
    }
    strcpy(Refs[CrtRefsIndex], Ascii);
    //printf("PutInRefs %s\n", Ascii);
    CrtRefsIndex++;
  }
}

char* IncAscii(char* Ascii)
{
  int n;
  char* p = Ascii + OFFSET_SIZE - 1;
  
  for (n=0; n<OFFSET_SIZE; n++)
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

// return -1 if not found
int SearchLabel(char* label, char terminator)
{
  int n;
  char* p;
  
  if (LabelsCount == 0)
    return -1;

  p = label;

  for (n = 0; *p != terminator && n < LABEL_SIZE; n++)
    buf[n] = *p++;

  buf[n] = 0;

  for (n = 0; n < LabelsCount; n++)
  {
    if (strcmp(buf, Labels[n].label) == 0)
    {
      //printf("found label %s\n", buf);
      return n;
    }
  }

  return -1;
}

void AddLabel(char* label)
{
  int n;
  char* p;

  p = label;

  for (n = 0; *p != 0xA && n < LABEL_SIZE; n++)
    buf[n] = *p++;

  buf[n] = 0;

  if ((n = SearchLabel(label, 0xA)) == -1)
  {
    if (LabelsCount == MAX_LABELS_COUNT)
    {
      printf("Too many local labels!\n");
      exit(1);
    }
    //printf("defining label %s\n", buf);
    strcpy(Labels[LabelsCount].label, buf);
    Labels[LabelsCount].refs = 1;
    Labels[LabelsCount].beforeRet = 0;

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
  char tmp[OFFSET_SIZE+1];

  CrtToRemoveIndex = 0;
  CrtSubIndex = 0;
  InSubroutine = 0;
  WaitingRet = 0;
  AfterCallCounter = 0;
  Endf = 0;

  while (s = fgets(buf1, 512, in))
  {
    LineCounter++;
    //printf("line %d: %s\n", LineCounter, buf1);

    if (p = FindString("ld hl,c"))					// ld hl,cxxx_nnnn
      AddLabel(p+6);
    else if (p = strstr(s, "dw c"))					// dw cxxx_nnnn
      AddLabel(p+3);
    else if (q = IsEndLabelRef())					// jr [xx,] end_f
      AddEndLabel(q);
    else if (q = IsLabelRef())						// jp [xx,] cxx_nnnn
      AddLabel(q);
    else if (InSubroutine)
    {
      if (*s == 'e')							// end_fxxx
      {
        if (AfterCallCounter == 2)					// precedent statement was call ...
          Endf = 1;

        WaitingRet = 1;

        if (!SearchEndLabel(s))						// if end_f label was used, do not allow commenting-it
          endf = 1;
      }
/*****************************************
      else if (FindString("\tpush "))
        PushPopCounter++;
      else if (FindString("\tpop bc"))	 
        PushPopCounter = 100;		//routine probably was called with params, forbid call-ret substitution
      else if (FindString("\tpop "))
        PushPopCounter--;
*******************************************/
      else if (FindString("\tcall "))
        AfterCallCounter = 3;
      else if ((p = FindString("ld (")) && (p = strstr(p, "ws+")))	
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
      else if ((p = FindString("ld ")) && (q = strstr(p, ", (")) && (q = strstr(q, "ws+")))
      {									//ld       ,(ws+nnn)
        q = q + 3;
        Normalize(q);

	if (strcmp(NormalizedAscii, Workspace) < 0)
	  PutInRefs(NormalizedAscii);	// it's a reference to an external variable
        else
        {
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
      }
      else if (WaitingRet)
      {
        if (FindString("\tret"))
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

/**********************************************************************
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
*************************************************************************/
          //printf("end sub\n");

          for (n=0; n<CrtStoreIndex; n++)
          {
            strcpy(tmp, Store[n]);
	    tmp[0] = '0';

            if (strcmp(tmp, Workspace) >= 0)
            {
              if ((SearchInLoad(tmp) == 0) && !SearchInRefs(tmp))	//only if not in Refs!
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
/************************************
      else if (AfterCallCounter == 2)
        PushPopCounter = 0;
*************************************/
    }
    else if (!FindString("__main") && (p = FindString("workspace at ")))		// workspace at ws+nnn...
    {
      InSubroutine = 1;
      CrtSubIndex++;
      CrtStoreIndex = 0;
      CrtLoadIndex = 0;
      Endf = 0;
      endf = 0;
      //PushPopCounter = 0;
      p = strstr(p, "ws+") + 3;
      strcpy(Workspace, Normalize(p));
      //printf("Workspace %s\n", Workspace);
    }

    if (AfterCallCounter)
      AfterCallCounter--;
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
    int n, to;

    //push, pop b,d,h ---> push, pop bc,de,hl

  if (FindString("\tp"))
  {
    if ((p = FindString("push b")) && *(p + 6) != 'c')
    {
      *(p + 6) = 'c';
      *(p + 7) = '\n';
      *(p + 8) = 0;
      LabelListIndex = 0;
      return 0;
    }

    if ((p = FindString("push d")) && *(p + 6) != 'e')
    {
      *(p + 6) = 'e';
      *(p + 7) = '\n';
      *(p + 8) = 0;
      LabelListIndex = 0;
      return 0;
    }

    if ((p = FindString("push h")) && *(p + 6) != 'l')
    {
      *(p + 6) = 'l';
      *(p + 7) = '\n';
      *(p + 8) = 0;
      LabelListIndex = 0;
      return 0;
    }

    if ((p = FindString("pop b")) && *(p + 5) != 'c')
    {
      *(p + 5) = 'c';
      *(p + 6) = '\n';
      *(p + 7) = 0;
      LabelListIndex = 0;
      return 0;
    }

    if ((p = FindString("pop d")) && *(p + 5) != 'e')
    {
      *(p + 5) = 'e';
      *(p + 6) = '\n';
      *(p + 7) = 0;
      LabelListIndex = 0;
      return 0;
    }

    if ((p = FindString("pop h")) && *(p + 5) != 'l')
    {
      *(p + 5) = 'l';
      *(p + 6) = '\n';
      *(p + 7) = 0;
      LabelListIndex = 0;
      return 0;
    } 
  }

    //detect "TOP:"
    if (!strncmp(s, "TOP:", 4))
      return 1;

    if (p = FindString("LOMEM"))
    {
      *p++ = '_';
      *p++ = '_';
      *p++ = 'H';
      *p++ = 'b';
      *p++ = 's';
      *p++ = 's';
      *p++ = '\n';
      *p = 0;
      LabelListIndex = 0;
      return 0;
    }

    if (p = FindChar('$'))		// $+n in the library routines
    {
      *p++ = '1';
      *p++ = 'f';
      *p++ = ';';

      fputs(buf1, out);			// write the jp cc,1f
      s = fgets(buf1, 512, in);		// then read the next line
      LineCounter++;

      if (p = FindString("0x"))		// check for 0x
      {
        *(p + 1) = *(p + 2);
        *(p + 2) = *(p + 3);
        *(p + 3) = 'h';
      }

      fputs(buf1, out);			// write-it
      fputs("1:\n", out);		// then write a '1:' line
      LabelListIndex = 0;	
      return 2;				// then read the next line 
    }

    // change dword n32 to dw low(n32), high(n32)
    if (p = FindString("dword"))
    {
      q = FindChar(' ');
      q++;
      l = atol(q);
      low = l & 0xFFFF;
      high = (l & 0xFFFF0000) >> 16;
      sprintf(s, "\tdw %d , %d\n", low, high);
      LabelListIndex = 0;
      return 0;
    }

    if (p = FindString("\tjr "))		//jr ---> jp
      *(p + 2) = 'p';

    if (p = FindString("0x"))	//0xNN ---> 0NNh
    {
      *(p + 1) = *(p + 2);
      *(p + 2) = *(p + 3);
      *(p + 3) = 'h';
    }

    if (p = FindChar(':'))		// look for labels with size > 31 ...
    {
      if ((p - s) > 31)
      {			 		// label size > 31, truncate-it to 31 chars
        q = s + 31;
        *q++ = ':';

        while (q <= p)
          *q++ = ' ';
      }
    }
    else if (p = FindString("\tjp"))
    {
      if (q = FindChar(','))
      {
        q = q + 2;			//jp cond,label , skip to first char of label
      }
      else
      {
        q = p + 4;			//jp label , skip to first char of label
      }
     
      if (strlen(q) > 31)
      {					// label size > 31, truncate-it to 31 chars
        q = q + 31;

	if (isalnum(*q))
          *q = ';';
      }
    }
    else if (p = FindString("\tcall "))
    {
      if (q = FindChar(','))
      {
        q = q + 2;			//jp cond,label , skip to first char of label
      }
      else
      {
        q = p + 6;			//jp label , skip to first char of label
      }
     
      if (strlen(q) > 31)
      {					// label size > 31, truncate-it to 31 chars
        q = q + 31;

	if (isalnum(*q) || *q == '_')
          *q = ';';
      }
    }

    if (!Optimize)
      return 0;
/**************************************
    if (p = FindString("\tcall "))
    {
      if (SearchEndCall(LineCounter))
      {
        p++;	       				// replace call with jp
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
    }
****************************************/    
    if (strncmp(s, "end_f", 5) == 0)
    {
      InSubroutine = 0;

      if (!SearchEndLabel(s))
      {
	//comment it out
        CommentOut(buf1);
        LabelListIndex = 0;
        return 0;
      }
    }
/*************************************************
    if (CallReplacedByJp && FindString("\tret"))
    {
      //comment it out
      CommentOut(buf1);
      LabelListIndex = 0;
      return 0;
    }
****************************************************/
    if (!FindString("__main") && (p = FindString("workspace at ")))				// workspace at ws+nnn...
    {
      InSubroutine = 1;
      CrtSubIndex++;
      //CallReplacedByJp = 0;
    }    
    
    if (InSubroutine)
    {
      if (p = FindString("ld ("))
      {
        p = strstr(p, "ws+");
        p = p + 3;
        Normalize(p);
        if (strcmp(NormalizedAscii, "00000") && (SearchInToRemove(CrtSubIndex, NormalizedAscii) == 1))
          CommentOut(s);					// comment-it out...
      }
    }

    if ( *s == 'c' )
    {      						// label
      n = SearchLabel(s, ':');

      if (n == -1)
      {	      						// if not referenced, comment current line...
        //printf("dropping label %s\n", s);
        CommentOut(s);
        return 0; 		
      }
      else
        LabelList[LabelListIndex++] = n;
    }
    else if (!FindChar(',') && (p = FindString("\tjp c")))
    {							// jp cxx_nnnn
      to = SearchLabel(p+4, 0xA);

      for (n=0; n<LabelListIndex; n++)
        AddJp(LabelList[n], to);

      LabelListIndex = 0;
    }
    else if ((*s != ';') && FindString("\tret"))
    {							// ret
      for (n=0; n<LabelListIndex; n++)
      {
        //printf("Setting label %s as placed before RET\n", Labels[LabelList[n]].label);
        Labels[LabelList[n]].beforeRet = 1;
      }
    }
    else if (*s != ';')
      LabelListIndex = 0;

    return 0;
}

// Pass 3 ---------------------------------------------

// - Optimization of jp -> jp -> ... ------------------

void AddJp(int From, int To)
{
  if (JpToIndex == MAX_JP_TO_COUNT)
  {
    printf("Too many JpTo...\n");
    exit(1);
  }

  //printf("Add to Jp table : from %s to %s\n", Labels[From].label, Labels[To].label);

  JpTo[JpToIndex].From = From;
  JpTo[JpToIndex].To = To;

  JpToIndex++;
}

// returns last To in the chain jp -> jp ... -> jp
int SearchJp(int target)
{
  int n;

  //printf("Search in Jp table for %s\n", Labels[target].label);
  for (n = 0; n < JpToIndex; n++)
  {
    if (JpTo[n].From == target)
      return SearchJp(JpTo[n].To);
  }
  
  //printf("...returns %s\n", Labels[target].label);
  return target;
}

// - Optimizations for
//
//---------------------------------
//
//	jp nz, cxx_xxxx
//	jp cxx_yyyy
//cxx_xxxx:
//
//-->	jp z, cxx_yyyy
//
//---------------------------------
//
//	jp z, cxx_xxxx
//	jp cxx_yyyy
//cxx_xxxx:
//
//-->	jp nz, cxx_yyyy
//
//---------------------------------
//
//	jp z, cxx_xxxx
//	call fyyy
//cxx_xxxx:
//
//-->	call nz,fyyy
//
//--------------------------------
//
//	jp nz, cxx_xxx
//	call fyyy
//cxx_xxx:
//
//-->	call z,fyyy
//
//--------------------------------
//
//	jp nz, cxx_xxx
//	ret
//cxx_xxx:
//
//-->	ret z
//
//--------------------------------
//
//	jp z, cxx_xxx
//	ret
//cxx_xxx:
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

// returns 1 if jp was handled, else 0
char HandleJp(void)
{
 char xx[3];
 int to1, to2;

 if ( q = IsLabelRef() )
 {
   strcpy(buf, q);

   to1 = SearchLabel(q, 0xA);
   to2 = SearchJp(to1);

   xx[0] = 0;

   if (Labels[to2].beforeRet)
   {					// jp to ret !
     strcpy(buf, buf1);

     p = FindString("\tjp ");

     if (FindChar(','))			// jp xx, cyy_xxxx
     {
       p += 4;
       xx[0] = *p++;

       if (*p == ',')
       {
         xx[1] = 0;
       }
       else
       {
         xx[1] = *p;
         xx[2] = 0;
       }
     }

     strcpy(buf1, "\tret ");
     strcat(buf1, xx);    
     strcat(buf1, " ;");
     strcat(buf1, buf);
     WRITE1();
     return 1;
   }
   else if (to1 != to2)
   {					// jp target changed!
     strcpy(q, Labels[to2].label);
     strcat(q, " ; ");
     strcat(q, buf);
     strcat(q, "\n");
     WRITE1();
     return 1;
   }
 }

 return 0;
}

void Pass3(void)
{
 if (HandleJp())
   return;

 if ((p = FindString("jp nz, c")) && (Labels[SearchLabel(p+7, 0xA)].refs == 1))
 {
   strncpy(jpnzaddr, p+7, LABEL_SIZE);
   jpnzaddr[LABEL_SIZE] = 0;
   READ(buf2);

   if (!rindex(buf2, ',') && (p = strstr(buf2, "\tjp c")))
   {
     strncpy(jpaddr, p+4, LABEL_SIZE);
     jpaddr[LABEL_SIZE] = 0;
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;
       
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
   else if (p = strstr(buf2, "\tcall f"))
   {
     memcpy(fyyy, p+6, strlen(p+6)-1);
     fyyy[strlen(p+6)-1] = 0;
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;

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
   else if (p = strstr(buf2, "\tret"))
   {
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;

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
 else if ((p = FindString("\tjp z, c")) && (Labels[SearchLabel(p+6, 0xA)].refs == 1))
 {
   strncpy(jpzaddr, p+7, LABEL_SIZE);
   jpzaddr[LABEL_SIZE] = 0;
   READ(buf2);

   if (!rindex(buf2, ',') && (p = strstr(buf2, "\tjp c")))
   {
     strncpy(jpaddr, p+4, LABEL_SIZE);
     jpaddr[LABEL_SIZE] = 0;
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;
       
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
   else if (p = strstr(buf2, "\tcall f"))
   {
     memcpy(fyyy, p+6, strlen(p+6)-1);
     fyyy[strlen(p+6)-1] = 0;
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;

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
   else if (p = strstr(buf2, "\tret"))
   {
     READ(buf3);

     if ((buf3[0] == 'c') && rindex(buf3, ':'))
     {
       strncpy(addr, buf3, LABEL_SIZE);
       addr[LABEL_SIZE] = 0;

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

  if (argc == 4)
    Optimize = 1;

  if (argc < 3)
  {
    printf("Invalid parameters!\nUsage is: cowfix in_file out_file [-O]\n");
    exit(1);
  }

  if (!(in = fopen(argv[1], "r")))
  {
    printf("Cannot open input file!\n");
    exit(1);
  }

  if (!(out = fopen(Optimize ? "cowfix.$$$" : argv[2], "w")))
  {
    printf("Cannot open output file!\n");
    exit(1);
  }

  if (Optimize)
  {
    // First pass : gather labels related info & load/store related info
    //printf("PASS 1\n");

    BuildLabelTable();

    fclose(in);

    // Second pass : apply optimizations #1
    //printf("PASS 2\n");

    InSubroutine = 0;
    CrtSubIndex = 0;
    LineCounter = 0;

    in = fopen(argv[1], "r");
  }

  fgets(buf1, 512, in); //skip "org 100h"
  LineCounter++;
  fgets(buf1, 512, in); //skip "lxi sp,TOP+128"
  LineCounter++;

  fputs("\tpsect text\n", out); //write "psect text"
  fputs("\tld sp,TOPSTACK\n", out); //write first line

  while (s = fgets(buf1, 512, in))
  {
    if (Optimize)
      LineCounter++;

    //printf("line %d: %s\n", LineCounter, buf1);

    if (!strncmp(s, "\tdb", 3))
    {
      while (strlen(buf1) > 128)
      {					//line too long
	p = buf1 + 128;

        while (*p != ',') p--;		// find first previous ','
					// then split line
	strcpy(buf2, "\tdb ");
	strcat(buf2, p+1);

	*p++ = '\n';
	*p = 0;

	fputs(buf1, out);

	strcpy(buf1, buf2);
      }

      fputs(buf1, out);

      if (Optimize)
        LabelListIndex = 0;

      continue;
    }

    if (Optimize && SearchLdLdRet(LineCounter))	
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
      LabelListIndex = 0;
      continue;
    }

    n = CheckLine(s);

    if (n == 1)
      break;
    else if (n == 2)
      continue;

    fputs(buf1, out);
  }

  fputs("\tglobal _exit\n", out);
  fputs("_exit: rst 0\n", out);

  fgets(buf1, 512, in); //skip "ws equ TOP+128"
  fgets(buf1, 512, in); //read "LOMEM equ ws+..."

  fputs("\tpsect data\n", out);
  fputs("ws:\n", out);

  strcpy(buf2, "\tdefs ");
  strcat(buf2, buf1+13);
  fputs(buf2, out);

  fputs("\tpsect bss\n", out);
  fputs("\tdefs 128\n", out);
  fputs("TOPSTACK:\n", out);

  fclose(in);
  fclose(out);

  if (Optimize)
  {
    // Third pass : apply optimizations #2
    //printf("PASS 3\n");

    in = fopen("cowfix.$$$", "r");
    out = fopen(argv[2], "w");

    n = 1;

    while (s = fgets(buf1, 512, in))
    {
      //printf("line %d: %s\n", n++, buf1);
      //skip commented lines
      if (buf1[0] != ';')
        Pass3();
      else
        fputs(buf1, out);
    }

    fclose(in);
    fclose(out);

    remove("cowfix.$$$");
  }

  exit(0);
}
