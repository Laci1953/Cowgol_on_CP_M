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
// - replace 'call routine, ret' with 'jp routine' (where possible...)
//
// 		Szilagyi Ladislau, 2023-2024
//

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <conio.h>

char* rindex(char*, char);

FILE *in;
FILE *out;
char buffer[512];
char buftmp[512];
char *s, *p, *q;

int LineCounter = 0;

#define MAX_LABELS_COUNT 2000
char Labels[MAX_LABELS_COUNT][9];	//labels : cxxx_nnnn:
int LabelsCount = 0;

#define MAX_ENDLABELS_COUNT 500
char EndLabels[MAX_ENDLABELS_COUNT][9];	//endlabels : end_fnnn
int EndLabelsCount = 0;

int EndCalls[MAX_ENDLABELS_COUNT];
int EndCallsCount = 0;

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

char Workspace[6];
int CrtSubIndex;
char InSubroutine;
char WaitingRet;
char AfterCallCounter;
char Endf;
int PushPopCounter;
char CallReplacedByJp;

// Pass 1 ---------------------------------------------------------------------------------

//- Optimization of store statements ---------------------------------------------------------------

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
    printf("Too many stores!\r\n");
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
    printf("Too many loads!\r\n");
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
    printf("Too many removes!\r\n");
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

//- Removal of unused labels ---------------------------------------------------------------

char *strstr(register char *string, char* substring)
{
    char *a, *b;

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

  tmp = buftmp;

  while (*l != terminator)
    *tmp++ = *l++;

  *tmp = 0;

  for (n = 0; n < LabelsCount; n++)
  {
    if (strcmp(buftmp, Labels[n]) == 0)
    {
      //printf("found label %s\n", buftmp);
      return n;
    }
  }

  return -1;
}

void AddLabel(char* p, char terminator)
{
  int n;

  if (SearchLabel(p, terminator) == -1)
  {
    if (LabelsCount == MAX_LABELS_COUNT)
    {
      printf("Too many local labels!\r\n");
      exit(1);
    }

    //printf("defining label ");

    for (n = 0; n < 8; n++)
    {
      if (*p == terminator)
        break;

      Labels[LabelsCount][n] = *p;
      //putch(*p);
      p++;
    }

    //putch('\r'); putch('\n');

    Labels[LabelsCount][n] = 0;

    LabelsCount++;
  }
}

// identify real labels
void BuildLabelTable(void)
{
  int n;
  char tmp[6];

  CrtToRemoveIndex = 0;
  CrtSubIndex = 0;
  InSubroutine = 0;
  WaitingRet = 0;
  AfterCallCounter = 0;
  Endf = 0;

  while (s = fgets(buffer, 512, in))
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
          printf("Too many jp to end_f!\r\n");
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
      }
      else if (strstr(s, "push "))
        PushPopCounter++;
      else if (strstr(s, "pop bc"))	//routine probably was called with params, forbid call-ret substitution 
        PushPopCounter = 100;
      else if (strstr(s, "pop "))
        PushPopCounter--;
      else if (strstr(s, "call "))
        AfterCallCounter = 3;
      else if (AfterCallCounter && (p = strstr(s, "ld (")) && (p = strstr(p, "ws+")))
      {
        p = p + 3;
        Normalize(p);

        if (!strstr(p, ",a"))						// if ld (ws+nnnn),rr
          NormalizedAscii[0] = '9';

        PutInStore(NormalizedAscii);
      }
      else if ((p = strstr(s, "ld ")) && (p = strstr(p, ", (")) && (p = strstr(p, "ws+")))
      {
        p = p + 3;
        PutInLoad(Normalize(p));
      }
      else if (WaitingRet)
      {
        if (strstr(s, "ret"))
        {
          WaitingRet = 0;

          if (Endf && (PushPopCounter == 0) && (AfterCallCounter == 1))		// statements were call, end_f:, ret
          {									// and push-pop counter is 0
            if (EndCallsCount == MAX_ENDLABELS_COUNT)
            {
              printf("Too many calls before end_f!\r\n");
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

          CrtSubIndex++;
          InSubroutine = 0;
        }
      }
      else if (AfterCallCounter == 2)
        PushPopCounter = 0;
    }
    else if (!strstr(s, "__main") && (p = strstr(s, "workspace at ")))		// workspace at ws+nnn...
    {
      InSubroutine = 1;
      CrtStoreIndex = 0;
      CrtLoadIndex = 0;
      Endf = 0;
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
char CheckLabels(char* s)
{
    // dump all unreferenced labels...
    if ( (*s == 'c') && rindex(s, ':') )
    {
      if (SearchLabel(s, ':') == -1)
      {				//if not referenced
        //printf("dropping label %s\n", buftmp);
        return (char)1; 		//dump current line...
      }
    }

    return (char)0;
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

// returns 1 = break(quit reading file), 2 = continue(do not write current line), else 0
int CheckLine(char* s)
{
    long l;
    short low,high;

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

      fputs(buffer, out);		// write the jp cc,1f
      s = fgets(buffer, 512, in);	// then read the next line
      LineCounter++;

      if (p = strstr(s, "0x"))		// check for 0x
      {
        *(p + 1) = *(p + 2);
        *(p + 2) = *(p + 3);
        *(p + 3) = 'h';
      }

      fputs(buffer, out);		// write-it
      fputs("1:\r\n", out);		// then write a '1:' line	
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
    }
    //push, pop b,d,h ---> push, pop bc,de,hl
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
    //jr ---> jp 
    else if (p = strstr(s, "jr "))
    {
      *(p + 1) = 'p';
    }
    //0xNN ---> 0NNh
    else if (p = strstr(s, "0x"))
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
      {					// replace call with jp
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
      CrtSubIndex++;
      InSubroutine = 0;

      strcpy(buftmp, s);
      buftmp[8] = 0;

      if (!SearchEndLabel(buftmp))
        return 2;
    }
    else if (CallReplacedByJp && strstr(s, "ret"))
      return 2;

    if (p = strstr(s, "workspace at "))				// workspace at ws+nnn...
    {
      InSubroutine = 1;
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

    return 0;
}

int main(int argc, char*argv[])
{
  int n;

  if (argc != 3)
  {
    printf("Invalid parameters!\r\nUsage is: cowfix in_file out_file\r\n");
    exit(1);
  }

  if (!(in = fopen(argv[1], "r")))
  {
    printf("Cannot open input file!\r\n");
    exit(1);
  }

  if (!(out = fopen(argv[2], "w")))
  {
    printf("Cannot open output file!\r\n");
    exit(1);
  }

  // First pass : gather labels related info & load/store related info
  //printf("PASS 1\n");

  BuildLabelTable();

  // Second pass : apply optimizations
  //printf("PASS 2\n");

  InSubroutine = 0;
  CrtSubIndex = 0;
  LineCounter = 0;

  fclose(in);
  in = fopen(argv[1], "r");

  fgets(buffer, 512, in); //skip "org 100h"
  LineCounter++;
  fgets(buffer, 512, in); //skip "lxi sp,TOP+128"
  LineCounter++;

  fputs("psect text\n", out); //write "psect text"
  fputs("ld sp,TOPSTACK\n", out); //write first line

  while (s = fgets(buffer, 512, in))
  {
    LineCounter++;

    if (!strncmp(s, "\tdb", 3))
    {
      while (strlen(buffer) > 128)
      {					//line too long
	p = buffer + 128;

        while (*p != ',') p--;		// find first previous ','
					// then split line
	strcpy(buftmp, "db ");
	strcat(buftmp, p+1);

	*p++ = '\n';
	*p = 0;

	fputs(buffer, out);

	strcpy(buffer, buftmp);
      }

      fputs(buffer, out);

      continue;
    }

    if (CheckLabels(s) == (char)1)
      continue;

    n = CheckLine(s);

    if (n == 1)
      break;
    else if (n == 2)
      continue;

    fputs(buffer, out);
  }

  fputs("global _exit\n", out);
  fputs("_exit: rst 0\n", out);

  fgets(buffer, 512, in); //skip "ws equ TOP+128"
  fgets(buffer, 512, in); //read "LOMEM equ ws+..."

  fputs("psect data\n", out);
  fputs("ws:\n", out);

  strcpy(buftmp, "defs ");
  strcat(buftmp, buffer+13);
  fputs(buftmp, out);

  fputs("psect bss\n", out);
  fputs("defs 128\n", out);
  fputs("TOPSTACK:\n", out);

  fclose(in);
  fclose(out);

  exit(0);
}
