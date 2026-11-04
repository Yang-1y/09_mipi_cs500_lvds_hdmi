create_clock -period 10 -name ddr_clk -waveform {0 5} [get_ports I_ddr_clk]
create_clock -period 40 -name clk_25m -waveform {0 5} [get_ports I_sys_clk_25m]

create_clock -name pclkx1      -period 6.66  -waveform {0 3.33} [get_nets {pclkx1}]
create_clock -name pclkx5      -period 1.33  -waveform {0 0.67} [get_nets {pclkx5}]
create_clock -name S_hs_rx_clk -period 6     -waveform {0    3} [get_pins {u_mipi_dphy_rx_ph1a_mipiio_wrapper/u_ph1a_mipiio_wrapper/u_PH1_PHY_MIPIIO.hsrx_byteclk_to_fabric}]
#create_clock -name S_hs_rx_clk -period 6 -waveform {0 3} [get_pins {u_mipi_dphy_rx_wrapper/u_PH1A90_MIPIIO_RX/u_mipiio/u_PH1_PHY_MIPIIO.hsrx_byteclk_to_fabric}]

rename_clock -name {cpu_clk_70m} -source [get_ports {I_sys_clk_25m}] -master_clock {clk_25m} [get_pins {u_pll/pll_inst.clkc[2]}]
rename_clock -name {cam_clk_24m} -source [get_ports {I_sys_clk_25m}] -master_clock {clk_25m} [get_pins {u_pll/pll_inst.clkc[3]}]

derive_pll_clocks

set_false_path -from [get_regs {vtc_vs}] -to [get_regs {u_uifdma_axi_ddr/u_ddr_phy/u_clk/hctrl_clk_bufg}]

set_clock_groups -exclusive  -group [get_clocks { pclkx1 }]  -group [get_clocks { clk_25m }] -group [get_clocks { cpu_clk_70m }] -group [get_clocks { cam_clk_24m }] -group [get_clocks { S_hs_rx_clk }] -group [get_clocks {u_uifdma_axi_ddr/u_ddr_phy/hctrl_clk}]
 
