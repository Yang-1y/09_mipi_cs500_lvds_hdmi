## part 1: create lib
vlib work
vmap work work

## part 2: load rtl
vlog -timescale 1ps/1ps -sv -f   compile.f                        \
 +define+PH1_DDR_SIM                                              \
 +define+SIMULATION                                               \
 +define+den2048Mb                                                \
 +define+sg187E                                                     
                                                       
## part 3: sim
vsim -voptargs=+acc work.sim_tb_top                               \
+USR_DRAM_SIM_PATH=../../uisrc/03_ip/ph1a_ddr/ddr_ip_1.txt                          \
+CPU_SIM_PATH=./mcu_rom/mcu_rom.txt
## part 4: add wave
do wave.do

## part 5: show ui
view wave
view structure
view signals

## part 6: run sim
run -all



