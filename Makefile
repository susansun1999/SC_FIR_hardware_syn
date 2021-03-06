# Given no targets, 'make' will default to building 'simv', the simulated version
# of the pipeline

# make          <- compile (and run) simv if needed

# As shortcuts, any of the following will build if necessary and then run the
# specified target

# make sim      <- runs simv (after compiling simv if needed)
# make dve      <- runs DVE interactively (after compiling it if needed)
#                                

# make clean    <- remove files created during compilations (but not synthesis)
# make nuke     <- remove all files created during compilation and synthesis
#
# synthesis command not included in this Makefile
#

################################################################################
## CONFIGURATION
################################################################################

VCS = SW_VCS=2017.12-SP2-1 vcs -sverilog +vc -Mupdate -line -full64
LIB = /afs/umich.edu/class/eecs470/lib/verilog/lec25dscc25.v

# SIMULATION CONFIG

SIMFILES	= BC_FIR.v
TESTBENCH	= BC_FIR_test.v

# SYNTHESIS CONFIG
SYNFILES	= BC_FIR.vg

# Passed through to .tcl scripts:
export CLOCK_NET_NAME = clock
export RESET_NET_NAME = reset
export CLOCK_PERIOD = 10	# TODO: You will want to make this more aggresive

################################################################################
## RULES
################################################################################

# Default target:
all:	simv
	./simv | tee program.out

.PHONY: all

# Simulation:

sim:	simv $(ASSEMBLED)
	./simv | tee sim_program.out

simv:	$(HEADERS) $(SIMFILES) $(TESTBENCH)
	$(VCS) $^ -o simv

.PHONY: sim

# Debugging

dve_simv:	$(HEADERS) $(SIMFILES) $(TESTBENCH)
	$(VCS) +memcbk $^ -o $@ -gui

dve:	dve_simv $(ASSEMBLED)
	./$<

clean:
	rm -rvf simv *.daidir csrc vcs.key program.out \
	syn_simv syn_simv.daidir syn_program.out \
	dve *.vpd *.vcd *.dump ucli.key 

nuke:	clean
	rm -rvf *.vg *.rep *.db *.chk *.log *.out DVEfiles/

.PHONY: clean nuke dve

# Synthesis

syn_simv:	$(SYNFILES) $(TESTBENCH)
	$(VCS) $(TESTBENCH) $(SYNFILES) $(LIB) -o syn_simv

syn:	syn_simv
	./syn_simv | tee syn_program.out

HWA.vg: HWA.v VDC.vg HWA_synth.tcl
	dc_shell-t -f HWA_synth.tcl | tee HWA_synth.out


VDC.vg: VDC.v VDC_synth.tcl
	dc_shell-t -f VDC_synth.tcl | tee VDC_synth.out

BC_FIR.vg: BC_FIR.v BC_FIR_synth.tcl
	dc_shell-t -f BC_FIR_synth.tcl | tee BC_FIR_synth.out
