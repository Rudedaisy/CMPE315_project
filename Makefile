compile_state_transition: s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd state_transition_test.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd state_transition_test.vhd
	
elaborate_state_transition:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	
simulate_state_transition:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	
state_transition:
	make compile_state_transition
	make elaborate_state_transition
	make simulate_state_transition	
	
compile_counter: dff_reset.vhd counter4.vhd wire.vhd counter4_test.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder dff_reset.vhd counter4.vhd wire.vhd counter4_test.vhd
	
elaborate_counter:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test
	
simulate_counter:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test

counter:
	make compile_counter
	make elaborate_counter
	make simulate_counter