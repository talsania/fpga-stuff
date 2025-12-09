set_property PACKAGE_PIN E3 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -name sys_clk -period 10.000 -waveform {0 5} [get_ports {clk}]

set_property PACKAGE_PIN N17 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
set_property PULLDOWN true [get_ports {rst}]

set_property PACKAGE_PIN H17 [get_ports {led}]
set_property IOSTANDARD LVCMOS33 [get_ports {led}]