create_macro RO
update_macro [get_macros RO] -rlocs {w1_inferred_i_1 X0Y0 w2_inferred_i_1 X0Y0 w3_inferred_i_1 X0Y0 w4_inferred_i_1 X0Y1 w5_inferred_i_1 X1Y0}
set_property BEL A6LUT [get_cells w1_inferred_i_1]
set_property LOC SLICE_X0Y39 [get_cells w1_inferred_i_1]
