#/users/qwan/model/ddr34_simple/ph1_phy_ddr_pad.v
#/users/qwan/model/ddr34_simple/ph1_phy_ddr_bank.v
#/users/qwan/model/ddr34_simple/ph1_phy_ddr4_cal.v

../../uisrc/03_ip/ph1a_ddr/alc_32_axi.ipr.v
../../uisrc/03_ip/ph1a_ddr/mc_32_wrapper.ipr.v

$TD_SIM_MODEL/ph1/ph1_phy_pll.v
../../uisrc/03_ip/ph1a_ddr/ph1_phy_pll.v
../../uisrc/03_ip/ph1a_ddr/ph1_logic_pll0.v


# DDR3
../../uisrc/03_ip/ph1a_ddr/ddr_ip.v

../../uisrc/01_rtl/system_top.v    
../../uisrc/01_rtl/fdma_test.v  
../../uisrc/03_ip/uifdma/uifdma.v  
               
../../uisrc/02_sim/sim_tb_top.sv     
../../uisrc/02_sim//ddr3_sim_model/ddr3.v
+incdir+../../uisrc/02_sim/ddr3_sim_model/include

 
## mc top
#../hdl_srcs/alc_mc_32b/top/mc_wrapper.v
#../hdl_srcs/alc_mc_32b/top/xlnx_mc_to_dfi.v
#../hdl_srcs/alc_mc_32b/top/xlnx_ddr3_mc_32b.sv
#
#
## lib
#../hdl_srcs/alc_mc_32b/lib/RAM32M.v
#../al_ip/dram_w2d32.v
## mc
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_act_rank.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_act_timer.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_arb_a.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_arb_c.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_arb_mux_p.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_arb_p.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_cmd_mux_ap.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_cmd_mux_c.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ctl.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc_buf.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc_dec_fix.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc_fi_xor.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc_gen.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc_merge_enc.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ecc.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_group.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_periodic.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_rd_wr.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_ref.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_mc_wtr.sv
#../hdl_srcs/alc_mc_32b/mc/ddr3_v1_4_cal_mc_odt.sv
#
## ui
#../hdl_srcs/alc_mc_32b/ui/ddr3_v1_4_ui_cmd.sv
#../hdl_srcs/alc_mc_32b/ui/ddr3_v1_4_ui_rd_data.sv
#../hdl_srcs/alc_mc_32b/ui/ddr3_v1_4_ui.sv
#../hdl_srcs/alc_mc_32b/ui/ddr3_v1_4_ui_wr_data.sv

#stg
#../hdl_srcs/alc_mc_32b/stg/example_tb.sv

# atg
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_hw_tg_x.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_2to1_converter.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_addr_prbs.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_arbiter.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_data_prbs_seed.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_data_prbs.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_errchk.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_fifo.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_instr_bram.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_mpfifo.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_pattern_gen_addr.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_pattern_gen_data_bram.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_pattern_gen_data_cal_cplx.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_pattern_gen_data.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_prbs_gen.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_top.sv
#../hdl_srcs/alc_mc_32b/atg/ddr3_v1_4_tg_victim_data.sv


##AXI Wrapper
#../hdl_srcs/alc_mc_32b/axi/alc_a_upsizer.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_ar_channel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_aw_channel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_b_channel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_cmd_arbiter.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_cmd_fsm.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_cmd_translator.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axic_register_slice.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_fifo.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_incr_cmd.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_r_channel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_register_slice.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_upsizer.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_w_channel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_wrap_cmd.sv
#../hdl_srcs/alc_mc_32b/axi/alc_axi_wr_cmd_fsm.sv
#../hdl_srcs/alc_mc_32b/axi/alc_carry_and.sv
#../hdl_srcs/alc_mc_32b/axi/alc_carry_latch_and.sv
#../hdl_srcs/alc_mc_32b/axi/alc_carry_latch_or.sv
#../hdl_srcs/alc_mc_32b/axi/alc_carry_or.sv
#../hdl_srcs/alc_mc_32b/axi/alc_command_fifo.sv
#../hdl_srcs/alc_mc_32b/axi/alc_comparator_sel_static.sv
#../hdl_srcs/alc_mc_32b/axi/alc_comparator_sel.sv
#../hdl_srcs/alc_mc_32b/axi/alc_comparator.sv
#../hdl_srcs/alc_mc_32b/axi/alc_r_upsizer.sv
#../hdl_srcs/alc_mc_32b/axi/alc_w_upsizer.sv



# source code
$TD_SIM_MODEL/ph1/ph1_phy_ddr_pad.v
$TD_SIM_MODEL/ph1/ph1_phy_ddr_bank.v
$TD_SIM_MODEL/ph1/ph1_phy_ddr4_cal.v
$TD_SIM_MODEL/common/al_phy_glbl.v
$TD_SIM_MODEL/common/al_map_basic.v
$TD_SIM_MODEL/common/al_map_lut.v
$TD_SIM_MODEL/common/al_map_adder.v
$TD_SIM_MODEL/ph1/ph1_phy_gsr.v
$TD_SIM_MODEL/ph1/ph1_phy_hp_mlclk.v
$TD_SIM_MODEL/ph1/ph1_phy_hp_ioclk.v
$TD_SIM_MODEL/ph1/ph1_phy_gclk_v2.v
$TD_SIM_MODEL/ph1/ph1_phy_sclk_v2.v
$TD_SIM_MODEL/ph1/ph1_logic_dram.v
$TD_SIM_MODEL/ph1/ph1_logic_clk.v
$TD_SIM_MODEL/ph1/ph1_phy_lslice.v
$TD_SIM_MODEL/ph1/ph1_phy_mslice.v
$TD_SIM_MODEL/ph1/ph1_phy_pad.v
$TD_SIM_MODEL/ph1/ph1_phy_hp_pad.v
$TD_SIM_MODEL/ph1/ph1_phy_bankref.v
$TD_SIM_MODEL/ph1/ph1_phy_hp_bankref.v
$TD_SIM_MODEL/ph1/ph1_phy_dramhardcon.v
$TD_SIM_MODEL/ph1/ph1_phy_eram.v
$TD_SIM_MODEL/ph1/ph1_phy_f7mux.v
$TD_SIM_MODEL/ph1/ph1_phy_f78mux.v
$TD_SIM_MODEL/ph1/ph1_phy_config_v2.v
$TD_SIM_MODEL/ph1/ph1_logic_io.v


$TD_SIM_MODEL/ph1/ph1_phy_pll.v
$TD_SIM_MODEL/ph1/ph1_phy_ddr_pad.v
$TD_SIM_MODEL/ph1/ph1_phy_ddr_bank.v

