compile: assign_0.vhd assign_1.vhd state_0.vhd state_1.vhd state_2.vhd state_3.vhd state_4.vhd state_5.vhd state_6.vhd state_7.vhd state_8.vhd state_9.vhd state_10.vhd state_11.vhd state_12.vhd state_13.vhd state_14.vhd state_15.vhd tx.vhd inv.vhd mux2_1.vhd states_test.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder assign_0.vhd assign_1.vhd state_0.vhd state_1.vhd state_2.vhd state_3.vhd state_4.vhd state_5.vhd state_6.vhd state_7.vhd state_8.vhd state_9.vhd state_10.vhd state_11.vhd state_12.vhd state_13.vhd state_14.vhd state_15.vhd tx.vhd inv.vhd mux2_1.vhd states_test.vhd
	
elaborate:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var states_test
	
simulate:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var states_test
	
all:
	make compile 
	make elaborate
	make simulate	