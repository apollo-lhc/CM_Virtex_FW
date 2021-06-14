// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:MatchEngineTopL3:1.0
// IP Revision: 2003021750

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
MatchEngineTopL3_0 your_instance_name (
  .bx_o_V_ap_vld(bx_o_V_ap_vld),                                                    // output wire bx_o_V_ap_vld
  .instubdata_dataarray_data_V_ce0(instubdata_dataarray_data_V_ce0),                // output wire instubdata_dataarray_data_V_ce0
  .inprojdata_dataarray_data_V_ce0(inprojdata_dataarray_data_V_ce0),                // output wire inprojdata_dataarray_data_V_ce0
  .outcandmatch_dataarray_data_V_ce0(outcandmatch_dataarray_data_V_ce0),            // output wire outcandmatch_dataarray_data_V_ce0
  .outcandmatch_dataarray_data_V_we0(outcandmatch_dataarray_data_V_we0),            // output wire outcandmatch_dataarray_data_V_we0
  .outcandmatch_nentries_0_V_ap_vld(outcandmatch_nentries_0_V_ap_vld),              // output wire outcandmatch_nentries_0_V_ap_vld
  .outcandmatch_nentries_1_V_ap_vld(outcandmatch_nentries_1_V_ap_vld),              // output wire outcandmatch_nentries_1_V_ap_vld
  .ap_clk(ap_clk),                                                                  // input wire ap_clk
  .ap_rst(ap_rst),                                                                  // input wire ap_rst
  .ap_start(ap_start),                                                              // input wire ap_start
  .ap_done(ap_done),                                                                // output wire ap_done
  .ap_idle(ap_idle),                                                                // output wire ap_idle
  .ap_ready(ap_ready),                                                              // output wire ap_ready
  .bx_V(bx_V),                                                                      // input wire [2 : 0] bx_V
  .bx_o_V(bx_o_V),                                                                  // output wire [2 : 0] bx_o_V
  .instubdata_dataarray_data_V_address0(instubdata_dataarray_data_V_address0),      // output wire [8 : 0] instubdata_dataarray_data_V_address0
  .instubdata_dataarray_data_V_q0(instubdata_dataarray_data_V_q0),                  // input wire [13 : 0] instubdata_dataarray_data_V_q0
  .instubdata_nentries_0_V_0(instubdata_nentries_0_V_0),                            // input wire [4 : 0] instubdata_nentries_0_V_0
  .instubdata_nentries_0_V_1(instubdata_nentries_0_V_1),                            // input wire [4 : 0] instubdata_nentries_0_V_1
  .instubdata_nentries_0_V_2(instubdata_nentries_0_V_2),                            // input wire [4 : 0] instubdata_nentries_0_V_2
  .instubdata_nentries_0_V_3(instubdata_nentries_0_V_3),                            // input wire [4 : 0] instubdata_nentries_0_V_3
  .instubdata_nentries_0_V_4(instubdata_nentries_0_V_4),                            // input wire [4 : 0] instubdata_nentries_0_V_4
  .instubdata_nentries_0_V_5(instubdata_nentries_0_V_5),                            // input wire [4 : 0] instubdata_nentries_0_V_5
  .instubdata_nentries_0_V_6(instubdata_nentries_0_V_6),                            // input wire [4 : 0] instubdata_nentries_0_V_6
  .instubdata_nentries_0_V_7(instubdata_nentries_0_V_7),                            // input wire [4 : 0] instubdata_nentries_0_V_7
  .instubdata_nentries_1_V_0(instubdata_nentries_1_V_0),                            // input wire [4 : 0] instubdata_nentries_1_V_0
  .instubdata_nentries_1_V_1(instubdata_nentries_1_V_1),                            // input wire [4 : 0] instubdata_nentries_1_V_1
  .instubdata_nentries_1_V_2(instubdata_nentries_1_V_2),                            // input wire [4 : 0] instubdata_nentries_1_V_2
  .instubdata_nentries_1_V_3(instubdata_nentries_1_V_3),                            // input wire [4 : 0] instubdata_nentries_1_V_3
  .instubdata_nentries_1_V_4(instubdata_nentries_1_V_4),                            // input wire [4 : 0] instubdata_nentries_1_V_4
  .instubdata_nentries_1_V_5(instubdata_nentries_1_V_5),                            // input wire [4 : 0] instubdata_nentries_1_V_5
  .instubdata_nentries_1_V_6(instubdata_nentries_1_V_6),                            // input wire [4 : 0] instubdata_nentries_1_V_6
  .instubdata_nentries_1_V_7(instubdata_nentries_1_V_7),                            // input wire [4 : 0] instubdata_nentries_1_V_7
  .instubdata_nentries_2_V_0(instubdata_nentries_2_V_0),                            // input wire [4 : 0] instubdata_nentries_2_V_0
  .instubdata_nentries_2_V_1(instubdata_nentries_2_V_1),                            // input wire [4 : 0] instubdata_nentries_2_V_1
  .instubdata_nentries_2_V_2(instubdata_nentries_2_V_2),                            // input wire [4 : 0] instubdata_nentries_2_V_2
  .instubdata_nentries_2_V_3(instubdata_nentries_2_V_3),                            // input wire [4 : 0] instubdata_nentries_2_V_3
  .instubdata_nentries_2_V_4(instubdata_nentries_2_V_4),                            // input wire [4 : 0] instubdata_nentries_2_V_4
  .instubdata_nentries_2_V_5(instubdata_nentries_2_V_5),                            // input wire [4 : 0] instubdata_nentries_2_V_5
  .instubdata_nentries_2_V_6(instubdata_nentries_2_V_6),                            // input wire [4 : 0] instubdata_nentries_2_V_6
  .instubdata_nentries_2_V_7(instubdata_nentries_2_V_7),                            // input wire [4 : 0] instubdata_nentries_2_V_7
  .instubdata_nentries_3_V_0(instubdata_nentries_3_V_0),                            // input wire [4 : 0] instubdata_nentries_3_V_0
  .instubdata_nentries_3_V_1(instubdata_nentries_3_V_1),                            // input wire [4 : 0] instubdata_nentries_3_V_1
  .instubdata_nentries_3_V_2(instubdata_nentries_3_V_2),                            // input wire [4 : 0] instubdata_nentries_3_V_2
  .instubdata_nentries_3_V_3(instubdata_nentries_3_V_3),                            // input wire [4 : 0] instubdata_nentries_3_V_3
  .instubdata_nentries_3_V_4(instubdata_nentries_3_V_4),                            // input wire [4 : 0] instubdata_nentries_3_V_4
  .instubdata_nentries_3_V_5(instubdata_nentries_3_V_5),                            // input wire [4 : 0] instubdata_nentries_3_V_5
  .instubdata_nentries_3_V_6(instubdata_nentries_3_V_6),                            // input wire [4 : 0] instubdata_nentries_3_V_6
  .instubdata_nentries_3_V_7(instubdata_nentries_3_V_7),                            // input wire [4 : 0] instubdata_nentries_3_V_7
  .inprojdata_dataarray_data_V_address0(inprojdata_dataarray_data_V_address0),      // output wire [7 : 0] inprojdata_dataarray_data_V_address0
  .inprojdata_dataarray_data_V_q0(inprojdata_dataarray_data_V_q0),                  // input wire [20 : 0] inprojdata_dataarray_data_V_q0
  .inprojdata_nentries_0_V(inprojdata_nentries_0_V),                                // input wire [7 : 0] inprojdata_nentries_0_V
  .inprojdata_nentries_1_V(inprojdata_nentries_1_V),                                // input wire [7 : 0] inprojdata_nentries_1_V
  .outcandmatch_dataarray_data_V_address0(outcandmatch_dataarray_data_V_address0),  // output wire [7 : 0] outcandmatch_dataarray_data_V_address0
  .outcandmatch_dataarray_data_V_d0(outcandmatch_dataarray_data_V_d0),              // output wire [13 : 0] outcandmatch_dataarray_data_V_d0
  .outcandmatch_nentries_0_V(outcandmatch_nentries_0_V),                            // output wire [7 : 0] outcandmatch_nentries_0_V
  .outcandmatch_nentries_1_V(outcandmatch_nentries_1_V)                            // output wire [7 : 0] outcandmatch_nentries_1_V
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file MatchEngineTopL3_0.v when simulating
// the core, MatchEngineTopL3_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

