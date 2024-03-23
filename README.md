# Cowgol_on_CP_M
Cowgol, C & assembler development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------
(updated on March 13, 2024)

You will find here a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

Cowgol is a programming language for very small systems, including Z80 computers ( see https://github.com/davidgiven/cowgol ).

A small Cowgol programming language manual is included.

To compile Cowgol source files (and, optionally, C and assembler files), or to build an executable starting from Cowgol source files (and, optionally, C & assembler files), the following command is used:

COWGOL [-C] [-Mmapfile] [-Lfile] [-O] source1.cow [ source2.cow | source.c | source.as ] ...

More than one source file may be specified (with extensions: .cow = cowgol source file, .c = C source file, .as = assembler source file)

The first file must be a Cowgol source file.

If more than one Cowgol source files are used, the first one will give the name of the executable being built, but the last one must contain the 'main' code.

C and assembler routines may be called from the cowgol source files.

If you want just to compile/assemble the files, the option -C must be used. 

If the option -C is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first file in the list).

The option -Mmapfile builds a memory map for the executable.

The option -Lfile adds the file "libfile.lib" to the list of files used as input by the LINK linker.

The option -O instructs COWFIX to perform various code optimizations in the file that will be assembled by Z80AS. 
This may help also in case of big Cowgol programs, by letting COWFIX to comment-out unused labels and allowing Z80AS to process very large source files.

HiTech's LINK is used to link the object files and build the final executable.

The following executables are needed:
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler, who launches all the subsequent executables from the Cowgol toolchain
 - COWGOL.COM (a modified variant of the HiTech's C.COM), the component that interprets the command line and feeds into $EXEC run requests for the subsequent executables from the Cowgol toolchain
 - COWFE.COM , the "cowgol front end", who parses the source file, part of the Cowgol compiler, optimized 
 - COWBE.COM , the "cowgol back end", who builds the "cowgol object file", part of the Cowgol compiler, optimized
 - COWLINK.COM , the "cowgol linker", who binds all the "cowgol object files" and outputs a Z80 assembler file, part of the Cowgol compiler, optimized
 - COWFIX.COM , interface to Z80AS , who transforms the Cowlink output to a syntax accepted by Z80AS and performs code optimizations
 - Z80AS.COM ( see https://github.com/Laci1953/Z80AS ), the assembler, who assembles the output of Cowfix and any assembler file included in the command line, producing HiTech compatible object files
 - LINK.COM , the HiTech's linker, who builds the final executable, using as input the object files and, if requested, the library file and producing the final executable
 - CPP.COM , the HiTech's C pre-processor (needed only when C source files will be compiled), modified to accept // - style comments
 - P1.COM , the HiTech's C compiler pass 1 (needed only when C source files will be compiled)
 - CGEN.COM , the HiTech's C compiler pass 2 (needed only when C source files will be compiled)
 - OPTIM.COM , the HiTech's C compiler optimizer (needed only when C source files will be compiled)

Also, the library file "cowgol.coo" must be present.

The EXE folder contains the all the needed executables (as HEX files, ready to be LOAD-ed) and the source files for the Cowgol command line processor (cowgol.c) and for Cowfix(cowfix.c and fix.as).

The INCLUDE folder contains the include files and the library file cowgol.coo

The GAMES folder contains some old computer games, rewritten in Cowgol.

The EXAMPLES folder contains examples of compilation sessions.

# Optimized Cowgol executables
------------------------------

The COWFE, COWBE and COWLINK contained in the EXE folder are optimized versions of the originals.

You may find in the "Optimized compiler" folder the modified assembler source files of these executables.

In the source files, you will notice a lot of comments (lines containing ";" )

These are inserted by Cowfix to show what changes he made to the original source file.

Examples:

1.

;	jp nz, c01_000c

;	ret

;c01_000c:

        ret z

means that the 3 statements "commented-out" were replaced by "ret z".

2.

 ; print_nl workspace at ws+1432 length ws+0

f10_print_nl:

        ld a,10

        jp   f7_print_char ;	call f7_print_char

;end_f10_print_nl:

;	ret

means that the lines 

	call f7_print_char

        ret

were substituted by the line "jp   f7_print_char"

3.

        jp nz, c01_0014 ; c01_001f

...

c01_001f:

        jp c01_0014

means that the jump-to-jump c01_001f --> c01_0014

	jp nz, c01_001f

...

c01_001f:

       jp c01_0014

was solved by inserting the correct final jump address " jp nz, c01_0014"

4.

        call f11_UIToA

;	ld (ws+1450), hl

;	ld (ws+1452), hl

means that the two "ld" instructions were "commented out", because the addresses ws+1450 and ws+1452 are never accessed for read.

5.

        ...

        sbc hl,de

;	ld (ws+1414), hl

;end_f32_StrLen:

;	ld hl, (ws+1414)

        ret

means that the two "ld" were commented out, they are useless, because the routine just wants to return HL...

6.

         ...

         jp nc, c01_00c3

;c01_00c2:

         ld de,4

         ...

means that "c01_00c2" was commented out, because it's a "dead" label (no jumps or calls are directed to this label)

The gain is significant:

- smaller size (e.g. Cowfe is 1KB and half smaller)

- 10 to 20% faster

This optimized version of Cowgol compiler runs on all 64KB RAM Z80 computers.

# COWGOL for Z80 computers provided with 128/512 KB RAM
-------------------------------------------------------

The Cowgol compiler fails to compile large cowgol source files.

That is caused by the small amount of RAM memory available to the compiler to store the data structures involved in the compilation.

For sources larger than a few hundred lines, the first step of the compiler issuess a fatal error message: "Out of memory".

I solved the problem, at least for the Z80-based computers provided with 128/512 KB RAM, including computers running CP/M under ROMWBW.

I modified the first step of the compiler (COWFE.COM), enabling-it to store part of the data on the "extended" RAM space, beyond the "main" 64KB.

The new compiler components are in the 128_512_KB folder.

All the games from the GAMES folder need to be compiled using this enhanced version of the Cowgol compiler, on a 128/512 KB RAM Z80 computer.

# Examples of Cowgol programs
-----------------------------

You may find a lot of interesting Cowgol programs here: https://rosettacode.org/wiki/Category:Cowgol

Select one of the 164 programs, then select on the left panel the Cowgol language, and you will see the source code of the program.

# Cowgol recompiles itself on a Z80 computer
--------------------------------------------

You may noticed that on David Given's GitHub Cowgol page ( https://github.com/davidgiven/cowgol ) , he wrote:

"Cowgol is an experimental, Ada-inspired language for very small systems (6502, Z80, etc). It's different because it's intended to be self-hosted on these devices: the end goal is to be able to rebuild the entire compiler on an 8-bit micro, although we're not there yet."

Well, it seems I just successfully compiled the entire Cowgol compiler, on my RC2014 512KB RAM Z80 computer.

Here is the complete log:

D>cowfe cowfe.cow tmp
COWFE: 19kB free main memory
448kB free extended memory
  > COWFE.COW
    > cowgol.coh
      > common.coh
    < cowgol.coh
  < COWFE.COW
    > argv.coh
  < COWFE.COW
    > strings.coh
  < COWFE.COW
    > malloc.coh
  < COWFE.COW
    > file.coh
      > commonf.coh
    < file.coh
  < COWFE.COW
    > coodecls.coh
  < COWFE.COW
    > types.coh
  < COWFE.COW
    > allocato.coh
  < COWFE.COW
    > parserto.coh
  < COWFE.COW
    > lexer.coh
  < COWFE.COW
    > midcodec.coh
      > midcodfe.coh
    < midcodec.coh
  < COWFE.COW
    > emitter.coh
  < COWFE.COW
    > namesp.coh
  < COWFE.COW
    > codegen.coh
      > arch.coh
    < codegen.coh
      > cobout.coh
    < codegen.coh
  < COWFE.COW
    > symbols.coh
  < COWFE.COW
    > express.coh
  < COWFE.COW
    > treewalk.coh
  < COWFE.COW
    > parser.coh
  < COWFE.COW
done: 19kB free main memory
217kB free extended memory

D>cowbe tmp cowfe.coo
COWBE: 24kB free main memory
448kB free extended memory
__main
Exit
ExitWithError
AlignUp
get_char
print_char
MemSet
print
print_nl
UIToA
IToA
print_i32
print_i16
print_i8
print_hex_i8
print_hex_i16
print_hex_i32
AToI
MemZero
ArgvInit
ArgvNext
StrCmp
ToLower
StrICmp
StrLen
CopyString
MemCopy
DumpBlocks
CheckMemoryChain
RawAlloc
Alloc
AddFreeBlock
Free
GetFreeMemory
StrDup
file_i_init
fill
fcb_i_gbpb
fcb_i_blockin
fcb_i_blockout
fcb_i_changeblock
fcb_i_convert_a_to_error
FCBOpenIn
FCBOpenUp
FCBOpenOut
FCBClose
FCBSeek
FCBPos
FCBExt
fcb_i_nextchar
FCBGetChar
FCBPutChar
FCBPutString
FCBGetBlock
FCBPutBlock
StrDupBraced
StrDupArrayed
InternalStrDup
AllocNewSymbol
FreeSymbol
AllocNewType
FreeType
InternalAlloc
StartError
EndError
SimpleError
LexerAddIncludePath
LexerPrintSpaces
lexer_i_open
lexer_i_close
LexerIncludeFile
LexerReadToken
lexer_i_ctype
lexer_i_getchar
lexer_i_unparseable
lexer_i_skipwhitespace
lexer_i_read_identifier
lexer_i_match_keyword
lexer_i_read_number
lexer_i_malformed
lexer_i_get_escaped
lexer_i_read_string
lexer_i_read_char
malformed
lexer_i_include
malformed_include
lexer_i_line_directive
CountParameters
GetInputParameter
GetOutputParameter
BadNodeWidth
WidthToIndex
MidFallback
MidNeg
MidSubref
MidConstant
MidBand
MidEndinit
MidAsmend
MidCast2
MidWhencase
MidDeref
MidStartfile
MidStartcase
MidAddress
MidAsmsymbol
MidCast1
MidAsmtext
MidStartinit
MidArg
MidEnd
MidAsmgroupend
MidEndsub
MidStartsub
MidCast8
MidOr
MidEor
MidBlts
MidStore
MidAsmsubref
MidPoparg
MidMul
MidNot
MidInitaddress
MidAdd
MidRshiftu
MidRems
MidCast4
MidReturn
MidJump
MidRemu
MidInitsubref
MidDivs
MidSub
MidRshifts
MidEndfile
MidBeq
MidAnd
MidLshift
MidInit
MidEndcase
MidAsmstart
MidLabel
MidBor
MidDivu
MidAsmgroupstart
MidString
MidCall
MidAsmvalue
MidBltu
MidPair
MidInitstring
MidcodeName
AllocateNewNode
FreeNode
PurgeAllFreeNodes
NodeWidth
midcodec_i_bad_fold
FoldConstant1
FoldConstant2
MidC1Op
GetPowerOfTwo
MidC2Op
MidCCast
E_b8
E_b16
E_b32
E_bsize
E_space
E_comma
E_tab
E_nl
E_openp
E_closep
E
E_countedstring
E_u32
E_u16
E_u8
E_i8
E_i16
E_i32
E_h
E_h8
E_h16
E_h32
EmitterOpenfile
EmitterClosefile
EmitterDeclareSubroutine
EmitterDeclareExternalSubroutine
EmitterReferenceSubroutineById
EmitterReferenceSubroutine
EmitterDeclareWorkspace
EmitParameterList
EmitterEmitInputParameters
EmitterEmitOutputParameters
EmitterEmitSubroutineFlags
LookupSymbolInNamespace
LookupSymbol
AddToNamespace
AddSymbol
AddAlias
AddAliasString
CheckNotPartialType
AddTypeToNamespace
MakeNumberType
IsTypeOfKind
IsArray
IsPtr
IsSubroutine
IsNum
IsSNum
IsScalar
IsRecord
MakeLValue
UndoLValue
IsLValue
MaybeUndoLValue
AllocLabel
AllocSubrId
MidWriter
ArchAlignUp
ArchInitTypes
ArchGuessIntType
ArchInitVariable
ArchInitMember
WriteMid1
WriteMid2
WriteMid3
WriteMid4
WriteMid5
WriteMid6
WriteMid7
WriteMid8
WriteMid9
WriteMid10
WriteMid11
PrintNodes
ReallyGenerate
Generate
GenerateConditional
push_and_free
InitVariable
MakePointerType
MakeArrayType
DestructSubroutineContents
QueueNamespace
CopyParameterList
CreateMainSubroutine
ReportWorkspaces
expr_i_cant_do_that
CheckExpressionType
ResolveUntypedConstantsForAddOrSub
ResolveUntypedConstantsSimply
CheckNumber
ResolveUntypedConstantsNeedingNumbers
CondSimple
Expr1Simple
ExprAdd
cant_add_that
ExprSub
cant_sub_that
Expr2Simple
expr_i_checkrhsconst
expr_i_checkshift
ExprShift
PushNode
PopNode
NextNode
Discard
BeginNormalLoop
TerminateNormalLoop
Negate
ConditionalEq
ConditionalLt
parser_i_bad_next_prev
parser_i_constant_error
i_check_sub_call_args
i_end_call
SymbolRedeclarationError
WrongNumberOfElementsError
CheckEndOfInitialiser
GetInitedMember
AlignTo
CheckForOverlaps
GetInitedMemberChecked
yy_destructor
token_destructor
yy_pop_parser_stack
yy_pop_all_parser_stack
yy_stack_overflow
yy_trace_shift
CopyMinor
yy_reduce
Reducer
reduce_0
reduce_1
reduce_2
reduce_3
reduce_4
reduce_5
reduce_6
reduce_7
reduce_8
reduce_9
reduce_10
reduce_11
reduce_12
reduce_13
reduce_14
reduce_15
reduce_16
reduce_17
reduce_18
reduce_19
reduce_20
reduce_21
reduce_22
reduce_23
reduce_24
reduce_25
reduce_26
reduce_27
reduce_28
reduce_29
reduce_30
reduce_31
reduce_32
reduce_33
reduce_34
reduce_35
reduce_36
reduce_37
reduce_38
reduce_39
reduce_40
reduce_41
reduce_42
reduce_43
reduce_44
reduce_45
reduce_46
reduce_47
reduce_48
reduce_49
reduce_50
reduce_51
reduce_52
reduce_53
reduce_54
not_a_value
reduce_55
reduce_56
reduce_57
BadType
reduce_58
reduce_59
reduce_60
reduce_61
reduce_62
reduce_63
reduce_64
reduce_65
reduce_66
reduce_67
reduce_68
reduce_69
reduce_70
reduce_71
reduce_72
reduce_73
reduce_74
reduce_75
reduce_76
reduce_77
reduce_78
reduce_79
reduce_80
reduce_81
reduce_82
reduce_83
reduce_84
reduce_85
reduce_86
reduce_87
not_an_interface
reduce_88
reduce_89
reduce_90
reduce_91
reduce_92
reduce_93
reduce_94
reduce_95
reduce_96
reduce_97
reduce_98
reduce_99
reduce_100
reduce_101
reduce_102
reduce_103
reduce_104
reduce_105
reduce_106
reduce_107
reduce_108
reduce_109
reduce_110
reduce_111
reduce_112
reduce_113
reduce_114
reduce_115
reduce_116
reduce_117
bad_reference
reduce_123
reduce_127
reduce_128
reduce_129
reduce_130
reduce_136
reduce_139
reduce_default
yy_parse_failed
yy_syntax_error
yy_accept
ParserInit
ParserDeinit
ParserFeedToken
PrintFreeMemory
SyntaxError
ParseArguments
done: 1kB free main memory
432kB free extended memory

D>cowlink cowgol.coo cowfe.coo -o tmp.as
COWLINK: 48kB free
Adding input file: COWGOL.COO
Adding input file: COWFE.COO
Analysing...
Workspace sizes:
  #0: 1476 bytes
Creating output file: TMP.AS
Copying from input file: COWGOL.COO
Copying from input file: COWFE.COO
done: 17kB free

D>
D>cowfe cowbe.cow tmp
COWFE: 19kB free main memory
448kB free extended memory
  > COWBE.COW
    > cowgol.coh
      > common.coh
    < cowgol.coh
  < COWBE.COW
    > argv.coh
  < COWBE.COW
    > strings.coh
  < COWBE.COW
    > malloc.coh
  < COWBE.COW
    > file.coh
      > commonf.coh
    < file.coh
  < COWBE.COW
    > coodecls.coh
  < COWBE.COW
    > btypes.coh
  < COWBE.COW
    > butils.coh
  < COWBE.COW
    > balloc.coh
  < COWBE.COW
    > bdecl.coh
  < COWBE.COW
    > bmidcode.coh
      > midcodbe.coh
    < bmidcode.coh
  < COWBE.COW
    > bemitter.coh
  < COWBE.COW
    > binput.coh
  < COWBE.COW
    > cobin.coh
  < COWBE.COW
    > regcache.coh
  < COWBE.COW
    > bcodegen.coh
      > inssel.coh
    < bcodegen.coh
  < COWBE.COW
    > btreewal.coh
  < COWBE.COW
    > process.coh
  < COWBE.COW
done: 19kB free main memory
263kB free extended memory

D>cowbe tmp cowbe.coo
COWBE: 24kB free main memory
448kB free extended memory
__main
Exit
ExitWithError
AlignUp
get_char
print_char
MemSet
print
print_nl
UIToA
IToA
print_i32
print_i16
print_i8
print_hex_i8
print_hex_i16
print_hex_i32
AToI
MemZero
ArgvInit
ArgvNext
StrCmp
ToLower
StrICmp
StrLen
CopyString
MemCopy
DumpBlocks
CheckMemoryChain
RawAlloc
Alloc
AddFreeBlock
Free
GetFreeMemory
StrDup
file_i_init
fill
fcb_i_gbpb
fcb_i_blockin
fcb_i_blockout
fcb_i_changeblock
fcb_i_convert_a_to_error
FCBOpenIn
FCBOpenUp
FCBOpenOut
FCBClose
FCBSeek
FCBPos
FCBExt
fcb_i_nextchar
FCBGetChar
FCBPutChar
FCBPutString
FCBGetBlock
FCBPutBlock
MidReader
StartError
EndError
SimpleError
CannotOpen
InternalAlloc
GetInputParameter
GetOutputParameter
BadNodeWidth
WidthToIndex
MidcodeName
AllocateNewNode
FreeNode
PurgeAllFreeNodes
WriteB8
WriteB16
FlushCurrentStream
E_b8
E_b16
E_b32
E_space
E_comma
E_tab
E_nl
E_openp
E_closep
E
E_u32
E_u16
E_u8
E_i8
E_i16
E_i32
E_h
E_h8
E_h16
E_h32
E_labelref
E_subref
E_wsref
EmitterOpenStream
EmitterCloseStream
EmitterOpenfile
EmitterClosefile
EmitterDeclareSubroutine
EmitterDeclareExternalSubroutine
EmitterReferenceSubroutineById
EmitterReferenceSubroutine
EmitterDeclareWorkspace
I_b8
I_b16
I_b32
I_bsize
I_countedstring
InputterOpenfile
InputterClosefile
ReadMid0
ReadMid1
ReadMid2
ReadMid3
ReadMid4
ReadMid5
ReadMid6
ReadMid7
ReadMid8
ReadMid9
ReadMid10
RegCacheReset
RegCacheFlush
RegCacheFlushValues
reg_i_find_empty_slot
RegCacheLeavesConstant
RegCacheLeavesWsRef
RegCacheLeavesAddress
RegCacheLeavesValue
RegCacheFindConstant
RegCacheFindWsRef
RegCacheFindAddress
RegCacheFindValue
AllocLabel
AllocSubrId
AllocNewInstruction
FreeInstruction
PurgeAllFreeInstructions
FindConflictingRegisters
FindCompatibleRegisters
FindFirst
FindLast
FindBitNumber
ArchAlignUp
E_symref
R_flushall
R_flush
E_label
E_jump
E_jp
E_jnz
E_ret
E_call
getreg
loreg
hireg
wordreg
E_reg
E_stackref
E_mov
E_ex
E_exx
E_push
E_pop
E_loadm
E_storem
E_stax
E_ldax
E_lda
E_sta
E_load8i
E_store8i
E_store8ic
E_loada
E_load16
E_store16
E_mvi
E_alu
E_cp
E_rra
E_cpl
E_rcf
E_sub
E_and
E_or
E_xor
E_alui
E_addi
E_adci
E_subi
E_sbci
E_ori
E_xori
E_andi
E_cpi
E_inc
E_dec
E_alu2
E_add
E_adc
E_sbc
E_shift
E_sra
E_srl
E_rr
E_bit
E_callhelper
E_string
ArchBeginComment
ArchEndComment
ArchEmitMove
E_lxi
E_lxia
ArchEndInstruction
ArchEndGroup
Call
CallI
is_indexable_8bit
is_indexable_16bit
is_indexable_32bit
is_small_positive
is_small_negative
aluop2
aluop2i
E_dvrmu2
E_dvrms2
logic2
logic2i
E_jumps_with_fallthrough
E_jumps_jz_jnz
E_jumps_jnz_jz
E_jumps_jc_jnc
E_jumps_jm_jp
bequ1
bequ1c
cmpeq2
bequ2c
bequ2
bequ4
bequ4c
beqc
case2
MatchPredicate
EmitOneInstruction
Emitter
emit_0
emit_1
emit_2
emit_3
emit_4
emit_5
emit_6
emit_7
emit_8
emit_9
emit_10
emit_11
emit_12
emit_13
emit_14
emit_15
emit_16
emit_17
emit_18
emit_19
emit_20
emit_21
emit_22
emit_23
emit_24
emit_25
emit_26
emit_27
emit_28
emit_29
emit_30
emit_31
emit_32
emit_33
emit_34
emit_35
emit_36
emit_38
emit_39
emit_40
emit_41
emit_42
emit_43
emit_44
emit_45
emit_46
emit_47
emit_48
emit_49
emit_50
emit_51
emit_52
emit_53
emit_54
emit_55
emit_56
emit_57
emit_58
emit_59
emit_60
emit_63
emit_64
emit_65
emit_66
emit_67
emit_68
emit_69
emit_70
emit_71
emit_72
emit_73
emit_74
emit_75
emit_78
emit_79
emit_80
emit_81
emit_85
emit_86
emit_88
emit_89
emit_90
emit_91
emit_92
emit_93
emit_94
emit_95
emit_96
emit_99
emit_100
emit_101
emit_102
emit_104
emit_106
emit_107
emit_108
pop_return_address
emit_109
push_return_address
emit_110
emit_112
emit_113
emit_114
emit_115
emit_116
emit_117
emit_118
emit_119
emit_120
emit_121
emit_122
emit_123
emit_124
emit_125
emit_126
emit_127
emit_128
emit_129
emit_130
emit_131
emit_132
emit_133
emit_134
emit_135
emit_136
emit_137
emit_138
emit_139
emit_140
emit_141
emit_142
emit_143
emit_144
emit_145
emit_146
emit_147
emit_148
emit_149
emit_150
emit_151
emit_152
emit_153
emit_154
emit_155
emit_156
emit_157
emit_158
emit_159
emit_160
emit_161
emit_162
emit_163
emit_164
emit_165
emit_166
emit_167
emit_168
emit_169
emit_170
emit_171
emit_172
nop_emitter
PopulateMatchBuffer
IsStackedRegister
CalculateBlockedRegisters
CalculateBlockedRegistersInclusive
BlockRegisters
BlockRegistersInclusive
UnblockRegisters
CreateSpill
CreateReload
ShuffleRegisters
PrintNodes
PrintInstructions
IsRegisterSpilt
IsRegisterReloaded
IsSimpleValue
SimpleValuesMatch
check_deref
Generate
InstructionMatcher
RewindRulePointers
TestRule
ConvertNodeToFallback
CopyChildNodes
FindPreferredRegister
AllocateRegister
deadlock
UpdateProducedRegisters
EmitAndFreeInstructions
GenerateConditional
push_and_free
PushNode
PopNode
NextNode
Discard
I_node
AddSubr
FindSubr
ReadN
ReadX
ReadM
ReadParameters
ReadI
ReadO
ReadW
ReadR
ReadF
ProcessFile
PrintFreeMemory
SyntaxError
ParseArguments
done: 3kB free main memory
434kB free extended memory

D>cowlink cowgol.coo cowbe.coo -o tmp.as
COWLINK: 48kB free
Adding input file: COWGOL.COO
Adding input file: COWBE.COO
Analysing...
Workspace sizes:
  #0: 3206 bytes
Creating output file: TMP.AS
Copying from input file: COWGOL.COO
Copying from input file: COWBE.COO
done: 15kB free

D>
D>cowfe cowlink.cow tmp
COWFE: 19kB free main memory
448kB free extended memory
  > COWLINK.COW
    > cowgol.coh
      > common.coh
    < cowgol.coh
  < COWLINK.COW
    > argv.coh
  < COWLINK.COW
    > strings.coh
  < COWLINK.COW
    > malloc.coh
  < COWLINK.COW
    > file.coh
      > commonf.coh
    < file.coh
  < COWLINK.COW
    > lcoodecl.coh
  < COWLINK.COW
    > ltypes.coh
  < COWLINK.COW
    > utils.coh
  < COWLINK.COW
    > lemitter.coh
  < COWLINK.COW
    > archlink.coh
  < COWLINK.COW
    > cooread.coh
  < COWLINK.COW
    > streams.coh
  < COWLINK.COW
    > asmwrite.coh
  < COWLINK.COW
    > graph.coh
  < COWLINK.COW
done: 19kB free main memory
399kB free extended memory

D>cowbe tmp cowlink.coo
COWBE: 24kB free main memory
448kB free extended memory
__main
Exit
ExitWithError
AlignUp
get_char
print_char
MemSet
print
print_nl
UIToA
IToA
print_i32
print_i16
print_i8
print_hex_i8
print_hex_i16
print_hex_i32
AToI
MemZero
ArgvInit
ArgvNext
StrCmp
ToLower
StrICmp
StrLen
CopyString
MemCopy
DumpBlocks
CheckMemoryChain
RawAlloc
Alloc
AddFreeBlock
Free
GetFreeMemory
StrDup
file_i_init
fill
fcb_i_gbpb
fcb_i_blockin
fcb_i_blockout
fcb_i_changeblock
fcb_i_convert_a_to_error
FCBOpenIn
FCBOpenUp
FCBOpenOut
FCBClose
FCBSeek
FCBPos
FCBExt
fcb_i_nextchar
FCBGetChar
FCBPutChar
FCBPutString
FCBGetBlock
FCBPutBlock
StartError
EndError
SimpleError
CannotOpen
E_b8
E
E_u32
E_u16
E_u8
E_i16
E_h
E_h8
E_h16
EmitterOpenfile
EmitterClosefile
E_nl
ArchAlignUp
ArchEmitSubRef
ArchEmitWSRef
ArchEmitHeader
ArchEmitFooter
read_bin1
read_bin2
read_string
AddRef
FindSub
FindOrCreateSub
Deref
FindOrCreateExternal
OpenAndLoadCoo
InitStreams
SetStream
CheckSubExists
WriteCharacterFromStream
ParseWsRef
FlushStream
WriteStream
WriteSubroutinesToOutputFile
MalformedError
UnexpectedEndOfChunk
ReadB1
ReadB2
CopySourceChunk
WriteAllSubroutinesToOutputFile
ResolveExternals
PlaceSubroutines
push
SyntaxError
AddInputFile
done: 17kB free main memory
444kB free extended memory

D>cowlink cowgol.coo cowlink.coo -o tmp.as
COWLINK: 48kB free
Adding input file: COWGOL.COO
Adding input file: COWLINK.COO
Analysing...
Workspace sizes:
  #0: 912 bytes
Creating output file: TMP.AS
Copying from input file: COWGOL.COO
Copying from input file: COWLINK.COO
done: 39kB free

D>

------------------------------

I used a Z80 computer provided with 512KB RAM.

The Cowfe, Cowbe and Cowlink source files were taken from the output of a Cowgol build made on Cygwin / Windows.

I just renamed some files, to be compatible with the CP/M file name standards, and to avoid duplicates ( e.g. "types.coh" ).

The COWFE, COWBE and COWLINK executables that I used were customized to allocate some of the objects in the extended RAM memory space, making thus possible the compiling by avoiding the "out-of-memory" error.

Here is the log of compiling Cowfe, Cowbe and Cowlink.

I did not included in this log the assembling and producing(linking) the final executables, but I tested the resulting executables (I compiled & run Hexdump...) and they work as designed.

