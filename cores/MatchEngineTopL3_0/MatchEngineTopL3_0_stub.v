// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Mon Jun 14 11:01:11 2021
// Host        : lnx7188.classe.cornell.edu running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /mnt/data1/rzou/CM_Virtex_FW_TF_Loop/cores/MatchEngineTopL3_0/MatchEngineTopL3_0_stub.v
// Design      : MatchEngineTopL3_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu7p-flvb2104-1-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "MatchEngineTopL3,Vivado 2018.2" *)
module MatchEngineTopL3_0(bx_o_V_ap_vld, 
  instubdata_dataarray_data_V_ce0, inprojdata_dataarray_data_V_ce0, 
  outcandmatch_dataarray_data_V_ce0, outcandmatch_dataarray_data_V_we0, 
  outcandmatch_nentries_0_V_ap_vld, outcandmatch_nentries_1_V_ap_vld, ap_clk, ap_rst, 
  ap_start, ap_done, ap_idle, ap_ready, bx_V, bx_o_V, instubdata_dataarray_data_V_address0, 
  instubdata_dataarray_data_V_q0, instubdata_nentries_0_V_0, instubdata_nentries_0_V_1, 
  instubdata_nentries_0_V_2, instubdata_nentries_0_V_3, instubdata_nentries_0_V_4, 
  instubdata_nentries_0_V_5, instubdata_nentries_0_V_6, instubdata_nentries_0_V_7, 
  instubdata_nentries_1_V_0, instubdata_nentries_1_V_1, instubdata_nentries_1_V_2, 
  instubdata_nentries_1_V_3, instubdata_nentries_1_V_4, instubdata_nentries_1_V_5, 
  instubdata_nentries_1_V_6, instubdata_nentries_1_V_7, instubdata_nentries_2_V_0, 
  instubdata_nentries_2_V_1, instubdata_nentries_2_V_2, instubdata_nentries_2_V_3, 
  instubdata_nentries_2_V_4, instubdata_nentries_2_V_5, instubdata_nentries_2_V_6, 
  instubdata_nentries_2_V_7, instubdata_nentries_3_V_0, instubdata_nentries_3_V_1, 
  instubdata_nentries_3_V_2, instubdata_nentries_3_V_3, instubdata_nentries_3_V_4, 
  instubdata_nentries_3_V_5, instubdata_nentries_3_V_6, instubdata_nentries_3_V_7, 
  inprojdata_dataarray_data_V_address0, inprojdata_dataarray_data_V_q0, 
  inprojdata_nentries_0_V, inprojdata_nentries_1_V, 
  outcandmatch_dataarray_data_V_address0, outcandmatch_dataarray_data_V_d0, 
  outcandmatch_nentries_0_V, outcandmatch_nentries_1_V)
/* synthesis syn_black_box black_box_pad_pin="bx_o_V_ap_vld,instubdata_dataarray_data_V_ce0,inprojdata_dataarray_data_V_ce0,outcandmatch_dataarray_data_V_ce0,outcandmatch_dataarray_data_V_we0,outcandmatch_nentries_0_V_ap_vld,outcandmatch_nentries_1_V_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,bx_V[2:0],bx_o_V[2:0],instubdata_dataarray_data_V_address0[8:0],instubdata_dataarray_data_V_q0[13:0],instubdata_nentries_0_V_0[4:0],instubdata_nentries_0_V_1[4:0],instubdata_nentries_0_V_2[4:0],instubdata_nentries_0_V_3[4:0],instubdata_nentries_0_V_4[4:0],instubdata_nentries_0_V_5[4:0],instubdata_nentries_0_V_6[4:0],instubdata_nentries_0_V_7[4:0],instubdata_nentries_1_V_0[4:0],instubdata_nentries_1_V_1[4:0],instubdata_nentries_1_V_2[4:0],instubdata_nentries_1_V_3[4:0],instubdata_nentries_1_V_4[4:0],instubdata_nentries_1_V_5[4:0],instubdata_nentries_1_V_6[4:0],instubdata_nentries_1_V_7[4:0],instubdata_nentries_2_V_0[4:0],instubdata_nentries_2_V_1[4:0],instubdata_nentries_2_V_2[4:0],instubdata_nentries_2_V_3[4:0],instubdata_nentries_2_V_4[4:0],instubdata_nentries_2_V_5[4:0],instubdata_nentries_2_V_6[4:0],instubdata_nentries_2_V_7[4:0],instubdata_nentries_3_V_0[4:0],instubdata_nentries_3_V_1[4:0],instubdata_nentries_3_V_2[4:0],instubdata_nentries_3_V_3[4:0],instubdata_nentries_3_V_4[4:0],instubdata_nentries_3_V_5[4:0],instubdata_nentries_3_V_6[4:0],instubdata_nentries_3_V_7[4:0],inprojdata_dataarray_data_V_address0[7:0],inprojdata_dataarray_data_V_q0[20:0],inprojdata_nentries_0_V[7:0],inprojdata_nentries_1_V[7:0],outcandmatch_dataarray_data_V_address0[7:0],outcandmatch_dataarray_data_V_d0[13:0],outcandmatch_nentries_0_V[7:0],outcandmatch_nentries_1_V[7:0]" */;
  output bx_o_V_ap_vld;
  output instubdata_dataarray_data_V_ce0;
  output inprojdata_dataarray_data_V_ce0;
  output outcandmatch_dataarray_data_V_ce0;
  output outcandmatch_dataarray_data_V_we0;
  output outcandmatch_nentries_0_V_ap_vld;
  output outcandmatch_nentries_1_V_ap_vld;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [2:0]bx_V;
  output [2:0]bx_o_V;
  output [8:0]instubdata_dataarray_data_V_address0;
  input [13:0]instubdata_dataarray_data_V_q0;
  input [4:0]instubdata_nentries_0_V_0;
  input [4:0]instubdata_nentries_0_V_1;
  input [4:0]instubdata_nentries_0_V_2;
  input [4:0]instubdata_nentries_0_V_3;
  input [4:0]instubdata_nentries_0_V_4;
  input [4:0]instubdata_nentries_0_V_5;
  input [4:0]instubdata_nentries_0_V_6;
  input [4:0]instubdata_nentries_0_V_7;
  input [4:0]instubdata_nentries_1_V_0;
  input [4:0]instubdata_nentries_1_V_1;
  input [4:0]instubdata_nentries_1_V_2;
  input [4:0]instubdata_nentries_1_V_3;
  input [4:0]instubdata_nentries_1_V_4;
  input [4:0]instubdata_nentries_1_V_5;
  input [4:0]instubdata_nentries_1_V_6;
  input [4:0]instubdata_nentries_1_V_7;
  input [4:0]instubdata_nentries_2_V_0;
  input [4:0]instubdata_nentries_2_V_1;
  input [4:0]instubdata_nentries_2_V_2;
  input [4:0]instubdata_nentries_2_V_3;
  input [4:0]instubdata_nentries_2_V_4;
  input [4:0]instubdata_nentries_2_V_5;
  input [4:0]instubdata_nentries_2_V_6;
  input [4:0]instubdata_nentries_2_V_7;
  input [4:0]instubdata_nentries_3_V_0;
  input [4:0]instubdata_nentries_3_V_1;
  input [4:0]instubdata_nentries_3_V_2;
  input [4:0]instubdata_nentries_3_V_3;
  input [4:0]instubdata_nentries_3_V_4;
  input [4:0]instubdata_nentries_3_V_5;
  input [4:0]instubdata_nentries_3_V_6;
  input [4:0]instubdata_nentries_3_V_7;
  output [7:0]inprojdata_dataarray_data_V_address0;
  input [20:0]inprojdata_dataarray_data_V_q0;
  input [7:0]inprojdata_nentries_0_V;
  input [7:0]inprojdata_nentries_1_V;
  output [7:0]outcandmatch_dataarray_data_V_address0;
  output [13:0]outcandmatch_dataarray_data_V_d0;
  output [7:0]outcandmatch_nentries_0_V;
  output [7:0]outcandmatch_nentries_1_V;
endmodule
