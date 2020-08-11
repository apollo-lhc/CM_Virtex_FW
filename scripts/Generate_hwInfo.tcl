#create bit file
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
write_bitstream -force ../bit/top.bit

#create hwdef file
write_hwdef -file ../kernel/hw/top.hwdef -force

# create the hwdef files
write_sysdef -hwdef ../kernel/hw/top.hwdef -bit ../bit/top.bit -file ../kernel/hw/top.hdf -force

#create any debugging files
write_debug_probes -force ../bit/top.ltx                                                                                                                                 
