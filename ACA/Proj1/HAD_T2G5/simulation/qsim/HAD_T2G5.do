onerror {exit -code 1}
vlib work
vcom -work work Encoder.vho
vcom -work work HAD_DECODER_PARALLEL.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.HAD_DECODER_PARALLEL_vhd_vec_tst
vcd file -direction HAD_T2G5.msim.vcd
vcd add -internal HAD_DECODER_PARALLEL_vhd_vec_tst/*
vcd add -internal HAD_DECODER_PARALLEL_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

