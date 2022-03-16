create_macro RO
update_macro [get_macros RO] -rlocs {w1_inferred_i_1 X0Y0 w2_inferred_i_1 X0Y0 w3_inferred_i_1 X0Y0 w4_inferred_i_1 X0Y0 w5_inferred_i_1 X1Y0 w6_inferred_i_1 X1Y0 w7_inferred_i_1 X1Y0 w8_inferred_i_1 X1Y0 w9_inferred_i_1 X0Y1 w10_inferred_i_1 X0Y1}
set_property BEL D6LUT [get_cells w1_inferred_i_1]
set_property LOC SLICE_X0Y31 [get_cells w1_inferred_i_1]
