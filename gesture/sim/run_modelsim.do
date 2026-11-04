# Open ModelSim then: do <path>/gesture/sim/run_modelsim.do
onerror {quit -code 1 -force}
onfinish stop
set here [file dirname [file normalize [info script]]]
cd [file normalize "$here/../.."]
if {![file exists work]} {vlib work}
vmap work work
vlog -sv gesture/rtl/*.v gesture/tb/*.v
foreach name {display div32 majority home uart static photos} {
    vsim -c work.tb_$name
    run -all
    quit -sim
}
