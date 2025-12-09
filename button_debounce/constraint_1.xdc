set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { reset_n }];
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { noisy }];
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { debounced }];

set_property CONFIG_VOLTAGE 3.3 [current_design];
set_property CFGBVS VCCO [current_design];

set_false_path -from [get_ports reset_n] -to [all_registers];
set_false_path -from [get_ports noisy] -to [all_registers];