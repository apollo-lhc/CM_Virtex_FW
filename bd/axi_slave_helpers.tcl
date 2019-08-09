#================================================================================
#  Add AXI connection names
#================================================================================

proc clear_global {variable} {
    upvar $variable testVar
    if { [info exists testVar] } {
	puts "unsetting"
	unset testVar
    }
}

[clear_global AXI_BUS_M]
[clear_global AXI_BUS_CLK]
[clear_global AXI_BUS_RST]
[clear_global AXI_ADDR]
[clear_global AXI_ADDR_RANGE]
[clear_global AXI_BUS_FREQ]
[clear_global AXI_DTSI_CALLS]


array set AXI_BUS_M {}
array set AXI_BUS_CLK {}
array set AXI_BUS_RST {}
array set AXI_BUS_FREQ {}
array set AXI_ADDR {}
array set AXI_ADDR_RANGE {}
#special value added during build process to propery set addresses in the DTSI files
array set AXI_DTSI_CALLS {}

#This function adds a axi slave and its paramters to a global list of axi devices
#This list is used to set how many ports there are on the axi interconnect
#The arguments are
#  device_name:  Name of the axi slave
#  axi_master:   The name of the port on the AXI interconnect that this slave
#                will connet to.
#  axi_clk:      This is the clock that will run this devices AXI interface
#                (both master and slave side for this slave)
#  axi_rst:      This is the AXI reset (really AXI n_reset) that will be used
#                for both slave and master sides of this devices axi connection.
#  axi_freq:     This is the AXI clock frequency
#  addr_offset:  Memory offset (default -1 means leave it up to vivado)
#  addr_range:   Memory range at offset (default is 64K)

proc AXI_DEVICE_ADD {device_name axi_master axi_clk axi_rst axi_freq {addr_offset -1} {addr_range 64K}} {
    #create entries in the necessary AXI connection arrays for this device
    global AXI_BUS_M
    global AXI_BUS_RST
    global AXI_BUS_CLK
    global AXI_BUS_FREQ
    global AXI_ADDR
    global AXI_ADDR_RANGE

    
    set AXI_BUS_M($device_name) $axi_master

    set AXI_BUS_RST($device_name) $axi_rst

    set AXI_BUS_CLK($device_name) $axi_clk

    set AXI_BUS_FREQ($device_name) $axi_freq

    set AXI_ADDR($device_name) $addr_offset

    set AXI_ADDR_RANGE($device_name) $addr_range
    
    puts "adding stuff"
}


#This function writes a dtsi_post_chunk file to append a XILINX axi slave so it
#  can be used as a UIO device.
#This takes the name of the device (as it appears in the DTSI file generated by xilinx)
proc AXI_DEV_UIO_DTSI_POST_CHUNK {device_name} {
    set dtsi_file [open "../os/hw/${device_name}.dtsi_post_chunk" w+]
    puts $dtsi_file "  &${device_name}{"
    puts $dtsi_file "    compatible = \"generic-uio\";"
    puts $dtsi_file "      label = \"$device_name\";"
    puts $dtsi_file "  };"
    close $dtsi_file
}

#This function creates and connects all the PL AXI slaves
#After all slaves are genrated and the AXI addressing is fixed,
#dtsi_chunk files are created for all devices. 
proc AXI_PL_CONNECT {devices} {
    global AXI_BUS_M
    global AXI_BUS_RST
    global AXI_BUS_CLK
    global AXI_BUS_FREQ
    global AXI_ADDR
    global AXI_ADDR_RANGE
    global AXI_MASTER_CLK
    global AXI_MASTER_RST
    global AXI_INTERCONNECT_NAME
  
    
    #create connections for each PL device
    foreach dev $devices {
	[AXI_PL_DEV_CONNECT $dev ]
    }

    #this updates the address variables for dtsi_chunk generation, but can only be run after all AXI slaves are connected.
    validate_bd_design
}


#This function automates the adding of a AXI slave that lives outside of the bd.
#It will create external connections for the AXI bus, AXI clock, and AXI reset_n
#for the external slave and connect them up to the axi interconnect in the bd.
#The arguments are
#  device_name: the name of the axi slave (will be used in the dtsi_chunk file)
#  axi_interconnect_name: name of the bd axi interconnect we will be connecting to
#  axi_master_name: name of the channel on the axi interconnect this slave uses
#  axi_clk: the clock used for this axi slave/master channel
#  axi_reset_n: the reset used for this axi slave/master channel
#  axi_clk_freq: the frequency of the AXI clock used for slave/master
proc AXI_PL_DEV_CONNECT {device_name} {
    global AXI_BUS_M
    global AXI_BUS_RST
    global AXI_BUS_CLK
    global AXI_INTERCONNECT_NAME
    global AXI_BUS_FREQ
    global AXI_ADDR
    global AXI_ADDR_RANGE
    global AXI_DTSI_CALLS
    
    startgroup

     #create axi port names
    set AXIS_PORT_NAME $device_name
    append AXI_PORT_NAME "_AXIS"    

    set AXIM_NAME $AXI_INTERCONNECT_NAME
    append AXIM_NAME "/" 
    append AXIM_NAME $AXI_BUS_M($device_name)

    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"


    #Create an external signal interface and connect them to the axi-interconnect
    make_bd_intf_pins_external -name $AXIS_PORT_NAME  [get_bd_intf_pins  $AXIM_PORT_NAME]
    

    #create clk and reset (-q to skip error if it already exists)
    create_bd_port -q -dir I -type clk $AXI_BUS_CLK($device_name)
    create_bd_port -q -dir I -type rst $AXI_BUS_RST($device_name)

    #setup clk/reset parameters
    puts [$AXI_BUS_FREQ($device_name)]
    set_property CONFIG.FREQ_HZ          $AXI_BUS_FREQ($device_name) [get_bd_ports $AXI_BUS_CLK($device_name)]
    set_property CONFIG.ASSOCIATED_RESET $AXI_BUS_RST($device_name)  [get_bd_ports $AXI_BUS_CLK($device_name)]

    #connect AXI clk/reest ports to AXI interconnect master
    connect_bd_net [get_bd_ports $AXI_BUS_RST($device_name)]     [get_bd_pins $AXIM_RSTN_NAME]
    connect_bd_net [get_bd_ports $AXI_BUS_CLK($device_name)]     [get_bd_pins $AXIM_CLK_NAME]


    #set bus properties
    set_property CONFIG.PROTOCOL AXI4LITE [get_bd_intf_ports $AXIS_PORT_NAME]
    set_property CONFIG.ASSOCIATED_BUSIF  $device_name [get_bd_ports $AXI_BUS_CLK($device_name)]

    

    #add addressing
    if {$AXI_ADDR($device_name) == -1} {
	puts "Automatically setting $device_name address"
	assign_bd_address [get_bd_addr_segs {$device_name/Reg }]
    } else {
	puts "Manually setting $device_name address to $AXI_ADDR($device_name) $AXI_ADDR_RANGE($device_name)"
	assign_bd_address -verbose -range $AXI_ADDR_RANGE($device_name) -offset $AXI_ADDR($device_name) [get_bd_addr_segs $device_name/Reg]	
    }
    #add this to the queue of DTSI files we need to write.
    set AXI_DTSI_CALLS($device_name) "AXI_DEV_UIO_DTSI_CHUNK $AXI_INTERCONNECT_NAME $AXI_BUS_M($device_name) $device_name]"
    
    endgroup
}


#function to create a DTSI chunk file for a full PL AXI slave.
proc AXI_DEV_UIO_DTSI_CHUNK {axi_interconnect_name axi_master_name device_name} {
    
    set addr       [format %X [get_property "CONFIG.${axi_master_name}_A00_BASE_ADDR" [get_bd_cells "${axi_interconnect_name}/xbar"]]]
    set addr_width [get_property "CONFIG.${axi_master_name}_A00_ADDR_WIDTH" [get_bd_cells "${axi_interconnect_name}/xbar"]]
    set addr_range [format %X [expr 1 << $addr_width]]
    
    #build dtsi file for this for later    
    set dtsi_file [open "../os/hw/$device_name.dtsi_chunk" w+]
    puts $dtsi_file "  amba_pl {"
    puts $dtsi_file "    axiSlave$device_name: $device_name@${addr} {"
    puts $dtsi_file "      compatible = \"generic-uio\";"
    puts $dtsi_file "      reg = <0x${addr} 0x${addr_range}>;"
    puts $dtsi_file "      label = \"$device_name\";"
    puts $dtsi_file "    };"
    puts $dtsi_file "  };"
    close $dtsi_file
}

#This function is a simpler version of AXI_PL_DEV_CONNECT used for axi slaves in the bd.
#The arguments are the device name, axi master name+channel and the clk/reset for the
#channel
proc AXI_DEV_CONNECT {device_name axi_master axi_clk axi_rst {slave_local 1}} {
    global AXI_BUS_M
    global AXI_BUS_RST
    global AXI_BUS_CLK
    global AXI_INTERCONNECT_NAME
    global AXI_BUS_FREQ
    global AXI_ADDR
    global AXI_ADDR_RANGE
    global AXI_DTSI_CALLS
    
    startgroup

    #create axi port names
    set AXIM_NAME $AXI_INTERCONNECT_NAME
    append AXIM_NAME "/" 
    append AXIM_NAME $AXI_BUS_M($device_name)

    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"

    #connect the requested clock to the AXI interconnect clock port 
    connect_bd_net [get_bd_pins $AXI_BUS_CLK(${device_name})]  [get_bd_pins ${AXIM_CLK_NAME}]
    connect_bd_net [get_bd_pins $AXI_BUS_RST(${device_name})] [get_bd_pins ${AXIM_RSTN_NAME}]

    
    #Xilinx AXI slaves use different names for the AXI connection, this if/else tree will try to find the correct one. 
    if [llength [get_bd_intf_pins -quiet $device_name/S_AXI]] {
        connect_bd_intf_net [get_bd_intf_pins $device_name/S_AXI] -boundary_type upper [get_bd_intf_pins ${AXIM_PORT_NAME}]
	if [llength [get_bd_pins -quiet $device_name/s_axi_aclk]] {
	    connect_bd_net      [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins ${AXIM_CLK_NAME}]
	    connect_bd_net      [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins ${AXIM_RSTN_NAME}]
	} else {        
	    connect_bd_net      [get_bd_pins $device_name/s_aclk]             [get_bd_pins ${AXIM_CLK_NAME}]
	    connect_bd_net      [get_bd_pins $device_name/s_aresetn]          [get_bd_pins ${AXIM_RSTN_NAME}]
	}
    } elseif [llength [get_bd_intf_pins -quiet $device_name/s_axi_lite]] {
        connect_bd_intf_net [get_bd_intf_pins $device_name/s_axi_lite] -boundary_type upper [get_bd_intf_pins ${AXIM_PORT_NAME}]
        connect_bd_net      [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins ${AXIM_CLK_NAME}]
        connect_bd_net      [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins ${AXIM_RSTN_NAME}]
    } else {
        connect_bd_intf_net [get_bd_intf_pins $device_name/AXI_LITE] -boundary_type upper [get_bd_intf_pins ${AXIM_PORT_NAME}]
        connect_bd_net      [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins ${AXIM_CLK_NAME}]
        connect_bd_net      [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins ${AXIM_RSTN_NAME}]
    }

    #add addressing
    if {$AXI_ADDR($device_name) == -1} {
	puts "Automatically setting $device_name address"
	assign_bd_address [get_bd_addr_segs {$device_name/*/Reg }]
    } else {
	puts "Manually setting $device_name address to $AXI_ADDR($device_name) $AXI_ADDR_RANGE($device_name)"	
	assign_bd_address -verbose -range $AXI_ADDR_RANGE($device_name) -offset $AXI_ADDR($device_name) [get_bd_addr_segs $device_name/*/Reg]
	
	
    }

    #Add this to the list of slave we need to make dtsi files for
    if {$slave_local == 1} {
	#if this is a local Xilinx IP core, most info is done by Vivado
	set AXI_DTSI_CALLS($device_name) "AXI_DEV_UIO_DTSI_POST_CHUNK $device_name"
    } elseif {$slave_local == 0} {
	#if this is accessed via axi C2C, then we need to write a full dtsi entry
	set AXI_DTSI_CALLS($device_name) "AXI_DEV_UIO_DTSI_CHUNK ${AXI_INTERCONNECT_NAME} $AXI_BUS_M($device_name) ${device_name}"
    }
    #else {
	#do not generate a file
    #}
    
    endgroup
}

