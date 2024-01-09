###################################################################

# Created by write_sdc on Sat Nov 24 06:49:11 2018

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_max_area 100
set_max_fanout 4 [current_design]
create_clock [get_ports clk]  -period 0.3  -waveform {0 0.15}
set_clock_uncertainty 0.05  [get_clocks clk]
set_output_delay -clock clk  -max 0.16  [get_ports {result[15]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[14]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[13]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[12]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[11]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[10]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[9]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[8]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[7]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[6]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[5]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[4]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[3]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[2]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[1]}]
set_output_delay -clock clk  -max 0.16  [get_ports {result[0]}]
