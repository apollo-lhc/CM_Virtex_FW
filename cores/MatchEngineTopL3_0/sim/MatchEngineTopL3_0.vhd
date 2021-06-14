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

-- IP VLNV: xilinx.com:hls:MatchEngineTopL3:1.0
-- IP Revision: 2003021750

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MatchEngineTopL3_0 IS
  PORT (
    bx_o_V_ap_vld : OUT STD_LOGIC;
    instubdata_dataarray_data_V_ce0 : OUT STD_LOGIC;
    inprojdata_dataarray_data_V_ce0 : OUT STD_LOGIC;
    outcandmatch_dataarray_data_V_ce0 : OUT STD_LOGIC;
    outcandmatch_dataarray_data_V_we0 : OUT STD_LOGIC;
    outcandmatch_nentries_0_V_ap_vld : OUT STD_LOGIC;
    outcandmatch_nentries_1_V_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    instubdata_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    instubdata_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    instubdata_nentries_0_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_0_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_1_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_2_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    instubdata_nentries_3_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    inprojdata_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    inprojdata_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
    inprojdata_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    inprojdata_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    outcandmatch_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    outcandmatch_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    outcandmatch_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    outcandmatch_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END MatchEngineTopL3_0;

ARCHITECTURE MatchEngineTopL3_0_arch OF MatchEngineTopL3_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF MatchEngineTopL3_0_arch: ARCHITECTURE IS "yes";
  COMPONENT MatchEngineTopL3 IS
    PORT (
      bx_o_V_ap_vld : OUT STD_LOGIC;
      instubdata_dataarray_data_V_ce0 : OUT STD_LOGIC;
      inprojdata_dataarray_data_V_ce0 : OUT STD_LOGIC;
      outcandmatch_dataarray_data_V_ce0 : OUT STD_LOGIC;
      outcandmatch_dataarray_data_V_we0 : OUT STD_LOGIC;
      outcandmatch_nentries_0_V_ap_vld : OUT STD_LOGIC;
      outcandmatch_nentries_1_V_ap_vld : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      bx_V : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      bx_o_V : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      instubdata_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
      instubdata_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      instubdata_nentries_0_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_0_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_1_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_2_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_4 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_6 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      instubdata_nentries_3_V_7 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      inprojdata_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      inprojdata_dataarray_data_V_q0 : IN STD_LOGIC_VECTOR(20 DOWNTO 0);
      inprojdata_nentries_0_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      inprojdata_nentries_1_V : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      outcandmatch_dataarray_data_V_address0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      outcandmatch_dataarray_data_V_d0 : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
      outcandmatch_nentries_0_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      outcandmatch_nentries_1_V : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT MatchEngineTopL3;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF MatchEngineTopL3_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF outcandmatch_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME outcandmatch_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF outcandmatch_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 outcandmatch_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF outcandmatch_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME outcandmatch_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF outcandmatch_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 outcandmatch_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF outcandmatch_dataarray_data_V_d0: SIGNAL IS "XIL_INTERFACENAME outcandmatch_dataarray_data_V_d0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool min" & 
"imum {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF outcandmatch_dataarray_data_V_d0: SIGNAL IS "xilinx.com:signal:data:1.0 outcandmatch_dataarray_data_V_d0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF outcandmatch_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME outcandmatch_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF outcandmatch_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 outcandmatch_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF inprojdata_nentries_1_V: SIGNAL IS "XIL_INTERFACENAME inprojdata_nentries_1_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF inprojdata_nentries_1_V: SIGNAL IS "xilinx.com:signal:data:1.0 inprojdata_nentries_1_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF inprojdata_nentries_0_V: SIGNAL IS "XIL_INTERFACENAME inprojdata_nentries_0_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} ma" & 
"ximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF inprojdata_nentries_0_V: SIGNAL IS "xilinx.com:signal:data:1.0 inprojdata_nentries_0_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF inprojdata_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME inprojdata_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 21} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF inprojdata_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 inprojdata_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF inprojdata_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME inprojdata_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF inprojdata_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 inprojdata_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_7: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_7, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_7: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_7 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_6: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_6, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_6: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_6 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_5: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_5, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_5: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_5 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_4: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_4, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_4: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_4 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_3: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_3: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_3 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_2: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_2: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_2 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_1: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_1: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_1 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_3_V_0: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_3_V_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_3_V_0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_3_V_0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_7: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_7, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_7: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_7 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_6: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_6, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_6: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_6 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_5: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_5, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_5: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_5 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_4: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_4, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_4: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_4 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_3: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_3: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_3 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_2: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_2: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_2 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_1: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_1: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_1 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_2_V_0: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_2_V_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_2_V_0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_2_V_0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_7: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_7, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_7: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_7 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_6: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_6, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_6: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_6 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_5: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_5, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_5: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_5 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_4: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_4, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_4: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_4 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_3: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_3: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_3 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_2: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_2: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_2 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_1: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_1: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_1 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_1_V_0: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_1_V_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_1_V_0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_1_V_0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_7: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_7, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_7: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_7 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_6: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_6, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_6: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_6 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_5: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_5, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_5: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_5 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_4: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_4, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_4: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_4 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_3: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_3: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_3 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_2: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_2: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_2 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_1: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_1: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_1 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_nentries_0_V_0: SIGNAL IS "XIL_INTERFACENAME instubdata_nentries_0_V_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} " & 
"maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_nentries_0_V_0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_nentries_0_V_0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_dataarray_data_V_q0: SIGNAL IS "XIL_INTERFACENAME instubdata_dataarray_data_V_q0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 14} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minim" & 
"um {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_dataarray_data_V_q0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_dataarray_data_V_q0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF instubdata_dataarray_data_V_address0: SIGNAL IS "XIL_INTERFACENAME instubdata_dataarray_data_V_address0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 9} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF instubdata_dataarray_data_V_address0: SIGNAL IS "xilinx.com:signal:data:1.0 instubdata_dataarray_data_V_address0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bx_o_V: SIGNAL IS "XIL_INTERFACENAME bx_o_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 3} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value f" & 
"alse}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF bx_o_V: SIGNAL IS "xilinx.com:signal:data:1.0 bx_o_V DATA";
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
  U0 : MatchEngineTopL3
    PORT MAP (
      bx_o_V_ap_vld => bx_o_V_ap_vld,
      instubdata_dataarray_data_V_ce0 => instubdata_dataarray_data_V_ce0,
      inprojdata_dataarray_data_V_ce0 => inprojdata_dataarray_data_V_ce0,
      outcandmatch_dataarray_data_V_ce0 => outcandmatch_dataarray_data_V_ce0,
      outcandmatch_dataarray_data_V_we0 => outcandmatch_dataarray_data_V_we0,
      outcandmatch_nentries_0_V_ap_vld => outcandmatch_nentries_0_V_ap_vld,
      outcandmatch_nentries_1_V_ap_vld => outcandmatch_nentries_1_V_ap_vld,
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      bx_V => bx_V,
      bx_o_V => bx_o_V,
      instubdata_dataarray_data_V_address0 => instubdata_dataarray_data_V_address0,
      instubdata_dataarray_data_V_q0 => instubdata_dataarray_data_V_q0,
      instubdata_nentries_0_V_0 => instubdata_nentries_0_V_0,
      instubdata_nentries_0_V_1 => instubdata_nentries_0_V_1,
      instubdata_nentries_0_V_2 => instubdata_nentries_0_V_2,
      instubdata_nentries_0_V_3 => instubdata_nentries_0_V_3,
      instubdata_nentries_0_V_4 => instubdata_nentries_0_V_4,
      instubdata_nentries_0_V_5 => instubdata_nentries_0_V_5,
      instubdata_nentries_0_V_6 => instubdata_nentries_0_V_6,
      instubdata_nentries_0_V_7 => instubdata_nentries_0_V_7,
      instubdata_nentries_1_V_0 => instubdata_nentries_1_V_0,
      instubdata_nentries_1_V_1 => instubdata_nentries_1_V_1,
      instubdata_nentries_1_V_2 => instubdata_nentries_1_V_2,
      instubdata_nentries_1_V_3 => instubdata_nentries_1_V_3,
      instubdata_nentries_1_V_4 => instubdata_nentries_1_V_4,
      instubdata_nentries_1_V_5 => instubdata_nentries_1_V_5,
      instubdata_nentries_1_V_6 => instubdata_nentries_1_V_6,
      instubdata_nentries_1_V_7 => instubdata_nentries_1_V_7,
      instubdata_nentries_2_V_0 => instubdata_nentries_2_V_0,
      instubdata_nentries_2_V_1 => instubdata_nentries_2_V_1,
      instubdata_nentries_2_V_2 => instubdata_nentries_2_V_2,
      instubdata_nentries_2_V_3 => instubdata_nentries_2_V_3,
      instubdata_nentries_2_V_4 => instubdata_nentries_2_V_4,
      instubdata_nentries_2_V_5 => instubdata_nentries_2_V_5,
      instubdata_nentries_2_V_6 => instubdata_nentries_2_V_6,
      instubdata_nentries_2_V_7 => instubdata_nentries_2_V_7,
      instubdata_nentries_3_V_0 => instubdata_nentries_3_V_0,
      instubdata_nentries_3_V_1 => instubdata_nentries_3_V_1,
      instubdata_nentries_3_V_2 => instubdata_nentries_3_V_2,
      instubdata_nentries_3_V_3 => instubdata_nentries_3_V_3,
      instubdata_nentries_3_V_4 => instubdata_nentries_3_V_4,
      instubdata_nentries_3_V_5 => instubdata_nentries_3_V_5,
      instubdata_nentries_3_V_6 => instubdata_nentries_3_V_6,
      instubdata_nentries_3_V_7 => instubdata_nentries_3_V_7,
      inprojdata_dataarray_data_V_address0 => inprojdata_dataarray_data_V_address0,
      inprojdata_dataarray_data_V_q0 => inprojdata_dataarray_data_V_q0,
      inprojdata_nentries_0_V => inprojdata_nentries_0_V,
      inprojdata_nentries_1_V => inprojdata_nentries_1_V,
      outcandmatch_dataarray_data_V_address0 => outcandmatch_dataarray_data_V_address0,
      outcandmatch_dataarray_data_V_d0 => outcandmatch_dataarray_data_V_d0,
      outcandmatch_nentries_0_V => outcandmatch_nentries_0_V,
      outcandmatch_nentries_1_V => outcandmatch_nentries_1_V
    );
END MatchEngineTopL3_0_arch;
