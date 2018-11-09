compall:
	../../Cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var -smartorder *.vhd
elaball:
	../../Cadence/run_ncelab.bash -messages -access rwc -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var chip_test
gui:
	../../Cadence/run_ncsim.bash -gui -cdslib ../../Cadence/cds.lib -hdlvar ../../Cadence/hdl.var chip_test
	
compall_ed:
	../cadence/run_ncvhdl.bash -messages -linedebug -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var -smartorder *.vhd
elaball_ed:
	../cadence/run_ncelab.bash -messages -access rwc -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_test
gui_ed:
	make compall_ed
	make elaball_ed
	../cadence/run_ncsim.bash -gui -cdslib ../cadence/cds.lib -hdlvar ../cadence/hdl.var chip_test
