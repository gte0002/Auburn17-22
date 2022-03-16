set_property SRC_FILE_INFO {cfile:{c:/Users/bobog/Desktop/School/ELEC 4200/lab7/project_7_2/project_7_2.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0.xdc} rfile:../../project_7_2/project_7_2.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:nolabel_line23/inst} [current_design]
current_instance nolabel_line23/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
