# make          <- runs simv (after compiling simv if needed)
# make all      <- runs simv (after compiling simv if needed)
# make simv     <- compile simv if needed (but do not run)
# make syn      <- runs syn_simv (after synthesizing if needed then 
#                                 compiling synsimv if needed)
# make clean    <- remove files created during compilations (but not synthesis)
# make nuke     <- remove all files created during compilation and synthesis
#
# To compile additional files, add them to the TESTBENCH or SIMFILES as needed
# Every .vg file will need its own rule and one or more synthesis scripts
# The information contained here (in the rules for those vg files) will be 
# similar to the information in those scripts but that seems hard to avoid.
#
# make assembly SOURCE=test_progs/rv32_copy.s
# make program SOURCE=test_progs/quicksort.c

SOURCE = test_progs/haha.s

CRT = crt.s
LINKERS = linker.lds
ASLINKERS = aslinker.lds

DEBUG_FLAG = -g
CFLAGS =  -mno-relax -march=rv32im -mabi=ilp32 -nostartfiles -std=gnu11 -mstrict-align -I exception_handler
OFLAGS = -O0
ASFLAGS = -mno-relax -march=rv32im -mabi=ilp32 -nostartfiles -Wno-main -mstrict-align
OBJFLAGS = -SD -M no-aliases 
OBJDFLAGS = -SD -M numeric,no-aliases

##########################################################################
# IF YOU AREN'T USING A CAEN MACHINE, CHANGE THIS TO FALSE OR OVERRIDE IT
CAEN = 1
##########################################################################
ifeq (1, $(CAEN))
	GCC = riscv gcc
	OBJDUMP = riscv objdump
	AS = riscv as
	ELF2HEX = riscv elf2hex
else
	GCC = riscv64-unknown-elf-gcc
	OBJDUMP = riscv64-unknown-elf-objdump
	AS = riscv64-unknown-elf-as
	ELF2HEX = elf2hex
endif
all: simv
	./simv | tee program.out

compile: $(CRT) $(LINKERS)
	$(GCC) $(CFLAGS) $(OFLAGS) $(CRT) $(SOURCE) -T $(LINKERS) -o program.elf
	$(GCC) $(CFLAGS) $(DEBUG_FLAG) $(OFLAGS) $(CRT) $(SOURCE) -T $(LINKERS) -o program.debug.elf
assemble: $(ASLINKERS)
	$(GCC) $(ASFLAGS) $(SOURCE) -T $(ASLINKERS) -o program.elf 
	cp program.elf program.debug.elf
disassemble: program.debug.elf
	$(OBJDUMP) $(OBJFLAGS) program.debug.elf > program.dump
	$(OBJDUMP) $(OBJDFLAGS) program.debug.elf > program.debug.dump
	rm program.debug.elf
hex: program.elf
	$(ELF2HEX) 8 8192 program.elf > program.mem

program: compile disassemble hex
	@:

debug_program:
	gcc -lm -g -std=gnu11 -DDEBUG $(SOURCE) -o debug_bin
assembly: assemble disassemble hex
	@:


################################################################################
## CONFIGURATION
################################################################################

VCS = vcs -V -sverilog +vc -Mupdate -line -full64 +vcs+vcdpluson -debug_pp 
LIB = /afs/umich.edu/class/eecs470/lib/verilog/lec25dscc25.v

# For visual debugger
VISFLAGS = -lncurses


##### 
# Modify starting here
#####


#TESTBENCH = HWA_total_test.v
TESTBENCH = BC_total_test.v

HEADERS = 

#SIMFILES = HWA_total.v in_ctrl.v HWA.v HWA_1.v VDC.v
SIMFILES = BC_total.v BC_FIR.v BC_FIR_1.v in_ctrl.v
		
#SYNFILES = HWA_total.vg
SYNFILES = BC_total.vg

export CLOCK_NET_NAME = clock
export RESET_NET_NAME = reset
export HEADERS = params.svh 
export SOURCES = verilog/rob.sv 
export DESIGN_NAME = rob

export CLOCK_PERIOD = 5	# TODO: You will want to make this more aggresive

HWA_total.vg:      $(HEADERS) $(SIMFILES) HWA_total_synth.tcl
	dc_shell-t -f ./HWA_total_synth.tcl | tee synth.out 

BC_total.vg:      $(HEADERS) $(SIMFILES) BC_total_synth.tcl
	dc_shell-t -f ./BC_total_synth.tcl | tee synth.out 
 

#####
# Should be no need to modify after here
#####
simv:	$(HEADERS) $(SIMFILES) $(TESTBENCH)
	$(VCS) $(HEADERS) $(TESTBENCH) $(SIMFILES) -o simv

dve:	$(HEADERS) $(SIMFILES) $(TESTBENCH)
	$(VCS) +memcbk $(HEADERS) $(TESTBENCH) $(SIMFILES) -o dve -R -gui
.PHONY:	dve

# For visual debugger
vis_simv:	$(HEADERS) $(SIMFILES) $(VTUBER)
	$(VCS) $(VISFLAGS) $(VTUBER) $(HEADERS) $(SIMFILES) -o vis_simv 
	./vis_simv

syn_simv:	$(HEADERS) $(SYNFILES) $(TESTBENCH)
	$(VCS) $(HEADERS) $(TESTBENCH) $(SYNFILES) $(LIB) -o syn_simv 

syn:	syn_simv
	./syn_simv | tee syn_program.out


clean:
	rm -rf *simv *simv.daidir csrc vcs.key program.out *.key
	rm -rf vis_simv vis_simv.daidir
	rm -rf dve* inter.vpd DVEfiles
	rm -rf syn_simv syn_simv.daidir syn_program.out
	rm -rf synsimv synsimv.daidir csrc vcdplus.vpd vcs.key synprog.out processor.out writeback.out vc_hdrs.h
	rm -f *.elf *.dump *.mem debug_bin

nuke:	clean
	rm -rf *.vg *.rep *.ddc *.chk command.log *.syn
	rm -rf *.out command.log *.db *.svf *.mr *.pvl