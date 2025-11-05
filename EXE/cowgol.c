/*
 *      Copyright (C) 1984-1897 HI-TECH SOFTWARE
 *
 *      This software remains the property of HI-TECH SOFTWARE and is
 *      supplied under licence only. The use of this software is
 *      permitted under the terms of that licence only. Copying of
 *      this software except for the purpose of making backup or
 *      working copies for the use of the licensee on a single
 *      processor is prohibited.
 *
 *      Adapted for use with Cowgol
 *      by Ladislau Szilagyi, November 2023
 *
 */
#include        <stdio.h>
#include        <ctype.h>
#include        <cpm.h>
#include        <exec.h>
#include        <stat.h>

/*
 *      COWGOL command
 *      CP/M-Z80 version
 *
 *      COWGOL [-C] [-Mfile] [-Lfile] [-Tfile] [-O] [-S] [-X] [-B] file1.ext [...filen.ext ]
 *
 *	where ext = cow | c | as | obj | coo
 *
 *	First source file must be a .cow file
 *
 *	The 'main' cowgol file must be the last .cow file 
 */

#define DFCB    ((struct fcb *)0x5C)

#define MAXLIST 60              /* max arg list */
#define BIGLIST 120             /* room for much more */

#define HITECH  "HITECH"
#define PROMPT  "c"
#define TEMP    "TMP"
#define DEFPATH "0:A:"
#define DEFTMP  ""

#define LIBSUFF ".LIB"          /* -L linker library file suffix */
#define SYMSUFF ".SYM"		/* -T linker symbols list file suffix */
#define MAPSUFF ".MAP"		/* -M linker map file suffix */

#define LFLAGS          "-Z"
#define STDLIB          "COW"

#define SYMBOLS		"$SUBSYMS.$$$"

static char     keep,           /* retain .obj files, don't link */
                verbose=1,      /* verbose - echo all commands */
                nolocal,        /* strip local symbols */
		symbols = 0,	/* symbols list */
		bigstack = 0,   /* big stack */
		smallram = 0;	/* only 64 KB RAM */

static char*   iuds[MAXLIST],  /* -[IUD] args to preprocessor */
            *   objs[MAXLIST],  /* .obj files and others for linker */
            *   flgs[BIGLIST],  /* flags etc for linker */
            *   libs[MAXLIST],  /* .lib files for linker */
            *   coos[MAXLIST],  /* .coo files for cowlink */
            *   c_as[MAXLIST];  /* .c files to compile or .as to assemble */

static uchar    iud_idx,        /* index into uids[] */
                obj_idx,        /*   "     "  objs[] */
                flg_idx,        /*   "     "  flgs[] */
                lib_idx,        /*   "     "  libs[] */
                c_idx,          /*   "     "  coos[] */
                c_as_idx;       /*   "     "  c_as[] */

//CPP -> COWFE
//P1 -> COWBE
//CGEN -> dropped
//OPTIM -> dropped

static char*   paths[] =
{
        "LINK",
        "COWLINK",              //was OBJTOHEX
        "COWFIX",               //was CGEN
        "OPTIM",                //not used
        "COWFE",                //was CPP
        "Z80AS",                //was ZAS
        "LIB",
        "COWBE",                //was P1
        " ",                    //was CRTCPM.OBJ
        "$EXEC",
	"CPP",
	"P1",
	"CGEN"
};

#define linker  paths[0]
#define cowlink paths[1]        //COWLINK
#define cowfix  paths[2]        //COWFIX
#define optim   paths[3]
#define cowfe   paths[4]        //COWFE
#define assem   paths[5]
#define libpath paths[6]
#define cowbe   paths[7]        //COWBE
#define strtoff paths[8]
#define execprg paths[9]
#define cref    paths[10]       //dropped
#define cpp     paths[10]
#define pass1   paths[11]
#define cgen    paths[12]

static char*   cppdef[] = { " " };
static char*   cpppath = " ";

#define RELSTRT strtoff[plen]

static char*   temps[] =
{
        "$CTMP1.$$$",
        "$CTMP2.$$$",
        "$CTMP3.$$$",
        "$CTMP4.$$$",
        "L.OBJ",
        "$$EXEC.$$$"
};

#define tmpf1           temps[0]
#define tmpf2           temps[1]
#define tmpf3           temps[2]
#define redname         temps[3]
#define l_dot_obj       temps[4]
#define execmd          temps[5]

static char     tmpbuf[128];    /* gen. purpose buffer */
static char     single[40];     /* single object file to be deleted */
static char     coosingle[40];  /* single coo object file to be deleted */
static short    nfiles=0;       /* number of source files */
static short	ncfiles=0;	/* number of C source files */
static char*   comfile;        /* -Ofilename.COM */
static char*	objfile;	/* filename.OBJ */ 
static char*	objofile;	/* -Ofilename.OBJ */ 
static FILE *   cmdfile;        /* command file */
static short    plen;           /* length of path */
static char     ebuf[22];       /* error listing file */

static struct stat      statbuf;

char Optimize = 0;

extern char*   malloc(),
            *   getenv(),
            *   fcbname(),
            *   rindex(),
            *   strcat(),
            *   strcpy();
extern char**  _getargs();
extern int      strlen(),
                strcmp(),
                strncmp(),
                dup();

static char*   xalloc();

main(argc, argv)
char** argv;
{
        register char* cp, * xp;
        short           i;

        fprintf(stderr, "COWGOL COMPILER (CP/M-80) V2.0\n");
        fprintf(stderr, "Copyright (C) David Given\n");

        if(argc == 1)
                argv = _getargs((char*)0, PROMPT);

        setup();

        while(*++argv) {
                if((argv)[0][0] == '-') {
                        if(islower(i = argv[0][1]))
                                argv[0][1] = i = toupper(i);
                        switch(i) {
			case 'B':
				smallram = 1;
				break;
			case 'T':
				addsym(&argv[0][2]);
				break;
			case 'S':
				symbols = 1;
				break;
			case 'O':
				Optimize = 1;
				break;
                        case 'C':
                                keep = 1;
                                break;
                        case 'M':
				addmap(&argv[0][2]);
                                break;
                        case 'L':
                                addlib(&argv[0][2]);
                                break;
			case 'X':
				bigstack = 1;
				break;
                        default:
                                fprintf(stderr, "Unknown flag %s\n", argv[0]);
                                exit(1);
                        }
                        continue;
                }
                
                cp = argv[0];

                while(*cp) {
                        if(islower(*cp))
                                *cp = toupper(*cp);
                        cp++;
                }

                cp = rindex(argv[0], '.');

                if(cp && ( strcmp(cp, ".COW") == 0 ||
			   strcmp(cp, ".AS") == 0  || 
			   strcmp(cp, ".C") == 0   ||
			   strcmp(cp, ".OBJ") == 0 ||
			   strcmp(cp, ".COO") == 0 ) )
                {
                        if(xp = rindex(argv[0], ':'))
                                xp++;
                        else
                                xp = argv[0];

                        if (strcmp(cp, ".AS") == 0 || strcmp(cp, ".C") == 0)
                        {
				nfiles++;

				if (strcmp(cp, ".C") == 0)
					ncfiles++;

				c_as[c_as_idx++] = argv[0];

                                if (nfiles == 1)
                                {
                                        fprintf(stderr, "First source file must be a Cowgol file!\n");
                                        exit(1);
                                }

                                *cp = 0;
                                strcat(strcpy(tmpbuf, xp), ".OBJ");
                                addobj(tmpbuf);
                                strcpy(single, tmpbuf);
                        }
                        else if (strcmp(cp, ".COW") == 0)
                        {       
				nfiles++;
				c_as[c_as_idx++] = argv[0];
                                *cp = 0;
                                strcat(strcpy(tmpbuf, xp), ".COO");
                                addcoo(tmpbuf);
                                strcpy(coosingle, tmpbuf);
                        }
			else if (strcmp(cp, ".OBJ") == 0)
			{
				addobj(xp);
			}
			else
			{	//.COO
				addcoo(xp);
			}

                        *cp = '.';
                }
                else
                {
                        fprintf(stderr, "Wrong source file type!\n");
                        exit(1);
                }
        }

        doit();
}

setup()
{
        register char* cp;
        short           i, len;

        if(!(cp = getenv(HITECH)))
                if(stat("COWFE.COM", &statbuf) >= 0)
                        cp = "";
                else
                        cp = DEFPATH;
        plen = strlen(cp);
        cpppath = strcat(strcpy(xalloc(plen+strlen(cpppath)+1), cpppath), cp);

        for(i = 0 ; i < sizeof paths/sizeof paths[0] ; i++)
                paths[i] = strcat(strcpy(xalloc(plen+strlen(paths[i])+1), cp), paths[i]);

        if(cp = getenv(TEMP)) {
                len = strlen(cp);
                for(i = 0 ; i < sizeof temps/sizeof temps[0] ; i++)
                        temps[i] = strcat(strcpy(xalloc(len+strlen(temps[i])+1), cp), temps[i]);
        }

        if(strcmp(fcbname(fileno(stdout)), "CON:")) {   /* redirect errors */
                strcat(strcpy(ebuf, "-E"), fcbname(fileno(stdout)));
                close(fileno(stdout));
                stdout->_file = dup(fileno(stderr));
        }

        objs[0] = strtoff;
        obj_idx = 1;
        flgs[0] = LFLAGS;
        flg_idx = 1;

        for(i = 0 ; i < sizeof cppdef/sizeof cppdef[0] ; i++)
                iuds[i] = cppdef[i];

        iud_idx = i;
        lib_idx = 0;
        c_idx = 0;
        single[0] = coosingle[0] = 0;
}

doit()
{
        register char* cp;
        register uchar  i,j;
        char*  vec[MAXLIST];

        iuds[iud_idx++] = cpppath;

        if(!(cmdfile = fopen(execmd, "wb")))
                error("Can't create temporary file %s", execmd);

        put_cmd(SKP_ERR);

        if(verbose)
                put_cmd(ECHO);

        for(i = 0 ; i < c_as_idx ; i++)
        {
                cp = rindex(c_as[i], '.');

                if(strcmp(cp, ".COW") == 0)
                        compilew(c_as[i]);
		else if (strcmp(cp, ".C") == 0)
                        compilec(c_as[i]);
                else
                        assemble(c_as[i]);

                put_cmd(TRAP);
        }

	if (ncfiles)
	{
        	rm(RM_FILE, tmpf1);
        	rm(RM_FILE, tmpf2);
	}

        if(!keep) {
                i = 0;
                vec[i++] = "COWGOL.COO";

                for (j = 0; j < c_idx; j++)
                        vec[i++] = coos[j];

                vec[i++] = "-o";
                vec[i++] = tmpf1;

		if (symbols)
			vec[i++] = "-S";

                vec[i] = (char*)0;
                doexec(cowlink, vec);     //COWLINK cowgol.coo *.coo -o tmpf1 [-S]

//                put_cmd(TRAP);

//                for (j = 0; j < c_idx; j++)
//                        rm(RM_FILE, coos[j]);

                i = 0;
                vec[i++] = tmpf1;
                vec[i++] = tmpf2;

		if (Optimize)
			vec[i++] = "-O";

		if (bigstack)
			vec[i++] = "-S";

                vec[i] = (char*)0;
                doexec(cowfix, vec);      //COWFIX tmpf1 tmpf2 [-O] [-S]

                rm(RM_FILE, tmpf1);

//                put_cmd(TRAP);

                i = 0;

                if(nolocal)
                        vec[i++] = "-X";

                vec[i++] = "-J";
                vec[i++] = "-N";
                vec[i++] = objofile; // -Ofirstname.OBJ
                vec[i++] = tmpf2;
                vec[i] = (char*)0;
                doexec(assem, vec);     //Z80AS -J -N -Ofirstname.obj tmpf2

                rm(RM_FILE, tmpf2);

//                put_cmd(TRAP);

                flgs[flg_idx++] = "-Ptext=100H,data,bss";
                flgs[flg_idx++] = "-C100H";

                flgs[flg_idx++] = comfile; //-Ofirstname.com
                flgs[flg_idx++] = objfile; // firstname.OBJ

                for(i = 0 ; i < obj_idx ; i++)
                        flgs[flg_idx++] = objs[i];

//              addlib(STDLIB);

                for(i = 0 ; i < lib_idx ; i++)
                        flgs[flg_idx++] = libs[i];

                flgs[flg_idx] = 0;
//                put_cmd(IF_NERR);
                doexec(linker, flgs);   //LINK -Ptext=100H,data,bss -C100H -Ofirstname.com firstname.obj *.obj

		if (symbols)
			rm(RM_FILE, SYMBOLS);

//                if(single[0])
//                        rm(RM_FILE, single);

//                if(coosingle[0])
//                        rm(RM_FILE, coosingle);
        }

//        put_cmd(TRAP);
        rm(RM_EXIT, execmd);
        fclose(cmdfile);
        fclose(stdout);
        fclose(stdin);
        setfcb(DFCB, execmd);
        execl(execprg, execprg, execmd, (char*)0);
        error("Can't execute %s", execprg);
}

rm(type, file)
char*  file;
{
        char    buf[40];

        if(verbose) {
                strcat(strcpy(buf, "ERA "), file);
                print(buf);
        }

        setfcb(DFCB, file);
        putc(type, cmdfile);
        putc(16, cmdfile);
        fwrite(DFCB, 1, 16, cmdfile);
}

print(s)
char*  s;
{
        putc(PRINT, cmdfile);
        putc(strlen(s), cmdfile);
        fputs(s, cmdfile);
}

put_cmd(i)
{
        putc(i, cmdfile);
        putc(0, cmdfile);
}

addobj(s)
char*  s;
{
        char*  cp;

        cp = xalloc(strlen(s)+1);
        strcpy(cp, s);
        objs[obj_idx++] = cp;
}

addcoo(s)
char* s;
{
        char*  cp;
        uchar   len;

        if(cp = rindex(s, '.'))
                len = cp - s;
        else
                len = strlen(s);

	if (nfiles == 1)//first .COW file will set the name of the executable being built
	{
               	cp = xalloc(len + strlen("-O.COM") + 1);
               	strncat(strcpy(cp, "-O"), s, len);
               	strcpy(cp+len+2, ".COM");
               	comfile = cp;
		
		cp = xalloc(len + strlen(".OBJ") + 1);
		strncpy(cp, s, len);
		cp[len] = 0;
		strcat(cp, ".OBJ");
		objfile = cp;

                cp = xalloc(len + strlen("-O.OBJ") + 1);
       	        strncat(strcpy(cp, "-O"), s, len);
                strcpy(cp+len+2, ".OBJ");
       	        objofile = cp;
	}

        cp = xalloc(strlen(s)+1);
        strcpy(cp, s);
	strcpy(rindex(cp, '.'), ".COO");
        coos[c_idx++] = cp;
}

addlib(s)
char*  s;
{
        char*  cp;

	strcpy(tmpbuf, s);
        strcat(tmpbuf, LIBSUFF);
        cp = xalloc(strlen(tmpbuf)+1);
        strcpy(cp, tmpbuf);
        libs[lib_idx++] = cp;
}

addsym(s)
char*  s;
{
        char*  cp;

	strcpy(tmpbuf, "-D");
	strcat(tmpbuf, s);
        strcat(tmpbuf, SYMSUFF);
        cp = xalloc(strlen(tmpbuf)+1);
        strcpy(cp, tmpbuf);
        flgs[flg_idx++] = cp;
}

addmap(s)
char*  s;
{
        char*  cp;

	strcpy(tmpbuf, "-M");
	strcat(tmpbuf, s);
        strcat(tmpbuf, MAPSUFF);
        cp = xalloc(strlen(tmpbuf)+1);
        strcpy(cp, tmpbuf);
        flgs[flg_idx++] = cp;
}

error(s, a)
char*  s;
{
        fprintf(stderr, s, a);
        exit(1);
}

static char*
xalloc(s)
short   s;
{
        register char* cp;

        if(!(cp = malloc(s)))
                error("Out of memory");

        return cp;
}

upcase(s)
register char* s;
{
        while(*s) {
                if(*s >= 'a' && *s <= 'z')
                        *s -= 'a'-'A';
                s++;
        }
}

doexec(name, vec)
char*  name;
char** vec;
{
        uchar   len;
        char** pvec;
        char*  redir[2];
        char    redbuf[20];
        FILE *  cfile;
        static short    redno;
        char    xbuf[130];

        pvec = vec;
        len = 0;
        redbuf[0] = 0;

        while(*pvec)
                len += strlen(*pvec++)+1;

        if(len > 124) {
                sprintf(xbuf, redname, ++redno);

                if(!(cfile = fopen(xbuf, "w")))
                        error("Can't create %s", xbuf);

                len = 0;

                while(*vec) {
                        len += strlen(*vec);
                        fprintf(cfile, "%s ", *vec++);

                        if(len > 126) {
                                len = 0;
                                fprintf(cfile, "\\\n");
                        }
                }

                fputc('\n', cfile);
                fclose(cfile);
                redir[1] = (char*)0;
                sprintf(redbuf, "<%s", xbuf);
                redir[0] = redbuf;
                vec = redir;
        }

        xbuf[0] = 0;

        while(*vec)
                strcat(strcat(xbuf, " "), *vec++);

        len = strlen(xbuf);
        putc(EXEC, cmdfile);
        putc(len+50, cmdfile);
        setfcb(DFCB, name);
        strcpy(DFCB->ft, "COM");
        DFCB->nr = 0;
        putc(DFCB->uid, cmdfile);
        fwrite(DFCB, 1, 16, cmdfile);
        setfcb(DFCB, &xbuf[1]);
        DFCB->nr = 0;
        fwrite(DFCB, 1, 32, cmdfile);
        putc(len, cmdfile);
        fwrite(xbuf, 1, len, cmdfile);

        if(redbuf[0])
                rm(RM_FILE, &redbuf[1]);
}

assemble(s)
char*  s;
{
        char*  vec[5];
        char    buf[80];
        char*  cp;
        uchar   i;

        if(c_as_idx > 1)
                print(s);
        i = 0;

        vec[i++] = "-J";

        if(nolocal)
                vec[i++] = "-X";

        if(cp = rindex(s, ':'))
                cp++;
        else
                cp = s;

        strcat(strcpy(buf, "-O"), cp);

        if(rindex(buf, '.'))
                *rindex(buf, '.') = 0;

        strcat(buf, ".OBJ");
        vec[i++] = buf;
        vec[i++] = s;
        vec[i] = (char*)0;
        doexec(assem, vec);
}

compilew(s)
char*  s;
{
        register char* cp;
        uchar   i, j;
        char*  vec[MAXLIST];
        char    buf[80];

        if(c_as_idx > 1)
                print(s);

        for(j = 0; j < iud_idx ; j++)
                vec[j] = iuds[j];

	if (smallram)
	{
		vec[j++] = s;
		vec[j] = (char*)0;
		doexec("COWFE1", vec);	//COWFE1
		put_cmd(TRAP);

        	for(j = 0; j < iud_idx ; j++)
                	vec[j] = iuds[j];

		vec[j++] = tmpf1;
		vec[j] = (char*)0;
		doexec("COWFE2", vec);	//COWFE2

		rm(RM_FILE, "COWFE.$$$");
	}
	else
	{
	        vec[j++] = s;
        	vec[j++] = tmpf1;

		if (symbols && !keep)
			vec[j++] = "-S";

        	vec[j] = (char*)0;
        	doexec(cowfe, vec);       //COWFE

        	put_cmd(TRAP);
	}

        i = 0;
        vec[i++] = tmpf1;

        if(cp = rindex(s, ':'))
                cp++;
        else
                cp = s;

        strcpy(buf, cp);

        if(rindex(buf, '.'))
                *rindex(buf, '.') = 0;

        strcat(buf, ".COO");
        vec[i++] = buf;
        vec[i++] = (char*)0;
        doexec(cowbe, vec);     //COWBE
}

compilec(s)
char*	s;
{
	register char*	cp;
	uchar	i, j;
	char*	vec[MAXLIST];

	if(c_as_idx > 1)
		print(s);

        j = 0;
	vec[j++] = "-DCPM";
	vec[j++] = "-DHI_TECH_C";
	vec[j++] = "-Dz80";
	vec[j++] = "-I";
	vec[j++] = s;
	vec[j++] = tmpf1;
	vec[j] = (char*)0;
	doexec(cpp, vec);

	if(cp = rindex(s, ':'))
		s = cp+1;

	*rindex(s, '.') = 0;
	i = 0;
	vec[i++] = tmpf1;
	vec[i++] = tmpf2;
	vec[i++] = tmpf3;
	vec[i++] = (char*)0;
	doexec(pass1, vec);
	vec[0] = tmpf2;
	vec[1] = tmpf1;
	vec[2] = (char*)0;
	doexec(cgen, vec);
	vec[0] = tmpf1;
	vec[1] = tmpf2;
	vec[2] = (char*)0;
	doexec(optim, vec);
	i=0;	

        if(nolocal)
		vec[i++] = "-X";

	vec[i++] = "-J";
	vec[i++] = "-N";
	vec[i++] = strcat(strcat(strcpy(tmpbuf, "-o"), s), ".OBJ");
	vec[i++] = tmpf2;
	vec[i] = (char*)0;
	doexec(assem, vec);
}
