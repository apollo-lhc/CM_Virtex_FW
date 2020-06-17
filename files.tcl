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
     src/misc/counter.vhd \
     src/misc/counter_clock.vhd \
     src/misc/asym_dualport_ram.vhd \
     src/axiReg/axiRegPkg.vhd \
     src/axiReg/axiReg.vhd \
     src/V_IO/V_IO_PKG.vhd \
     src/V_IO/V_IO_map.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/CM_V_info/FW_info.vhd \                                                                                                                                        
     src/CM_V_info/FW_INFO_PKG.vhd \                                                                                                                                      
     src/CM_V_info/FW_INFO_map.vhd \          
     src/TCDS/TCDS.vhd \
     src/TCDS/VIRTEX_TCDS_map.vhd \
     src/TCDS/VIRTEX_TCDS_PKG.vhd \
     src/misc/axi_bram_controller.vhd \
     src/misc/axi_bram_ctrl_v4_1_rfs.vhd \
     "
set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    "	    

set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.xci \
    	      cores/TCDS_TxRx/TCDS_TxRx.xci  \
	      cores/TCDS_DRP/TCDS_DRP.xci \
    	      "

#DRP ip
#set ip_repo_path ../bd/IP
set ip_repo_path ../bd/IP/packaged_ip/
set_property  ip_repo_paths ${ip_repo_path}  [current_project]
update_ip_catalog
