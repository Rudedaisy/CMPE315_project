compile_test1: s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd dff.vhd dff_reset.vhd counter4.vhd wire.vhd nor3_1.vhd decd3_8.vhd curr_state.vhd state_control.vhd state_machine.vhd a1_0_muxed.vhd cache.vhd cache_block.vhd cache_byte.vhd cache_cell.vhd cache_space.vhd chip.vhd comp3x2_1.vhd data_muxed.vhd dlatch.vhd dlatch_reset.vhd dmx2_4.vhd high.vhd lru.vhd lru_cell.vhd lru_sel.vhd register_byte.vhd register_cell.vhd registers.vhd tag.vhd tag_block.vhd tx.vhd vbit.vhd xor2_1.vhd xor3_1.vhd mux2_1.vhd cache_cell_reset.vhd chip_test.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd dff.vhd dff_reset.vhd counter4.vhd wire.vhd nor3_1.vhd decd3_8.vhd curr_state.vhd state_control.vhd state_machine.vhd a1_0_muxed.vhd cache.vhd cache_block.vhd cache_byte.vhd cache_cell.vhd cache_space.vhd chip.vhd comp3x2_1.vhd data_muxed.vhd dlatch.vhd dlatch_reset.vhd dmx2_4.vhd high.vhd lru.vhd lru_cell.vhd lru_sel.vhd register_byte.vhd register_cell.vhd registers.vhd tag.vhd tag_block.vhd tx.vhd vbit.vhd xor2_1.vhd xor3_1.vhd mux2_1.vhd cache_cell_reset.vhd chip_test.vhd

elaborate_test1:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_test
	
simulate_test1:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_test
	
test1:
	make compile_test1
	make elaborate_test1
	make simulate_test1
	
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
	
compile_decd3: inv.vhd nor3_1.vhd decd3_8.vhd decd3_8_test.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder inv.vhd nor3_1.vhd decd3_8.vhd decd3_8_test.vhd
	
elaborate_decd3:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test
	
simulate_decd3:
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test

decd3:
	make compile_decd3
	make elaborate_decd3
	make simulate_decd3
	
compile_state_machine: s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd dff_reset.vhd counter4.vhd wire.vhd nor3_1.vhd decd3_8.vhd curr_state.vhd state_control.vhd state_machine.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder s0_transition.vhd state_transition.vhd inv.vhd nor4_1.vhd and4_1.vhd nand2_1.vhd nand3_1.vhd nand4_1.vhd dff_reset.vhd counter4.vhd wire.vhd nor3_1.vhd decd3_8.vhd curr_state.vhd state_control.vhd state_machine.vhd
	
#elaborate_state_machine:
#	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	
#simulate_state_machine:
#	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	
#state_machine:
#	make compile_state_machine
#	make elaborate_state_machine
#	make simulate_state_machine

compall:
	../../Cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var -smartorder *.vhd
elaball:
	../../Cadence/run_ncelab.bash -messages -access rwc -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var cache_space.vhd
gui:
	../../Cadence/run_ncsim.bash -gui -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var cache_space.vhd
