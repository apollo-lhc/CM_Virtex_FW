set bd_path proj

set bd_name c2cSlave

set bd_files "\
    src/c2cSlave/createC2CSlaveInterconnect.tcl
    "

set vhdl_files "\
     src/top.vhd \
     src/misc/pass_time_domain.vhd \
     src/misc/pacd.vhd \
     src/misc/types.vhd \
     src/misc/capture_CDC.vhd \
     src/misc/counter_clock.vhd \
     src/axiReg/axiRegPkg.vhd \
     src/axiReg/axiReg.vhd \
     src/myReg/myReg.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/FW_info/FW_info.vhd \
     src/misc/counter_clock.vhd \
     src/TCDS/TCDS.vhd \
     src/TCDS/VIRTEX_TCDS_map.vhd \
     src/TCDS/VIRTEX_TCDS_PKG.vhd \

     "
set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    "	    

set verilog_files "\
    src/TCDS/TCDS_TxRx_example_stimulus_64b66b.v \
    src/TCDS/TCDS_TxRx_example_reset_sync.v \
    src/TCDS/TCDS_TxRx_prbs_any.v \
    "

set xci_files "\
              cores/Local_Clocking/Local_Clocking.xci \
              cores/TCDS_TxRx/TCDS_TxRx.xci  \
              cores/AXI_DRP/AXI_DRP.xci \
              cores/in_system_ibert_0/in_system_ibert_0.xci \
              "

#DRP ip
set ip_repo_path ../bd/IP
set_property  ip_repo_paths ${ip_repo_path}  [current_project]
update_ip_catalog

#	      cores/LHC/LHC.xci \
