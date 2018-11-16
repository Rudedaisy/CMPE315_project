compall:
	../../Cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var -smartorder *.vhd
elab:
	../../Cadence/run_ncelab.bash -messages -access rwc -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var chip_test
gui: compall elab
	../../Cadence/run_ncsim.bash -gui -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var chip_test


compall_ed: *.vhd
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder *.vhd
elaball_ed:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_fuller_test
sim_s0_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s0_transition_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s0_transition_test
gui_s0_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s0_transition_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s0_transition_test
sim_s5_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s5_transition_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s5_transition_test
gui_s5_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s5_transition_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var s5_transition_test
sim_state_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
gui_state_transition:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_transition_test
sim_control_busy:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_busy_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_busy_test
gui_control_busy:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_busy_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_busy_test
sim_control_write_cache:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_write_cache_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_write_cache_test
gui_control_write_cache:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_write_cache_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_write_cache_test
sim_control_update_lru:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_update_lru_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_update_lru_test
gui_control_update_lru:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_update_lru_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var control_update_lru_test
sim_state_control:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_control_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_control_test
gui_state_control:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_control_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_control_test
sim_curr_state:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var curr_state_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var curr_state_test
gui_curr_state:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var curr_state_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var curr_state_test
sim_counter4:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test
gui_counter4:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var counter4_test
sim_state_machine:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_machine_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_machine_test
gui_state_machine:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_machine_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var state_machine_test	
sim_cache_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_test
gui_cache_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_test
sim_cache_byte:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_byte_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_byte_test
gui_cache_byte:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_byte_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_byte_test
sim_cache_block:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_block_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_block_test
gui_cache_block:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_block_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_block_test
sim_cache:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_test
gui_cache:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_test
sim_tag_block:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_block_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_block_test
gui_tag_block:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_block_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_block_test
sim_tag:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_test
gui_tag:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tag_test
sim_vbit:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var vbit_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var vbit_test
gui_vbit:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var vbit_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var vbit_test
sim_cache_cell_reset:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_reset_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_reset_test
gui_cache_cell_reset:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_reset_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_cell_reset_test
sim_lru_sel:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_sel_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_sel_test
gui_lru_sel:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_sel_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_sel_test
sim_lru_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_cell_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_cell_test
gui_lru_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_cell_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_cell_test
sim_lru:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_test
gui_lru:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var lru_test
sim_decd3_8:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test
gui_decd3_8:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd3_8_test
sim_decd2_4:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd2_4_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd2_4_test
gui_decd2_4:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd2_4_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var decd2_4_test
sim_cache_space:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_space_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_space_test
gui_cache_space:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_space_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var cache_space_test
sim_mux2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mux2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mux2_1_test
gui_mux2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mux2_1_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mux2_1_test
sim_a1_0_muxed:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var a1_0_muxed_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var a1_0_muxed_test
gui_a1_0_muxed:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var a1_0_muxed_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var a1_0_muxed_test
sim_data_muxed:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var data_muxed_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var data_muxed_test
gui_data_muxed:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var data_muxed_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var data_muxed_test
sim_register_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_cell_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_cell_test
gui_register_cell:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_cell_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_cell_test
sim_register_byte:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_byte_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_byte_test
gui_register_byte:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_byte_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var register_byte_test
sim_registers:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var registers_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var registers_test
gui_registers:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var registers_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var registers_test
sim_mem_add_interface:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mem_add_interface_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mem_add_interface_test
gui_mem_add_interface:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mem_add_interface_test
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var mem_add_interface_test

sim_comp3x2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var comp3x2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var comp3x2_1_test
sim_and4_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and4_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and4_1_test
sim_and3_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and3_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and3_1_test
sim_nand4_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand4_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand4_1_test
sim_nand3_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand3_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand3_1_test
sim_nand2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nand2_1_test
sim_nor4_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor4_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor4_1_test
sim_nor3_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor3_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor3_1_test
sim_nor2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var nor2_1_test
sim_or2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var or2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var or2_1_test
sim_xor3_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var xor3_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var xor3_1_test
sim_xor2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var xor2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var xor2_1_test
sim_and2_1:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and2_1_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var and2_1_test
sim_dlatch_reset:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dlatch_reset_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dlatch_reset_test
sim_dlatch:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dlatch_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dlatch_test
sim_dff_reset:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dff_reset_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dff_reset_test
sim_dff:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dff_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var dff_test
sim_inv:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var inv_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var inv_test
sim_tx:
	make compall_ed
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tx_test
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var tx_test

simall_ed:
	make compall_ed
	make elaball_ed
	../cadence/run_ncsim.bash -input ncsim.run -messages -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_fuller_test
gui_ed:
	make compall_ed
	make elaball_ed
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_fuller_test
