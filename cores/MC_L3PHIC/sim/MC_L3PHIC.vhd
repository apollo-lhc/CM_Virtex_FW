-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:MatchCalculatorTop:1.0
-- IP Revision: 2003021753

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MC_L3PHIC IS
  PORT (
    match1_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match2_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match3_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match4_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match5_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match6_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match7_dataarray_data_V_ce0 : OUT STD_LOGIC;
    match8_dataarray_data_V_ce0 : OUT STD_LOGIC;
    allstub_dataarray_data_V_ce0 : OUT STD_LOGIC;
    allproj_dataarray_data_V_ce0 : OUT STD_LOGIC;
    bx_o_V_ap_vld : OUT STD_LOGIC;
    fullmatch1_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch1_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch1_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch1_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch2_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch2_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch2_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch2_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch3_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch3_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch3_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch3_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch4_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch4_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch4_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch4_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch5_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch5_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch5_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch5_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch6_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch6_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch6_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch6_nentries_1_V_ap_vld : OUT STD_LOGIC;
    fullmatch7_dataarray_data_V_ce0 : OUT STD_LOGIC;
    fullmatch7_dataarray_data_V_we0 : OUT STD_LOGIC;
    fullmatch7_nentries_0_V_ap_vld : OUT STD_LOGIC;
    fullmatch7_nentries_1_V_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    match1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match1_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match1_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match1_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match2_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match2_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match2_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match3_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match3_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match3_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match4_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match4_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match4_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match5_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match5_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match5_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match6_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match6_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match6_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match7_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match7_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match7_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match8_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    match8_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    match8_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    match8_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    allstub_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
    allstub_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_2_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_3_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_4_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_5_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_6_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allstub_nentries_7_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    allproj_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    allproj_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_2_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_3_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_4_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_5_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_6_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    allproj_nentries_7_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    fullmatch1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch1_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch1_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch1_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch2_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch2_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch2_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch3_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch3_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch3_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch4_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch4_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch4_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch5_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch5_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch5_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch6_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch6_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch6_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch7_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
    fullmatch7_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fullmatch7_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END MC_L3PHIC;

ARCHITECTURE MC_L3PHIC_arch OF MC_L3PHIC IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MC_L3PHIC_arch: ARCHITECTURE IS "yes";
  COMPONENT MatchCalculatorTop IS
    PORT (
      match1_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match2_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match3_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match4_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match5_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match6_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match7_dataarray_data_V_ce0 : OUT STD_LOGIC;
      match8_dataarray_data_V_ce0 : OUT STD_LOGIC;
      allstub_dataarray_data_V_ce0 : OUT STD_LOGIC;
      allproj_dataarray_data_V_ce0 : OUT STD_LOGIC;
      bx_o_V_ap_vld : OUT STD_LOGIC;
      fullmatch1_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch1_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch1_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch1_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch2_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch2_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch2_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch2_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch3_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch3_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch3_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch3_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch4_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch4_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch4_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch4_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch5_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch5_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch5_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch5_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch6_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch6_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch6_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch6_nentries_1_V_ap_vld : OUT STD_LOGIC;
      fullmatch7_dataarray_data_V_ce0 : OUT STD_LOGIC;
      fullmatch7_dataarray_data_V_we0 : OUT STD_LOGIC;
      fullmatch7_nentries_0_V_ap_vld : OUT STD_LOGIC;
      fullmatch7_nentries_1_V_ap_vld : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      match1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match1_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match1_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match1_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match2_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match2_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match2_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match3_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match3_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match3_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match4_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match4_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match4_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match5_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match5_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match5_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match6_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match6_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match6_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match7_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match7_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match7_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match8_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      match8_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      match8_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      match8_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      allstub_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      allstub_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_2_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_3_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_4_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_5_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_6_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allstub_nentries_7_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      allproj_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      allproj_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_2_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_3_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_4_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_5_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_6_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      allproj_nentries_7_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      fullmatch1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch1_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch1_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch1_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch2_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch2_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch2_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch3_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch3_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch3_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch4_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch4_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch4_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch5_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch5_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch5_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch6_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch6_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch6_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch7_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(44 DOWNTO 0);
      fullmatch7_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fullmatch7_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT MatchCalculatorTop;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MC_L3PHIC_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch7_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch7_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch7_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch7_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch7_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch7_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch7_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch7_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch7_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch7_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch7_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch7_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch7_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch7_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch7_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch7_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch6_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch6_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch6_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch6_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch6_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch6_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch6_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch6_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch6_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch6_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch6_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch6_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch6_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch6_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch6_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch6_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch5_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch5_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch5_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch5_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch5_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch5_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch5_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch5_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch5_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch5_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch5_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch5_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch5_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch5_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch5_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch5_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch4_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch4_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch4_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch4_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch4_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch4_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch4_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch4_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch4_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch4_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch4_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch4_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch4_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch4_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch4_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch4_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch3_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch3_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch3_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch3_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch3_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch3_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch3_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch3_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch3_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch3_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch3_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch3_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch3_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch3_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch3_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch3_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch2_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch2_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch2_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch2_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch2_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch2_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch2_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch2_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch2_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch2_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch2_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch2_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch2_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch2_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch2_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch2_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch1_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME fullmatch1_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch1_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch1_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch1_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME fullmatch1_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch1_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch1_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch1_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME fullmatch1_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 45} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch1_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch1_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fullmatch1_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME fullmatch1_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fullmatch1_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 fullmatch1_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bx_o_V: SIGNAL IS "XIL_INTERFACENAME bx_o_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value f" & 
"alse}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF bx_o_V: SIGNAL IS "xilinx.com:signal:data:1.0 bx_o_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_7_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_7_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_7_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_7_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_6_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_6_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_6_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_6_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_5_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_5_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_5_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_5_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_4_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_4_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_4_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_4_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_3_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_3_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_3_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_3_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_2_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_2_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_2_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_2_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME allproj_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME allproj_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allproj_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME allproj_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allproj_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 allproj_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_7_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_7_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_7_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_7_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_6_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_6_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_6_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_6_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_5_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_5_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_5_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_5_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_4_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_4_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_4_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_4_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_3_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_3_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_3_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_3_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_2_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_2_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_2_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_2_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME allstub_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME allstub_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 36} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allstub_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME allstub_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allstub_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 allstub_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match8_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match8_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match8_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match8_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match8_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match8_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match8_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match8_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match8_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match8_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match8_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match8_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match8_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match8_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match8_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match8_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match7_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match7_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match7_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match7_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match7_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match7_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match7_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match7_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match7_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match7_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match7_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match7_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match7_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match7_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match7_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match7_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match6_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match6_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match6_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match6_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match6_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match6_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match6_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match6_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match6_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match6_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match6_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match6_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match6_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match6_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match6_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match6_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match5_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match5_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match5_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match5_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match5_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match5_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match5_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match5_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match5_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match5_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match5_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match5_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match5_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match5_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match5_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match5_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match4_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match4_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match4_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match4_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match4_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match4_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match4_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match4_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match4_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match4_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match4_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match4_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match4_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match4_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match4_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match4_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match3_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match3_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match3_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match3_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match3_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match3_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match3_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match3_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match3_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match3_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match3_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match3_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match3_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match3_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match3_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match3_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match2_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match2_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match2_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match2_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match2_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match2_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match2_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match2_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match2_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match2_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match2_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match2_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match2_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match2_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match2_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match2_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match1_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME match1_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match1_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 match1_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match1_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME match1_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximu" & 
"m {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match1_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 match1_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match1_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME match1_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {" & 
"} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match1_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 match1_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF match1_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME match1_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF match1_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 match1_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bx_V: SIGNAL IS "XIL_INTERFACENAME bx_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value fal" & 
"se}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF bx_V: SIGNAL IS "xilinx.com:signal:data:1.0 bx_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_start: SIGNAL IS "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum " & 
"{}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long" & 
" minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst: SIGNAL IS "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : MatchCalculatorTop
    PORT MAP (
      match1_dataarray_data_V_ce0 => match1_dataarray_data_V_ce0,
      match2_dataarray_data_V_ce0 => match2_dataarray_data_V_ce0,
      match3_dataarray_data_V_ce0 => match3_dataarray_data_V_ce0,
      match4_dataarray_data_V_ce0 => match4_dataarray_data_V_ce0,
      match5_dataarray_data_V_ce0 => match5_dataarray_data_V_ce0,
      match6_dataarray_data_V_ce0 => match6_dataarray_data_V_ce0,
      match7_dataarray_data_V_ce0 => match7_dataarray_data_V_ce0,
      match8_dataarray_data_V_ce0 => match8_dataarray_data_V_ce0,
      allstub_dataarray_data_V_ce0 => allstub_dataarray_data_V_ce0,
      allproj_dataarray_data_V_ce0 => allproj_dataarray_data_V_ce0,
      bx_o_V_ap_vld => bx_o_V_ap_vld,
      fullmatch1_dataarray_data_V_ce0 => fullmatch1_dataarray_data_V_ce0,
      fullmatch1_dataarray_data_V_we0 => fullmatch1_dataarray_data_V_we0,
      fullmatch1_nentries_0_V_ap_vld => fullmatch1_nentries_0_V_ap_vld,
      fullmatch1_nentries_1_V_ap_vld => fullmatch1_nentries_1_V_ap_vld,
      fullmatch2_dataarray_data_V_ce0 => fullmatch2_dataarray_data_V_ce0,
      fullmatch2_dataarray_data_V_we0 => fullmatch2_dataarray_data_V_we0,
      fullmatch2_nentries_0_V_ap_vld => fullmatch2_nentries_0_V_ap_vld,
      fullmatch2_nentries_1_V_ap_vld => fullmatch2_nentries_1_V_ap_vld,
      fullmatch3_dataarray_data_V_ce0 => fullmatch3_dataarray_data_V_ce0,
      fullmatch3_dataarray_data_V_we0 => fullmatch3_dataarray_data_V_we0,
      fullmatch3_nentries_0_V_ap_vld => fullmatch3_nentries_0_V_ap_vld,
      fullmatch3_nentries_1_V_ap_vld => fullmatch3_nentries_1_V_ap_vld,
      fullmatch4_dataarray_data_V_ce0 => fullmatch4_dataarray_data_V_ce0,
      fullmatch4_dataarray_data_V_we0 => fullmatch4_dataarray_data_V_we0,
      fullmatch4_nentries_0_V_ap_vld => fullmatch4_nentries_0_V_ap_vld,
      fullmatch4_nentries_1_V_ap_vld => fullmatch4_nentries_1_V_ap_vld,
      fullmatch5_dataarray_data_V_ce0 => fullmatch5_dataarray_data_V_ce0,
      fullmatch5_dataarray_data_V_we0 => fullmatch5_dataarray_data_V_we0,
      fullmatch5_nentries_0_V_ap_vld => fullmatch5_nentries_0_V_ap_vld,
      fullmatch5_nentries_1_V_ap_vld => fullmatch5_nentries_1_V_ap_vld,
      fullmatch6_dataarray_data_V_ce0 => fullmatch6_dataarray_data_V_ce0,
      fullmatch6_dataarray_data_V_we0 => fullmatch6_dataarray_data_V_we0,
      fullmatch6_nentries_0_V_ap_vld => fullmatch6_nentries_0_V_ap_vld,
      fullmatch6_nentries_1_V_ap_vld => fullmatch6_nentries_1_V_ap_vld,
      fullmatch7_dataarray_data_V_ce0 => fullmatch7_dataarray_data_V_ce0,
      fullmatch7_dataarray_data_V_we0 => fullmatch7_dataarray_data_V_we0,
      fullmatch7_nentries_0_V_ap_vld => fullmatch7_nentries_0_V_ap_vld,
      fullmatch7_nentries_1_V_ap_vld => fullmatch7_nentries_1_V_ap_vld,
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      bx_V => bx_V,
      match1_dataarray_data_V_address0 => match1_dataarray_data_V_address0,
      match1_dataarray_data_V_q0 => match1_dataarray_data_V_q0,
      match1_nentries_0_V => match1_nentries_0_V,
      match1_nentries_1_V => match1_nentries_1_V,
      match2_dataarray_data_V_address0 => match2_dataarray_data_V_address0,
      match2_dataarray_data_V_q0 => match2_dataarray_data_V_q0,
      match2_nentries_0_V => match2_nentries_0_V,
      match2_nentries_1_V => match2_nentries_1_V,
      match3_dataarray_data_V_address0 => match3_dataarray_data_V_address0,
      match3_dataarray_data_V_q0 => match3_dataarray_data_V_q0,
      match3_nentries_0_V => match3_nentries_0_V,
      match3_nentries_1_V => match3_nentries_1_V,
      match4_dataarray_data_V_address0 => match4_dataarray_data_V_address0,
      match4_dataarray_data_V_q0 => match4_dataarray_data_V_q0,
      match4_nentries_0_V => match4_nentries_0_V,
      match4_nentries_1_V => match4_nentries_1_V,
      match5_dataarray_data_V_address0 => match5_dataarray_data_V_address0,
      match5_dataarray_data_V_q0 => match5_dataarray_data_V_q0,
      match5_nentries_0_V => match5_nentries_0_V,
      match5_nentries_1_V => match5_nentries_1_V,
      match6_dataarray_data_V_address0 => match6_dataarray_data_V_address0,
      match6_dataarray_data_V_q0 => match6_dataarray_data_V_q0,
      match6_nentries_0_V => match6_nentries_0_V,
      match6_nentries_1_V => match6_nentries_1_V,
      match7_dataarray_data_V_address0 => match7_dataarray_data_V_address0,
      match7_dataarray_data_V_q0 => match7_dataarray_data_V_q0,
      match7_nentries_0_V => match7_nentries_0_V,
      match7_nentries_1_V => match7_nentries_1_V,
      match8_dataarray_data_V_address0 => match8_dataarray_data_V_address0,
      match8_dataarray_data_V_q0 => match8_dataarray_data_V_q0,
      match8_nentries_0_V => match8_nentries_0_V,
      match8_nentries_1_V => match8_nentries_1_V,
      allstub_dataarray_data_V_address0 => allstub_dataarray_data_V_address0,
      allstub_dataarray_data_V_q0 => allstub_dataarray_data_V_q0,
      allstub_nentries_0_V => allstub_nentries_0_V,
      allstub_nentries_1_V => allstub_nentries_1_V,
      allstub_nentries_2_V => allstub_nentries_2_V,
      allstub_nentries_3_V => allstub_nentries_3_V,
      allstub_nentries_4_V => allstub_nentries_4_V,
      allstub_nentries_5_V => allstub_nentries_5_V,
      allstub_nentries_6_V => allstub_nentries_6_V,
      allstub_nentries_7_V => allstub_nentries_7_V,
      allproj_dataarray_data_V_address0 => allproj_dataarray_data_V_address0,
      allproj_dataarray_data_V_q0 => allproj_dataarray_data_V_q0,
      allproj_nentries_0_V => allproj_nentries_0_V,
      allproj_nentries_1_V => allproj_nentries_1_V,
      allproj_nentries_2_V => allproj_nentries_2_V,
      allproj_nentries_3_V => allproj_nentries_3_V,
      allproj_nentries_4_V => allproj_nentries_4_V,
      allproj_nentries_5_V => allproj_nentries_5_V,
      allproj_nentries_6_V => allproj_nentries_6_V,
      allproj_nentries_7_V => allproj_nentries_7_V,
      bx_o_V => bx_o_V,
      fullmatch1_dataarray_data_V_address0 => fullmatch1_dataarray_data_V_address0,
      fullmatch1_dataarray_data_V_d0 => fullmatch1_dataarray_data_V_d0,
      fullmatch1_nentries_0_V => fullmatch1_nentries_0_V,
      fullmatch1_nentries_1_V => fullmatch1_nentries_1_V,
      fullmatch2_dataarray_data_V_address0 => fullmatch2_dataarray_data_V_address0,
      fullmatch2_dataarray_data_V_d0 => fullmatch2_dataarray_data_V_d0,
      fullmatch2_nentries_0_V => fullmatch2_nentries_0_V,
      fullmatch2_nentries_1_V => fullmatch2_nentries_1_V,
      fullmatch3_dataarray_data_V_address0 => fullmatch3_dataarray_data_V_address0,
      fullmatch3_dataarray_data_V_d0 => fullmatch3_dataarray_data_V_d0,
      fullmatch3_nentries_0_V => fullmatch3_nentries_0_V,
      fullmatch3_nentries_1_V => fullmatch3_nentries_1_V,
      fullmatch4_dataarray_data_V_address0 => fullmatch4_dataarray_data_V_address0,
      fullmatch4_dataarray_data_V_d0 => fullmatch4_dataarray_data_V_d0,
      fullmatch4_nentries_0_V => fullmatch4_nentries_0_V,
      fullmatch4_nentries_1_V => fullmatch4_nentries_1_V,
      fullmatch5_dataarray_data_V_address0 => fullmatch5_dataarray_data_V_address0,
      fullmatch5_dataarray_data_V_d0 => fullmatch5_dataarray_data_V_d0,
      fullmatch5_nentries_0_V => fullmatch5_nentries_0_V,
      fullmatch5_nentries_1_V => fullmatch5_nentries_1_V,
      fullmatch6_dataarray_data_V_address0 => fullmatch6_dataarray_data_V_address0,
      fullmatch6_dataarray_data_V_d0 => fullmatch6_dataarray_data_V_d0,
      fullmatch6_nentries_0_V => fullmatch6_nentries_0_V,
      fullmatch6_nentries_1_V => fullmatch6_nentries_1_V,
      fullmatch7_dataarray_data_V_address0 => fullmatch7_dataarray_data_V_address0,
      fullmatch7_dataarray_data_V_d0 => fullmatch7_dataarray_data_V_d0,
      fullmatch7_nentries_0_V => fullmatch7_nentries_0_V,
      fullmatch7_nentries_1_V => fullmatch7_nentries_1_V
    );
END MC_L3PHIC_arch;
