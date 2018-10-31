compile: assign_0.vhd assign_1.vhd nor4_1.vhd nor4_1_test.vhd s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and3_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder assign_0.vhd assign_1.vhd nor4_1.vhd nor4_1_test.vhd s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and3_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd
	
elaborate:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor4_test
	
simulate:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor4_test
	
all:
	make compile 
	make elaborate
	make simulate	