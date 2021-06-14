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

-- IP VLNV: xilinx.com:hls:ProjectionRouterTop:1.0
-- IP Revision: 2003021748

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY PR_L3PHIC IS
  PORT (
    proj1in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj2in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj3in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj4in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj5in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj6in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj7in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    proj8in_dataarray_data_V_ce0 : OUT STD_LOGIC;
    bx_o_V_ap_vld : OUT STD_LOGIC;
    allprojout_dataarray_data_V_ce0 : OUT STD_LOGIC;
    allprojout_dataarray_data_V_we0 : OUT STD_LOGIC;
    allprojout_nentries_0_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_1_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_2_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_3_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_4_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_5_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_6_V_ap_vld : OUT STD_LOGIC;
    allprojout_nentries_7_V_ap_vld : OUT STD_LOGIC;
    vmprojout1_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout1_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout1_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout1_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout2_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout2_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout2_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout2_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout3_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout3_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout3_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout3_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout4_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout4_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout4_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout4_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout5_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout5_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout5_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout5_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout6_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout6_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout6_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout6_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout7_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout7_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout7_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout7_nentries_1_V_ap_vld : OUT STD_LOGIC;
    vmprojout8_dataarray_data_V_ce0 : OUT STD_LOGIC;
    vmprojout8_dataarray_data_V_we0 : OUT STD_LOGIC;
    vmprojout8_nentries_0_V_ap_vld : OUT STD_LOGIC;
    vmprojout8_nentries_1_V_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    proj1in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj1in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj1in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj1in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj2in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj2in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj2in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj2in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj3in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj3in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj3in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj3in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj4in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj4in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj4in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj4in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj5in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj5in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj5in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj5in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj6in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj6in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj6in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj6in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj7in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj7in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj7in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj7in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj8in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj8in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
    proj8in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    proj8in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    allprojout_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    allprojout_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(59 DOWNTO 0);
    allprojout_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_2_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_3_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_4_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_5_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_6_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    allprojout_nentries_7_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout1_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout1_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout1_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout2_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout2_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout2_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout3_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout3_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout3_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout4_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout4_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout4_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout5_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout5_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout5_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout6_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout6_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout6_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout7_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout7_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout7_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout8_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout8_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
    vmprojout8_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    vmprojout8_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END PR_L3PHIC;

ARCHITECTURE PR_L3PHIC_arch OF PR_L3PHIC IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF PR_L3PHIC_arch: ARCHITECTURE IS "yes";
  COMPONENT ProjectionRouterTop IS
    PORT (
      proj1in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj2in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj3in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj4in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj5in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj6in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj7in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      proj8in_dataarray_data_V_ce0 : OUT STD_LOGIC;
      bx_o_V_ap_vld : OUT STD_LOGIC;
      allprojout_dataarray_data_V_ce0 : OUT STD_LOGIC;
      allprojout_dataarray_data_V_we0 : OUT STD_LOGIC;
      allprojout_nentries_0_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_1_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_2_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_3_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_4_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_5_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_6_V_ap_vld : OUT STD_LOGIC;
      allprojout_nentries_7_V_ap_vld : OUT STD_LOGIC;
      vmprojout1_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout1_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout1_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout1_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout2_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout2_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout2_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout2_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout3_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout3_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout3_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout3_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout4_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout4_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout4_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout4_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout5_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout5_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout5_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout5_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout6_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout6_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout6_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout6_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout7_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout7_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout7_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout7_nentries_1_V_ap_vld : OUT STD_LOGIC;
      vmprojout8_dataarray_data_V_ce0 : OUT STD_LOGIC;
      vmprojout8_dataarray_data_V_we0 : OUT STD_LOGIC;
      vmprojout8_nentries_0_V_ap_vld : OUT STD_LOGIC;
      vmprojout8_nentries_1_V_ap_vld : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      proj1in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj1in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj1in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj1in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj2in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj2in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj2in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj2in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj3in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj3in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj3in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj3in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj4in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj4in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj4in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj4in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj5in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj5in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj5in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj5in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj6in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj6in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj6in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj6in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj7in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj7in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj7in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj7in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj8in_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj8in_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(59 DOWNTO 0);
      proj8in_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      proj8in_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      allprojout_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      allprojout_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(59 DOWNTO 0);
      allprojout_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_2_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_3_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_4_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_5_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_6_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      allprojout_nentries_7_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout1_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout1_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout1_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout1_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout2_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout2_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout2_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout2_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout3_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout3_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout3_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout3_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout4_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout4_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout4_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout4_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout5_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout5_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout5_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout5_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout6_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout6_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout6_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout6_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout7_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout7_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout7_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout7_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout8_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout8_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(20 DOWNTO 0);
      vmprojout8_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      vmprojout8_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT ProjectionRouterTop;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF PR_L3PHIC_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout8_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout8_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout8_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout8_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout8_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout8_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout8_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout8_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout8_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout8_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout8_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout8_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout8_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout8_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout8_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout8_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout7_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout7_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout7_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout7_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout7_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout7_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout7_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout7_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout7_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout7_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout7_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout7_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout7_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout7_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout7_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout7_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout6_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout6_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout6_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout6_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout6_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout6_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout6_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout6_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout6_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout6_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout6_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout6_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout6_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout6_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout6_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout6_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout5_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout5_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout5_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout5_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout5_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout5_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout5_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout5_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout5_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout5_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout5_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout5_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout5_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout5_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout5_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout5_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout4_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout4_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout4_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout4_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout4_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout4_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout4_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout4_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout4_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout4_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout4_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout4_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout4_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout4_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout4_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout4_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout3_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout3_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout3_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout3_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout3_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout3_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout3_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout3_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout3_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout3_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout3_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout3_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout3_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout3_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout3_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout3_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout2_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout2_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout2_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout2_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout2_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout2_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout2_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout2_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout2_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout2_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout2_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout2_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout2_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout2_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout2_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout2_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout1_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME vmprojout1_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout1_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout1_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout1_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME vmprojout1_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout1_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout1_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout1_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME vmprojout1_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout1_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout1_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF vmprojout1_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME vmprojout1_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF vmprojout1_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 vmprojout1_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_7_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_7_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_7_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_7_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_6_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_6_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_6_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_6_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_5_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_5_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_5_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_5_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_4_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_4_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_4_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_4_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_3_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_3_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_3_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_3_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_2_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_2_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_2_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_2_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME allprojout_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME allprojout_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF allprojout_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME allprojout_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF allprojout_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 allprojout_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bx_o_V: SIGNAL IS "XIL_INTERFACENAME bx_o_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value f" & 
"alse}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF bx_o_V: SIGNAL IS "xilinx.com:signal:data:1.0 bx_o_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj8in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj8in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj8in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj8in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj8in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj8in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj8in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj8in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj8in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj8in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj8in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj8in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj8in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj8in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj8in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj8in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj7in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj7in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj7in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj7in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj7in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj7in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj7in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj7in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj7in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj7in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj7in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj7in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj7in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj7in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj7in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj7in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj6in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj6in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj6in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj6in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj6in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj6in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj6in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj6in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj6in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj6in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj6in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj6in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj6in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj6in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj6in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj6in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj5in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj5in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj5in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj5in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj5in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj5in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj5in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj5in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj5in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj5in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj5in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj5in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj5in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj5in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj5in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj5in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj4in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj4in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj4in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj4in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj4in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj4in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj4in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj4in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj4in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj4in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj4in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj4in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj4in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj4in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj4in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj4in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj3in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj3in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj3in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj3in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj3in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj3in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj3in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj3in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj3in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj3in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj3in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj3in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj3in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj3in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj3in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj3in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj2in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj2in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj2in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj2in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj2in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj2in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj2in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj2in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj2in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj2in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj2in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj2in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj2in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj2in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj2in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj2in_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj1in_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME proj1in_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj1in_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj1in_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj1in_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME proj1in_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maxim" & 
"um {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj1in_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 proj1in_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj1in_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME proj1in_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 60} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum " & 
"{} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj1in_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 proj1in_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF proj1in_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME proj1in_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF proj1in_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 proj1in_dataarray_data_V_address0 DATA";
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
  U0 : ProjectionRouterTop
    PORT MAP (
      proj1in_dataarray_data_V_ce0 => proj1in_dataarray_data_V_ce0,
      proj2in_dataarray_data_V_ce0 => proj2in_dataarray_data_V_ce0,
      proj3in_dataarray_data_V_ce0 => proj3in_dataarray_data_V_ce0,
      proj4in_dataarray_data_V_ce0 => proj4in_dataarray_data_V_ce0,
      proj5in_dataarray_data_V_ce0 => proj5in_dataarray_data_V_ce0,
      proj6in_dataarray_data_V_ce0 => proj6in_dataarray_data_V_ce0,
      proj7in_dataarray_data_V_ce0 => proj7in_dataarray_data_V_ce0,
      proj8in_dataarray_data_V_ce0 => proj8in_dataarray_data_V_ce0,
      bx_o_V_ap_vld => bx_o_V_ap_vld,
      allprojout_dataarray_data_V_ce0 => allprojout_dataarray_data_V_ce0,
      allprojout_dataarray_data_V_we0 => allprojout_dataarray_data_V_we0,
      allprojout_nentries_0_V_ap_vld => allprojout_nentries_0_V_ap_vld,
      allprojout_nentries_1_V_ap_vld => allprojout_nentries_1_V_ap_vld,
      allprojout_nentries_2_V_ap_vld => allprojout_nentries_2_V_ap_vld,
      allprojout_nentries_3_V_ap_vld => allprojout_nentries_3_V_ap_vld,
      allprojout_nentries_4_V_ap_vld => allprojout_nentries_4_V_ap_vld,
      allprojout_nentries_5_V_ap_vld => allprojout_nentries_5_V_ap_vld,
      allprojout_nentries_6_V_ap_vld => allprojout_nentries_6_V_ap_vld,
      allprojout_nentries_7_V_ap_vld => allprojout_nentries_7_V_ap_vld,
      vmprojout1_dataarray_data_V_ce0 => vmprojout1_dataarray_data_V_ce0,
      vmprojout1_dataarray_data_V_we0 => vmprojout1_dataarray_data_V_we0,
      vmprojout1_nentries_0_V_ap_vld => vmprojout1_nentries_0_V_ap_vld,
      vmprojout1_nentries_1_V_ap_vld => vmprojout1_nentries_1_V_ap_vld,
      vmprojout2_dataarray_data_V_ce0 => vmprojout2_dataarray_data_V_ce0,
      vmprojout2_dataarray_data_V_we0 => vmprojout2_dataarray_data_V_we0,
      vmprojout2_nentries_0_V_ap_vld => vmprojout2_nentries_0_V_ap_vld,
      vmprojout2_nentries_1_V_ap_vld => vmprojout2_nentries_1_V_ap_vld,
      vmprojout3_dataarray_data_V_ce0 => vmprojout3_dataarray_data_V_ce0,
      vmprojout3_dataarray_data_V_we0 => vmprojout3_dataarray_data_V_we0,
      vmprojout3_nentries_0_V_ap_vld => vmprojout3_nentries_0_V_ap_vld,
      vmprojout3_nentries_1_V_ap_vld => vmprojout3_nentries_1_V_ap_vld,
      vmprojout4_dataarray_data_V_ce0 => vmprojout4_dataarray_data_V_ce0,
      vmprojout4_dataarray_data_V_we0 => vmprojout4_dataarray_data_V_we0,
      vmprojout4_nentries_0_V_ap_vld => vmprojout4_nentries_0_V_ap_vld,
      vmprojout4_nentries_1_V_ap_vld => vmprojout4_nentries_1_V_ap_vld,
      vmprojout5_dataarray_data_V_ce0 => vmprojout5_dataarray_data_V_ce0,
      vmprojout5_dataarray_data_V_we0 => vmprojout5_dataarray_data_V_we0,
      vmprojout5_nentries_0_V_ap_vld => vmprojout5_nentries_0_V_ap_vld,
      vmprojout5_nentries_1_V_ap_vld => vmprojout5_nentries_1_V_ap_vld,
      vmprojout6_dataarray_data_V_ce0 => vmprojout6_dataarray_data_V_ce0,
      vmprojout6_dataarray_data_V_we0 => vmprojout6_dataarray_data_V_we0,
      vmprojout6_nentries_0_V_ap_vld => vmprojout6_nentries_0_V_ap_vld,
      vmprojout6_nentries_1_V_ap_vld => vmprojout6_nentries_1_V_ap_vld,
      vmprojout7_dataarray_data_V_ce0 => vmprojout7_dataarray_data_V_ce0,
      vmprojout7_dataarray_data_V_we0 => vmprojout7_dataarray_data_V_we0,
      vmprojout7_nentries_0_V_ap_vld => vmprojout7_nentries_0_V_ap_vld,
      vmprojout7_nentries_1_V_ap_vld => vmprojout7_nentries_1_V_ap_vld,
      vmprojout8_dataarray_data_V_ce0 => vmprojout8_dataarray_data_V_ce0,
      vmprojout8_dataarray_data_V_we0 => vmprojout8_dataarray_data_V_we0,
      vmprojout8_nentries_0_V_ap_vld => vmprojout8_nentries_0_V_ap_vld,
      vmprojout8_nentries_1_V_ap_vld => vmprojout8_nentries_1_V_ap_vld,
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      bx_V => bx_V,
      proj1in_dataarray_data_V_address0 => proj1in_dataarray_data_V_address0,
      proj1in_dataarray_data_V_q0 => proj1in_dataarray_data_V_q0,
      proj1in_nentries_0_V => proj1in_nentries_0_V,
      proj1in_nentries_1_V => proj1in_nentries_1_V,
      proj2in_dataarray_data_V_address0 => proj2in_dataarray_data_V_address0,
      proj2in_dataarray_data_V_q0 => proj2in_dataarray_data_V_q0,
      proj2in_nentries_0_V => proj2in_nentries_0_V,
      proj2in_nentries_1_V => proj2in_nentries_1_V,
      proj3in_dataarray_data_V_address0 => proj3in_dataarray_data_V_address0,
      proj3in_dataarray_data_V_q0 => proj3in_dataarray_data_V_q0,
      proj3in_nentries_0_V => proj3in_nentries_0_V,
      proj3in_nentries_1_V => proj3in_nentries_1_V,
      proj4in_dataarray_data_V_address0 => proj4in_dataarray_data_V_address0,
      proj4in_dataarray_data_V_q0 => proj4in_dataarray_data_V_q0,
      proj4in_nentries_0_V => proj4in_nentries_0_V,
      proj4in_nentries_1_V => proj4in_nentries_1_V,
      proj5in_dataarray_data_V_address0 => proj5in_dataarray_data_V_address0,
      proj5in_dataarray_data_V_q0 => proj5in_dataarray_data_V_q0,
      proj5in_nentries_0_V => proj5in_nentries_0_V,
      proj5in_nentries_1_V => proj5in_nentries_1_V,
      proj6in_dataarray_data_V_address0 => proj6in_dataarray_data_V_address0,
      proj6in_dataarray_data_V_q0 => proj6in_dataarray_data_V_q0,
      proj6in_nentries_0_V => proj6in_nentries_0_V,
      proj6in_nentries_1_V => proj6in_nentries_1_V,
      proj7in_dataarray_data_V_address0 => proj7in_dataarray_data_V_address0,
      proj7in_dataarray_data_V_q0 => proj7in_dataarray_data_V_q0,
      proj7in_nentries_0_V => proj7in_nentries_0_V,
      proj7in_nentries_1_V => proj7in_nentries_1_V,
      proj8in_dataarray_data_V_address0 => proj8in_dataarray_data_V_address0,
      proj8in_dataarray_data_V_q0 => proj8in_dataarray_data_V_q0,
      proj8in_nentries_0_V => proj8in_nentries_0_V,
      proj8in_nentries_1_V => proj8in_nentries_1_V,
      bx_o_V => bx_o_V,
      allprojout_dataarray_data_V_address0 => allprojout_dataarray_data_V_address0,
      allprojout_dataarray_data_V_d0 => allprojout_dataarray_data_V_d0,
      allprojout_nentries_0_V => allprojout_nentries_0_V,
      allprojout_nentries_1_V => allprojout_nentries_1_V,
      allprojout_nentries_2_V => allprojout_nentries_2_V,
      allprojout_nentries_3_V => allprojout_nentries_3_V,
      allprojout_nentries_4_V => allprojout_nentries_4_V,
      allprojout_nentries_5_V => allprojout_nentries_5_V,
      allprojout_nentries_6_V => allprojout_nentries_6_V,
      allprojout_nentries_7_V => allprojout_nentries_7_V,
      vmprojout1_dataarray_data_V_address0 => vmprojout1_dataarray_data_V_address0,
      vmprojout1_dataarray_data_V_d0 => vmprojout1_dataarray_data_V_d0,
      vmprojout1_nentries_0_V => vmprojout1_nentries_0_V,
      vmprojout1_nentries_1_V => vmprojout1_nentries_1_V,
      vmprojout2_dataarray_data_V_address0 => vmprojout2_dataarray_data_V_address0,
      vmprojout2_dataarray_data_V_d0 => vmprojout2_dataarray_data_V_d0,
      vmprojout2_nentries_0_V => vmprojout2_nentries_0_V,
      vmprojout2_nentries_1_V => vmprojout2_nentries_1_V,
      vmprojout3_dataarray_data_V_address0 => vmprojout3_dataarray_data_V_address0,
      vmprojout3_dataarray_data_V_d0 => vmprojout3_dataarray_data_V_d0,
      vmprojout3_nentries_0_V => vmprojout3_nentries_0_V,
      vmprojout3_nentries_1_V => vmprojout3_nentries_1_V,
      vmprojout4_dataarray_data_V_address0 => vmprojout4_dataarray_data_V_address0,
      vmprojout4_dataarray_data_V_d0 => vmprojout4_dataarray_data_V_d0,
      vmprojout4_nentries_0_V => vmprojout4_nentries_0_V,
      vmprojout4_nentries_1_V => vmprojout4_nentries_1_V,
      vmprojout5_dataarray_data_V_address0 => vmprojout5_dataarray_data_V_address0,
      vmprojout5_dataarray_data_V_d0 => vmprojout5_dataarray_data_V_d0,
      vmprojout5_nentries_0_V => vmprojout5_nentries_0_V,
      vmprojout5_nentries_1_V => vmprojout5_nentries_1_V,
      vmprojout6_dataarray_data_V_address0 => vmprojout6_dataarray_data_V_address0,
      vmprojout6_dataarray_data_V_d0 => vmprojout6_dataarray_data_V_d0,
      vmprojout6_nentries_0_V => vmprojout6_nentries_0_V,
      vmprojout6_nentries_1_V => vmprojout6_nentries_1_V,
      vmprojout7_dataarray_data_V_address0 => vmprojout7_dataarray_data_V_address0,
      vmprojout7_dataarray_data_V_d0 => vmprojout7_dataarray_data_V_d0,
      vmprojout7_nentries_0_V => vmprojout7_nentries_0_V,
      vmprojout7_nentries_1_V => vmprojout7_nentries_1_V,
      vmprojout8_dataarray_data_V_address0 => vmprojout8_dataarray_data_V_address0,
      vmprojout8_dataarray_data_V_d0 => vmprojout8_dataarray_data_V_d0,
      vmprojout8_nentries_0_V => vmprojout8_nentries_0_V,
      vmprojout8_nentries_1_V => vmprojout8_nentries_1_V
    );
END PR_L3PHIC_arch;
