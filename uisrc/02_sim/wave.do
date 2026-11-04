onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sim_tb_top/u_system_top/sys_clk
add wave -noupdate /sim_tb_top/u_system_top/sys_rst_n
add wave -noupdate /sim_tb_top/u_system_top/ddr_addr
add wave -noupdate /sim_tb_top/u_system_top/ddr_ba
add wave -noupdate /sim_tb_top/u_system_top/ddr_cke
add wave -noupdate /sim_tb_top/u_system_top/ddr_odt
add wave -noupdate /sim_tb_top/u_system_top/ddr_cs_n
add wave -noupdate /sim_tb_top/u_system_top/ddr_ras_n
add wave -noupdate /sim_tb_top/u_system_top/ddr_cas_n
add wave -noupdate /sim_tb_top/u_system_top/ddr_we_n
add wave -noupdate /sim_tb_top/u_system_top/ddr_ck_t
add wave -noupdate /sim_tb_top/u_system_top/ddr_dm_dbi
add wave -noupdate /sim_tb_top/u_system_top/ddr_dq
add wave -noupdate /sim_tb_top/u_system_top/ddr_dqs_p
add wave -noupdate /sim_tb_top/u_system_top/pll_locked
add wave -noupdate /sim_tb_top/u_system_top/ddrphy_cal_done
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_rdy
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_en
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_cmd
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_addr
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_wdf_rdy
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_wdf_data
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_wdf_end
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_wdf_mask
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_rd_data_valid
add wave -noupdate /sim_tb_top/u_system_top/ddr3_app_rd_data
add wave -noupdate /sim_tb_top/u_system_top/led
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1109639050 ps} {1109640050 ps}
