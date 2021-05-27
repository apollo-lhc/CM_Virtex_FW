source ../scripts/settings.tcl


#open_project $outputDir/../proj/$top.xpr

#################################################################################
# STEP#2: run synthesis, report utilization and timing estimates, write checkpoint design
#################################################################################

update_compile_order -fileset sources_1
#puts "setting ip_repo_paths \n"
set_property ip_repo_paths [list ../src/PRMEMC ../cores/] [current_project]
#puts "updatign ip catalog \n"
update_ip_catalog

set ip_to_regenerate [get_ips]
for {set j 0} {$j < [llength $ip_to_regenerate ] } {incr j} {
    set ip_name [lindex $ip_to_regenerate $j]
    set ip_xci ../cores/$ip_name/$ip_name.xci
    if {[string length [get_files -q $ip_xci]]} {
	puts "Building $ip_name \n\n"
	generate_target {synthesis} [get_files $ip_xci]
	synth_ip [lindex $ip_to_regenerate $j]
    }
}

if {[string length [get_files $bd_name.bd]]} {
    set_property synth_checkpoint_mode None [get_files $bd_name.bd]
    generate_target all [get_files "[get_bd_designs].bd"]
}
set_property source_mgmt_mode All [current_project]
#update_compile_order -fileset sources_1
# set_property ip_repo_paths [list ../src/PRMEMC ../cores/] [current_project]
# update_ip_catalog
#update_compile_order -fileset sources_1
# create_ip -name MatchCalculatorTop -vendor xilinx.com -library hls -version 1.0 -module_name MC_L3PHIC
# create_ip -name MatchEngineTopL3 -vendor xilinx.com -library hls -version 1.0 -module_name MatchEngineTopL3_0
# create_ip -name ProjectionRouterTop -vendor xilinx.com -library hls -version 1.0 -module_name PR_L3PHIC
# create_ip -name ProjectionRouterTop5 -vendor xilinx.com -library hls -version 1.0 -module_name PR_L3PHIA
# create_ip -name ProjectionRouterTop7 -vendor xilinx.com -library hls -version 1.0 -module_name PR_L3PHID
# create_ip -name ProjectionRouterTop9 -vendor xilinx.com -library hls -version 1.0 -module_name PR_L3PHIB

report_ip_status
#synth design
synth_design -top $top -part $FPGA_part -flatten rebuilt
report_ip_status 
#Rui
write_checkpoint -force $outputDir/post_synth
#report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
#report_power -file $outputDir/post_synth_power.rpt


#################################################################################
# STEP#3: run placement and logic optimization, report utilization and timing
# estimates, write checkpoint design
#################################################################################
opt_design
power_opt_design
place_design
phys_opt_design
#write_checkpoint -force $outputDir/post_place
#report_timing_summary -file $outputDir/post_place_timing_summary.rpt

#################################################################################
# STEP#4: run router, report actual utilization and timing, write checkpoint design,
# run drc, write verilog and xdc out
#################################################################################
route_design -directive Explore
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_verilog -force $outputDir/bft_impl_netlist.v
write_xdc -no_fixed_only -force $outputDir/bft_impl.xdc
#write_checkpoint -force $outputDir/post_route
#set pass [expr {[get_property SLACK [get_timing_paths]] >= 0}]
write_checkpoint -force $outputDir/post_route


#################################################################################
# STEP#5: Generate files for os build
#################################################################################
source ../scripts/Generate_hwInfo.tcl
source ../scripts/Generate_svf.tcl
