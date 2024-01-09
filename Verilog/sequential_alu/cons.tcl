create_clock -name clk -period 0.3 [get_ports clk]
set_clock_uncertainty 0.05 [get_clocks clk]
set_min_delay 1 -from {DFFR_X1} -to {out}
set_input_delay -max 0.16 -clock [get_clocks clk] [remove_from_collection] [all_inputs] [get_ports clk]
set_output_delay -max 0.16 -clock [get_clocks clk] [all_outputs]
set_max_fanout 4 sequential_alu
set_max_area 100
