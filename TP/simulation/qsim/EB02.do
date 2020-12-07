onerror {quit -f}
vlib work
vlog -work work EB02.vo
vlog -work work EB02.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.NanoProc_vlg_vec_tst
vcd file -direction EB02.msim.vcd
vcd add -internal NanoProc_vlg_vec_tst/*
vcd add -internal NanoProc_vlg_vec_tst/i1/*
add wave /*
run -all
