library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;
use work.uut_pkg.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity PRMEMCTest is
  port (
    -- clocks
    clk_PRMEMC      : in std_logic;
    reset           : in std_logic;
    pass            : out std_logic_vector(7 downto 0) := (others=>std_logic' ('0'));
    error           : out std_logic_vector(7 downto 0) := (others=>std_logic' ('0'));
    FM_L5L6XX_dataarray_data_V_dout_out: out FM_data_array(3 downto 0);
    FM_L1L2XX_dataarray_data_V_dout_out: out FM_data_array(3 downto 0);
    FM_L1L2XX_dataarray_data_V_enb_out: out std_logic_vector(3 downto 0);
    FM_L5L6XX_dataarray_data_V_enb_out: out std_logic_vector(3 downto 0);
    FM_L5L6XX_dataarray_data_V_dout_emulation_out: out FM_data_array(3 downto 0);
    FM_L1L2XX_dataarray_data_V_dout_emulation_out: out FM_data_array(3 downto 0);
    FM_L1L2XX_dataarray_data_V_enb_emulation_out: out std_logic_vector(3 downto 0);
    FM_L5L6XX_dataarray_data_V_enb_emulation_out: out std_logic_vector(3 downto 0)
    );    
end entity PRMEMCTest;

architecture structure of PRMEMCTest is
  signal counter         : unsigned(31 downto 0);
  --PRMEMC
  signal counter_PRMEMC : unsigned(31 downto 0) := to_unsigned(0,32);
  signal bx_in: std_logic_vector(2 downto 0) := "110";
  signal bx_out_MatchCalculator : bx_mc_array;
  signal MatchCalculator_done:std_logic_vector(3 downto 0);
  --Maps
  constant PhiMap : Map_array(3 downto 0) := (0=>"A",1=>"B",2=>"C",3=>"D");
  constant ASL3PHIMap : Map_array(3 downto 0) := (0=>"PHIAn3",1=>"PHIBn4",2=>"PHICn4",3=>"PHIDn3");
  constant VMStubPhiNumberMap : Integer_array(0 to 3) := (0=>1,1=>9,2=>17,3=>25);
  constant TPL3MapPHIA :  Map_array(8 downto 0) := (0=>"L1L2B",1=>"L1L2C",2=>"L1L2D",3=>"L5L6A",4=>"L5L6B",5=>"AAAAA",6=>"AAAAA",7=>"AAAAA",8=>"AAAAA");
  constant TPL3MapPHIB :  Map_array(8 downto 0) := (0=>"L1L2B",1=>"L1L2C",2=>"L1L2D",3=>"L1L2E",4=>"L1L2F",5=>"L1L2G",6=>"L5L6A",7=>"L5L6B",8=>"L5L6C");
  constant TPL3MapPHIC :  Map_array(8 downto 0) := (0=>"L1L2H",1=>"L5L6C",2=>"L1L2I",3=>"L5L6B",4=>"L5L6D",5=>"L1L2J",6=>"L1L2G",7=>"L1L2F",8=>"AAAAA");
  constant TPL3MapPHID :  Map_array(8 downto 0) := (0=>"L1L2H",1=>"L1L2I",2=>"L1L2J",3=>"L1L2K",4=>"L1L2L",5=>"L5L6C",6=>"L5L6D",7=>"AAAAA",8=>"AAAAA");
  
  constant TPL3Map : TPROJ_Map_array :=(0=>TPL3MapPHIA,1=>TPL3MapPHIB,2=>TPL3MapPHIC,3=>TPL3MapPHID);
  constant TProj_NumMap : Integer_array(3 downto 0) := (0=>5,1=>9,2=>8,3=>7);
    --AS
  signal AS_L3_dataarray_data_V_wea: std_logic_vector(3 downto 0);
  signal AS_L3_dataarray_data_V_writeaddr: AS_data_addr_array(3 downto 0);
  signal AS_L3_dataarray_data_V_din: AS_data_array(3 downto 0);
  signal AS_L3_nentries_0_V_din: AS_nentries_array(3 downto 0) := (0=>"00110010",1=>"00111101",2=>"00111110",3=>"00101101");
  signal AS_L3_nentries_1_V_din: AS_nentries_array(3 downto 0) := (0=>"01010001",1=>"01001000",2=>"00111010",3=>"00111111");
  signal AS_L3_nentries_2_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_3_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_4_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_5_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_6_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_7_V_din: AS_nentries_array(3 downto 0) := (0=>"00000000",1=>"00000000",2=>"00000000",3=>"00000000");
  signal AS_L3_nentries_0_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_1_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_2_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_3_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_4_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_5_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_6_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_nentries_7_V_we: std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal AS_L3_dataarray_data_V_enb: std_logic_vector(3 downto 0);
  signal AS_L3_dataarray_data_V_readaddr: AS_data_addr_array(3 downto 0);
  signal AS_L3_dataarray_data_V_dout: AS_data_array(3 downto 0);
  signal AS_L3_nentries_0_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_1_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_2_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_3_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_4_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_5_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_6_V_dout: AS_nentries_array(3 downto 0);
  signal AS_L3_nentries_7_V_dout: AS_nentries_array(3 downto 0);
  --PR
  signal TPROJ_L3_nentries_0_V_din: TPROJ_4PHI_nentries_array := (0=>("00000110", "00010011", "00000000", "00000101", "00000000", "00000000", "00000000", "00000000", "00000000"),
                                                                  1=>("00000000", "00000110", "00001011", "00001011", "00000111", "00001000", "00000001", "00000100", "00000001"),
                                                                  2=>("00000110", "00001010", "00001010", "00000000", "00000001", "00000100", "00010111", "00000001", "00000000"),
                                                                  3=>("00000000", "00000000", "00001011", "00000100", "00000000", "00000000", "00000000", "00000000", "00000000"));
  signal TPROJ_L3_nentries_1_V_din: TPROJ_4PHI_nentries_array := (0=>("00001000", "00001101", "00000001", "00000000", "00000001", "00000000", "00000000", "00000000", "00000000"),
                                                                  1=>("00000000", "00000011", "00001001", "00001011", "00001001", "00000010", "00000010", "00000101", "00000000"),
                                                                  2=>("00001000","00000010","00001011","00000000","00000100","00001111","00001111","00000000","00000000"),
                                                                  3=>("00000000", "00000001", "00010011", "00000000", "00000010", "00000000", "00000000", "00000000", "00000000"));
  signal TPROJ_L3_dataarray_data_V_wea : TPROJ_4PHI_nentries_we_array;
  signal TPROJ_L3_dataarray_data_V_writeaddr : TPROJ_4PHI_data_addr_array;
  signal TPROJ_L3_dataarray_data_V_din : TPROJ_4PHI_data_array;
  signal TPROJ_L3_nentries_0_V_we: TPROJ_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal TPROJ_L3_nentries_1_V_we: TPROJ_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal TPROJ_L3_dataarray_data_V_enb : TPROJ_4PHI_nentries_we_array;
  signal TPROJ_L3_dataarray_data_V_readaddr : TPROJ_4PHI_data_addr_array;
  signal TPROJ_L3_dataarray_data_V_dout: TPROJ_4PHI_data_array;
  signal TPROJ_L3_nentries_0_V_dout: TPROJ_4PHI_nentries_array;
  signal TPROJ_L3_nentries_1_V_dout: TPROJ_4PHI_nentries_array;

  -- ME
  signal VMSME_L3_dataarray_data_V_wea : VMSME_4PHI_data_wea_array;
  signal VMSME_L3_dataarray_data_V_writeaddr  : VMSME_4PHI_writeaddr_array;
  signal VMSME_L3_dataarray_data_V_din  : VMSME_4PHI_data_array;
  signal VMSME_L3_nentries_0_0_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0000", "0001", "0001", "0000", "0100", "0000", "0000"),
                                                                      1=>("0001", "0000", "0000", "0101", "0011", "0000", "0000", "0001"),
                                                                      2=>("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"),
                                                                      3=>("0000", "0000", "0001", "0000", "0010", "0010", "0010", "0001"));
  signal VMSME_L3_nentries_0_1_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0001", "0001", "0001", "0000", "0000", "0000", "0000"),
                                                                      1=>("0001", "0001", "0010", "0001", "0001", "0000", "0000", "0010"),
                                                                      2=>("0010", "0101", "0000", "0010", "0100", "0001", "0000", "0000"),
                                                                      3=>("0001", "0001", "0000", "0000", "0010", "0001", "0001", "0000"));
  signal VMSME_L3_nentries_0_2_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0001", "0001", "0011", "0000", "0000", "0010", "0000"),
                                                                      1=>("0000", "0000", "0010", "0010", "0111", "0101", "0001", "0000"),
                                                                      2=>("0000", "0001", "0010", "0010", "0010", "0001", "0000", "0000"),
                                                                      3=>("0000", "0001", "0001", "0001", "0010", "0001", "0001", "0000"));
  signal VMSME_L3_nentries_0_3_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0000", "0000", "0001", "0000", "0000", "0000", "0011"),
                                                                      1=>("0100", "0010", "0000", "0010", "0010", "0000", "0000", "0011"),
                                                                      2=>("0001", "0001", "0011", "0001", "0011", "0100", "0100", "0011"),
                                                                      3=>("0001", "0101", "0100", "0001", "0001", "0001", "0000", "0000"));
  signal VMSME_L3_nentries_0_4_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0011", "0100", "0010", "0100", "0000", "0100", "0010"),
                                                                      1=>("0001", "0010", "0001", "0010", "0000", "0000", "0000", "0000"),
                                                                      2=>("0010", "0010", "0011", "0000", "0000", "0100", "0011", "0001"),
                                                                      3=>("0000", "0000", "0001", "0001", "0010", "0010", "0000", "0000"));
  signal VMSME_L3_nentries_0_5_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0001", "0001", "0100", "0001", "0001", "0001", "0000"),
                                                                      1=>("0000", "0000", "0010", "0010", "0100", "0101", "0011", "0010"),
                                                                      2=>("0001", "0001", "0110", "0010", "0010", "0001", "0010", "0001"),
                                                                      3=>("0000", "0001", "0010", "0010", "0010", "0010", "0010", "0000"));
  signal VMSME_L3_nentries_0_6_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0011", "0010", "0001", "0001", "0010", "0001", "0000"),
                                                                      1=>("0001", "0001", "0010", "0101", "0011", "0010", "0010", "0000"),
                                                                      2=>("0000", "0001", "0000", "0000", "0010", "0011", "0000", "0000"),
                                                                      3=>("0000", "0000", "0000", "0000", "0000", "0010", "0011", "0001"));
  signal VMSME_L3_nentries_0_7_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0000", "0000", "0000", "0000", "0000", "0011", "0011"),
                                                                      1=>("0000", "0001", "0001", "0001", "0001", "0010", "0000", "0000"),
                                                                      2=>("0010", "0011", "0001", "0000", "0000", "0001", "0000", "0001"),
                                                                      3=>("0000", "0001", "0001", "0000", "0000", "0001", "0010", "0001"));
  signal VMSME_L3_nentries_1_0_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0001", "0000", "0000", "0000", "0000", "0000", "0001"),
                                                                      1=>("0010", "0011", "0010", "0001", "0010", "0000", "0000", "0000"),
                                                                      2=>("0010", "0001", "0001", "0000", "0000", "0000", "0000", "0000"),
                                                                      3=>("0010", "0000", "0000", "0000", "0001", "0010", "0001", "0001"));
  signal VMSME_L3_nentries_1_1_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0000", "0000", "0000", "0000", "0011", "0010", "0101"),
                                                                      1=>("0001", "0001", "0001", "0001", "0001", "0000", "0000", "0010"),
                                                                      2=>("0000", "0000", "0001", "0000", "0000", "0001", "0010", "0001"),
                                                                      3=>("0100", "0001", "0000", "0000", "0001", "0001", "0000", "0000"));
  signal VMSME_L3_nentries_1_2_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0001", "0001", "0000", "0000", "0001", "0101", "0100"),
                                                                      1=>("0100", "0010", "0001", "0001", "0000", "0010", "0010", "0010"),
                                                                      2=>("0000", "0001", "0010", "0010", "0000", "0001", "0001", "0010"),
                                                                      3=>("0010", "0010", "0001", "0001", "0001", "0010", "0001", "0001"));
  signal VMSME_L3_nentries_1_3_V_din  : VMSME_4PHI_nentries_array := (0=>("0011", "0001", "0011", "0011", "0010", "0111", "1010", "1001"),
                                                                      1=>("0100", "1010", "0100", "0001", "0001", "0000", "0000", "0010"),
                                                                      2=>("0011", "0100", "0001", "0000", "0010", "0100", "0010", "0010"),
                                                                      3=>("0010", "0000", "0000", "0010", "0010", "0010", "0101", "0011"));
  signal VMSME_L3_nentries_1_4_V_din  : VMSME_4PHI_nentries_array := (0=>("0101", "0010", "0111", "0101", "0100", "0011", "0010", "0011"),
                                                                      1=>("1100", "0100", "0010", "0001", "0001", "0000", "0000", "0100"),
                                                                      2=>("0100", "0011", "0010", "0001", "0010", "0010", "0010", "0100"),
                                                                      3=>("0000", "0001", "0011", "0011", "0000", "0010", "0100", "0011"));
  signal VMSME_L3_nentries_1_5_V_din  : VMSME_4PHI_nentries_array := (0=>("0001", "0000", "0000", "0001", "0001", "0000", "0000", "0000"),
                                                                      1=>("0101", "0011", "0001", "0011", "0010", "0001", "0010", "0011"),
                                                                      2=>("0000", "0000", "0000", "0010", "0001", "0001", "0010", "0100"),
                                                                      3=>("0001", "0010", "0100", "0000", "0001", "0011", "0010", "0010"));
  signal VMSME_L3_nentries_1_6_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0010", "0110", "0010", "0000", "0000", "0000", "0000"),
                                                                      1=>("0001", "0000", "0010", "0010", "0001", "0010", "0010", "0010"),
                                                                      2=>("0011", "0001", "0010", "0001", "0000", "0000", "0001", "0001"),
                                                                      3=>("0010", "0011", "0010", "0001", "0000", "0001", "0001", "0000"));
  signal VMSME_L3_nentries_1_7_V_din  : VMSME_4PHI_nentries_array := (0=>("0000", "0010", "0010", "0001", "0000", "0000", "0000", "0000"),
                                                                      1=>("0000", "0000", "0000", "0000", "0000", "0000", "0001", "0000"),
                                                                      2=>("0000", "0000", "0001", "0001", "0000", "0100", "0101", "0000"),
                                                                      3=>("0000", "0011", "0011", "0001", "0001", "0001", "0001", "0001"));
  signal VMSME_L3_nentries_2_0_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_1_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_2_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_3_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_4_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_5_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_6_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_2_7_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_0_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_1_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_2_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_3_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_4_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_5_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_6_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));
  signal VMSME_L3_nentries_3_7_V_din  : VMSME_4PHI_nentries_array := (others => ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000"));

  signal VMSME_L3_nentries_0_0_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_1_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_2_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_3_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_4_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_5_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_6_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_0_7_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_0_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_1_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_2_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_3_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_4_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_5_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_6_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_1_7_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_0_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_1_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_2_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_3_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_4_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_5_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_6_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_2_7_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_0_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_1_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_2_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_3_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_4_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_5_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_6_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));
  signal VMSME_L3_nentries_3_7_V_we : VMSME_4PHI_nentries_we_array := (others => (others => std_logic' ('1')));

  signal VMSME_L3_dataarray_data_V_enb : VMSME_4PHI_nentries_we_array;
  signal VMSME_L3_dataarray_data_V_readaddr  : VMSME_4PHI_readaddr_array;
  signal VMSME_L3_dataarray_data_V_dout  : VMSME_4PHI_data_array;
  signal VMSME_L3_nentries_0_0_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_1_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_2_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_3_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_4_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_5_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_6_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_0_7_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_0_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_1_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_2_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_3_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_4_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_5_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_6_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_1_7_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_0_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_1_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_2_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_3_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_4_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_5_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_6_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_2_7_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_0_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_1_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_2_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_3_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_4_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_5_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_6_V_dout  : VMSME_4PHI_nentries_array;
  signal VMSME_L3_nentries_3_7_V_dout  : VMSME_4PHI_nentries_array;
--MC
  signal FM_L1L2XX_dataarray_data_V_wea: std_logic_vector(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_writeaddr : FM_data_addr_array(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_din : FM_data_array(3 downto 0);
  signal FM_L1L2XX_nentries_0_V_we: std_logic_vector(3 downto 0);
  signal FM_L1L2XX_nentries_1_V_we: std_logic_vector(3 downto 0);
  signal FM_L1L2XX_nentries_0_V_din : FM_nentries_array(3 downto 0);
  signal FM_L1L2XX_nentries_1_V_din : FM_nentries_array(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_enb : std_logic_vector(3 downto 0) := (others => std_logic' ('0'));
  signal FM_L1L2XX_dataarray_data_V_readaddr :  FM_data_addr_array(3 downto 0) := (others => "00000000");
  signal FM_L1L2XX_dataarray_data_V_dout : FM_data_array(3 downto 0);
  signal FM_L1L2XX_nentries_0_V_dout : FM_nentries_array(3 downto 0);
  signal FM_L1L2XX_nentries_1_V_dout : FM_nentries_array(3 downto 0);
  
  signal FM_L5L6XX_dataarray_data_V_wea: std_logic_vector(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_writeaddr : FM_data_addr_array(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_din : FM_data_array(3 downto 0);
  signal FM_L5L6XX_nentries_0_V_we: std_logic_vector(3 downto 0);
  signal FM_L5L6XX_nentries_1_V_we: std_logic_vector(3 downto 0);
  signal FM_L5L6XX_nentries_0_V_din : FM_nentries_array(3 downto 0);
  signal FM_L5L6XX_nentries_1_V_din : FM_nentries_array(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_enb : std_logic_vector(3 downto 0) := (others => std_logic' ('0'));
  signal FM_L5L6XX_dataarray_data_V_readaddr : FM_data_addr_array(3 downto 0) := (others => "00000000");
  signal FM_L5L6XX_dataarray_data_V_dout : FM_data_array(3 downto 0);
  signal FM_L5L6XX_nentries_0_V_dout : FM_nentries_array(3 downto 0);
  signal FM_L5L6XX_nentries_1_V_dout : FM_nentries_array(3 downto 0);

  signal FM_L1L2XX_dataarray_data_V_wea_emulation : std_logic_vector(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_writeaddr_emulation : FM_data_addr_array(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_din_emulation : FM_data_array(3 downto 0);
  signal FM_L1L2XX_nentries_0_V_we_emulation : std_logic_vector(3 downto 0):= (others => std_logic' ('1'));
  signal FM_L1L2XX_nentries_1_V_we_emulation : std_logic_vector(3 downto 0):= (others => std_logic' ('1'));
  signal FM_L1L2XX_nentries_0_V_din_emulation : FM_nentries_array(3 downto 0) := (0=>"00000101", 1=>"00000110", 2=>"00000011", 3=>"00000000");
  signal FM_L1L2XX_nentries_1_V_din_emulation : FM_nentries_array(3 downto 0) := (0=>"00000011", 1=>"00000110", 2=>"00000100", 3=>"00000010");
  signal FM_L1L2XX_dataarray_data_V_enb_emulation : std_logic_vector(3 downto 0) := (others => std_logic' ('0'));
  signal FM_L1L2XX_dataarray_data_V_readaddr_emulation :  FM_data_addr_array(3 downto 0) := (others => "00000000");
  signal FM_L1L2XX_dataarray_data_V_dout_emulation : FM_data_array(3 downto 0);
  signal FM_L1L2XX_nentries_0_V_dout_emulation : FM_nentries_array(3 downto 0);
  signal FM_L1L2XX_nentries_1_V_dout_emulation : FM_nentries_array(3 downto 0);
  
  signal FM_L5L6XX_dataarray_data_V_wea_emulation : std_logic_vector(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_writeaddr_emulation : FM_data_addr_array(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_din_emulation : FM_data_array(3 downto 0);
  signal FM_L5L6XX_nentries_0_V_we_emulation : std_logic_vector(3 downto 0) := (others => std_logic' ('1'));
  signal FM_L5L6XX_nentries_1_V_we_emulation : std_logic_vector(3 downto 0):= (others => std_logic' ('1'));
  signal FM_L5L6XX_nentries_0_V_din_emulation : FM_nentries_array(3 downto 0) := (0=>"00000001", 1=>"00000100", 2=>"00000010", 3=>"00000000");
  signal FM_L5L6XX_nentries_1_V_din_emulation : FM_nentries_array(3 downto 0) := (0=>"00000000", 1=>"00000011", 2=>"00000000", 3=>"00000000");
  signal FM_L5L6XX_dataarray_data_V_enb_emulation : std_logic_vector(3 downto 0) := (others => std_logic' ('0'));
  signal FM_L5L6XX_dataarray_data_V_readaddr_emulation : FM_data_addr_array(3 downto 0) := (others => "00000000");
  signal FM_L5L6XX_dataarray_data_V_dout_emulation : FM_data_array(3 downto 0);
  signal FM_L5L6XX_nentries_0_V_dout_emulation : FM_nentries_array(3 downto 0);
  signal FM_L5L6XX_nentries_1_V_dout_emulation : FM_nentries_array(3 downto 0);

  
begin  -- architecture structure

  gen_gen_MemoryTPPHIC: for j in 0 to 3 generate
  gen_MemoryTPPHIC: for i in 0 to 8 generate
--    if i = TProj_NumMap(j) then
--      exit; --exit gen_MemoryTPPHIC
--    end if;
    MemoryTPPHIC: entity work.Memory
      generic map ( 
        RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_" & TPL3Map(j)(i) &"_L3PHI" & PHIMap(j) & "_04MOD.dat"))
      port map ( 
        clka => clk_PRMEMC,
        clkb => clk_PRMEMC,
        wea => TPROJ_L3_dataarray_data_V_wea(j)(i),
        addra => TPROJ_L3_dataarray_data_V_writeaddr(j)(i),
        dina => TPROJ_L3_dataarray_data_V_din(j)(i),
        nent_we0 => TPROJ_L3_nentries_0_V_we(j)(i),
        nent_i0 => TPROJ_L3_nentries_0_V_din(j)(i),
        nent_we1 => TPROJ_L3_nentries_1_V_we(j)(i),
        nent_i1 => TPROJ_L3_nentries_1_V_din(j)(i),
        enb => TPROJ_L3_dataarray_data_V_enb(j)(i),
        addrb => TPROJ_L3_dataarray_data_V_readaddr(j)(i),
        doutb => TPROJ_L3_dataarray_data_V_dout(j)(i),
        nent_o0 => TPROJ_L3_nentries_0_V_dout(j)(i),
        nent_o1 => TPROJ_L3_nentries_1_V_dout(j)(i),
        regceb => std_logic' ('1') 
        );
  end generate gen_MemoryTPPHIC;
  end generate gen_gen_MemoryTPPHIC;

  gen_gen_MemoryVMStub: for j in 0 to 3 generate
  gen_MemoryVMStub: for i in 0 to 7 generate
    MemoryVMStub: entity work.MemoryBinned
      generic map (
        RAM_WIDTH => 14,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE =>  string'("LOW_LATENCY"),
        HEX => 1,
        INIT_FILE => string'("VMStubs_VMSME_L3PHI" & PhiMap(j) & integer'image(i+VMStubPhiNumberMap(j)) & "n1_04MOD.dat"))
      port map (                
        clka => clk_PRMEMC,
        clkb => clk_PRMEMC,
        rstb => std_logic' ('0'),
        wea => VMSME_L3_dataarray_data_V_wea(j)(i),
        addra => VMSME_L3_dataarray_data_V_writeaddr(j)(i),
        dina => VMSME_L3_dataarray_data_V_din(j)(i),
        nent_0_we0 => VMSME_L3_nentries_0_0_V_we(j)(i),
        nent_0_i0 => VMSME_L3_nentries_0_0_V_din(j)(i)(3 downto 0),
        nent_0_we1 => VMSME_L3_nentries_0_1_V_we(j)(i),
        nent_0_i1 => VMSME_L3_nentries_0_1_V_din(j)(i)(3 downto 0),
        nent_0_we2 => VMSME_L3_nentries_0_2_V_we(j)(i),
        nent_0_i2 => VMSME_L3_nentries_0_2_V_din(j)(i)(3 downto 0),
        nent_0_we3 => VMSME_L3_nentries_0_3_V_we(j)(i),
        nent_0_i3 => VMSME_L3_nentries_0_3_V_din(j)(i)(3 downto 0),
        nent_0_we4 => VMSME_L3_nentries_0_4_V_we(j)(i),
        nent_0_i4 => VMSME_L3_nentries_0_4_V_din(j)(i)(3 downto 0),
        nent_0_we5 => VMSME_L3_nentries_0_5_V_we(j)(i),
        nent_0_i5 => VMSME_L3_nentries_0_5_V_din(j)(i)(3 downto 0),
        nent_0_we6 => VMSME_L3_nentries_0_6_V_we(j)(i),
        nent_0_i6 => VMSME_L3_nentries_0_6_V_din(j)(i)(3 downto 0),
        nent_0_we7 => VMSME_L3_nentries_0_7_V_we(j)(i),
        nent_0_i7 => VMSME_L3_nentries_0_7_V_din(j)(i)(3 downto 0),
        nent_1_we0 => VMSME_L3_nentries_1_0_V_we(j)(i),
        nent_1_i0 => VMSME_L3_nentries_1_0_V_din(j)(i)(3 downto 0),
        nent_1_we1 => VMSME_L3_nentries_1_1_V_we(j)(i),
        nent_1_i1 => VMSME_L3_nentries_1_1_V_din(j)(i)(3 downto 0),
        nent_1_we2 => VMSME_L3_nentries_1_2_V_we(j)(i),
        nent_1_i2 => VMSME_L3_nentries_1_2_V_din(j)(i)(3 downto 0),
        nent_1_we3 => VMSME_L3_nentries_1_3_V_we(j)(i),
        nent_1_i3 => VMSME_L3_nentries_1_3_V_din(j)(i)(3 downto 0),
        nent_1_we4 => VMSME_L3_nentries_1_4_V_we(j)(i),
        nent_1_i4 => VMSME_L3_nentries_1_4_V_din(j)(i)(3 downto 0),
        nent_1_we5 => VMSME_L3_nentries_1_5_V_we(j)(i),
        nent_1_i5 => VMSME_L3_nentries_1_5_V_din(j)(i)(3 downto 0),
        nent_1_we6 => VMSME_L3_nentries_1_6_V_we(j)(i),
        nent_1_i6 => VMSME_L3_nentries_1_6_V_din(j)(i)(3 downto 0),
        nent_1_we7 => VMSME_L3_nentries_1_7_V_we(j)(i),
        nent_1_i7 => VMSME_L3_nentries_1_7_V_din(j)(i)(3 downto 0),
        nent_2_we0 => VMSME_L3_nentries_2_0_V_we(j)(i),
        nent_2_i0 => VMSME_L3_nentries_2_0_V_din(j)(i)(3 downto 0),
        nent_2_we1 => VMSME_L3_nentries_2_1_V_we(j)(i),
        nent_2_i1 => VMSME_L3_nentries_2_1_V_din(j)(i)(3 downto 0),
        nent_2_we2 => VMSME_L3_nentries_2_2_V_we(j)(i),
        nent_2_i2 => VMSME_L3_nentries_2_2_V_din(j)(i)(3 downto 0),
        nent_2_we3 => VMSME_L3_nentries_2_3_V_we(j)(i),
        nent_2_i3 => VMSME_L3_nentries_2_3_V_din(j)(i)(3 downto 0),
        nent_2_we4 => VMSME_L3_nentries_2_4_V_we(j)(i),
        nent_2_i4 => VMSME_L3_nentries_2_4_V_din(j)(i)(3 downto 0),
        nent_2_we5 => VMSME_L3_nentries_2_5_V_we(j)(i),
        nent_2_i5 => VMSME_L3_nentries_2_5_V_din(j)(i)(3 downto 0),
        nent_2_we6 => VMSME_L3_nentries_2_6_V_we(j)(i),
        nent_2_i6 => VMSME_L3_nentries_2_6_V_din(j)(i)(3 downto 0),
        nent_2_we7 => VMSME_L3_nentries_2_7_V_we(j)(i),
        nent_2_i7 => VMSME_L3_nentries_2_7_V_din(j)(i)(3 downto 0),
        nent_3_we0 => VMSME_L3_nentries_3_0_V_we(j)(i),
        nent_3_i0 => VMSME_L3_nentries_3_0_V_din(j)(i)(3 downto 0),
        nent_3_we1 => VMSME_L3_nentries_3_1_V_we(j)(i),
        nent_3_i1 => VMSME_L3_nentries_3_1_V_din(j)(i)(3 downto 0),
        nent_3_we2 => VMSME_L3_nentries_3_2_V_we(j)(i),
        nent_3_i2 => VMSME_L3_nentries_3_2_V_din(j)(i)(3 downto 0),
        nent_3_we3 => VMSME_L3_nentries_3_3_V_we(j)(i),
        nent_3_i3 => VMSME_L3_nentries_3_3_V_din(j)(i)(3 downto 0),
        nent_3_we4 => VMSME_L3_nentries_3_4_V_we(j)(i),
        nent_3_i4 => VMSME_L3_nentries_3_4_V_din(j)(i)(3 downto 0),
        nent_3_we5 => VMSME_L3_nentries_3_5_V_we(j)(i),
        nent_3_i5 => VMSME_L3_nentries_3_5_V_din(j)(i)(3 downto 0),
        nent_3_we6 => VMSME_L3_nentries_3_6_V_we(j)(i),
        nent_3_i6 => VMSME_L3_nentries_3_6_V_din(j)(i)(3 downto 0),
        nent_3_we7 => VMSME_L3_nentries_3_7_V_we(j)(i),
        nent_3_i7 => VMSME_L3_nentries_3_7_V_din(j)(i)(3 downto 0),
        enb => VMSME_L3_dataarray_data_V_enb(j)(i),
        addrb => VMSME_L3_dataarray_data_V_readaddr(j)(i)(7 downto 0),
        doutb => VMSME_L3_dataarray_data_V_dout(j)(i),
        nent_0_o0 => VMSME_L3_nentries_0_0_V_dout(j)(i)(3 downto 0),
        nent_0_o1 => VMSME_L3_nentries_0_1_V_dout(j)(i)(3 downto 0),
        nent_0_o2 => VMSME_L3_nentries_0_2_V_dout(j)(i)(3 downto 0),
        nent_0_o3 => VMSME_L3_nentries_0_3_V_dout(j)(i)(3 downto 0),
        nent_0_o4 => VMSME_L3_nentries_0_4_V_dout(j)(i)(3 downto 0),
        nent_0_o5 => VMSME_L3_nentries_0_5_V_dout(j)(i)(3 downto 0),
        nent_0_o6 => VMSME_L3_nentries_0_6_V_dout(j)(i)(3 downto 0),
        nent_0_o7 => VMSME_L3_nentries_0_7_V_dout(j)(i)(3 downto 0),
        nent_1_o0 => VMSME_L3_nentries_1_0_V_dout(j)(i)(3 downto 0),
        nent_1_o1 => VMSME_L3_nentries_1_1_V_dout(j)(i)(3 downto 0),
        nent_1_o2 => VMSME_L3_nentries_1_2_V_dout(j)(i)(3 downto 0),
        nent_1_o3 => VMSME_L3_nentries_1_3_V_dout(j)(i)(3 downto 0),
        nent_1_o4 => VMSME_L3_nentries_1_4_V_dout(j)(i)(3 downto 0),
        nent_1_o5 => VMSME_L3_nentries_1_5_V_dout(j)(i)(3 downto 0),
        nent_1_o6 => VMSME_L3_nentries_1_6_V_dout(j)(i)(3 downto 0),
        nent_1_o7 => VMSME_L3_nentries_1_7_V_dout(j)(i)(3 downto 0),
        nent_2_o0 => VMSME_L3_nentries_2_0_V_dout(j)(i)(3 downto 0),
        nent_2_o1 => VMSME_L3_nentries_2_1_V_dout(j)(i)(3 downto 0),
        nent_2_o2 => VMSME_L3_nentries_2_2_V_dout(j)(i)(3 downto 0),
        nent_2_o3 => VMSME_L3_nentries_2_3_V_dout(j)(i)(3 downto 0),
        nent_2_o4 => VMSME_L3_nentries_2_4_V_dout(j)(i)(3 downto 0),
        nent_2_o5 => VMSME_L3_nentries_2_5_V_dout(j)(i)(3 downto 0),
        nent_2_o6 => VMSME_L3_nentries_2_6_V_dout(j)(i)(3 downto 0),
        nent_2_o7 => VMSME_L3_nentries_2_7_V_dout(j)(i)(3 downto 0),
        nent_3_o0 => VMSME_L3_nentries_3_0_V_dout(j)(i)(3 downto 0),
        nent_3_o1 => VMSME_L3_nentries_3_1_V_dout(j)(i)(3 downto 0),
        nent_3_o2 => VMSME_L3_nentries_3_2_V_dout(j)(i)(3 downto 0),
        nent_3_o3 => VMSME_L3_nentries_3_3_V_dout(j)(i)(3 downto 0),
        nent_3_o4 => VMSME_L3_nentries_3_4_V_dout(j)(i)(3 downto 0),
        nent_3_o5 => VMSME_L3_nentries_3_5_V_dout(j)(i)(3 downto 0),
        nent_3_o6 => VMSME_L3_nentries_3_6_V_dout(j)(i)(3 downto 0),
        nent_3_o7 => VMSME_L3_nentries_3_7_V_dout(j)(i)(3 downto 0),
        regceb => std_logic' ('1')
        );
  end generate gen_MemoryVMStub;
  end generate gen_gen_MemoryVMStub;


  gen_MemoryAS_L3: for i in 0 to 3 generate
  MemoryAS_L3PHI: entity work.Memory
    generic map (
      RAM_WIDTH => 36,
      RAM_DEPTH => 1024,
      RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
      HEX => 1,
      INIT_FILE => string'("AllStubs_AS_L3" & ASL3PHIMap(i) & "_04MOD.dat"))
    port map (
      clka => clk_PRMEMC,
      clkb => clk_PRMEMC,
      rstb => reset,
      wea => AS_L3_dataarray_data_V_wea(i),
      addra => AS_L3_dataarray_data_V_writeaddr(i),
      dina => AS_L3_dataarray_data_V_din(i),
      nent_we0 => AS_L3_nentries_0_V_we(i),
      nent_i0 => AS_L3_nentries_0_V_din(i),
      nent_we1 => AS_L3_nentries_1_V_we(i),
      nent_i1 => AS_L3_nentries_1_V_din(i),
      nent_we2 => AS_L3_nentries_2_V_we(i),
      nent_we3 => AS_L3_nentries_3_V_we(i),
      nent_we4 => AS_L3_nentries_4_V_we(i),
      nent_we5 => AS_L3_nentries_5_V_we(i),
      nent_we6 => AS_L3_nentries_6_V_we(i),
      nent_we7 => AS_L3_nentries_7_V_we(i),
      nent_i2 => AS_L3_nentries_2_V_din(i),
      nent_i3 => AS_L3_nentries_3_V_din(i),
      nent_i4 => AS_L3_nentries_4_V_din(i),
      nent_i5 => AS_L3_nentries_5_V_din(i),
      nent_i6 => AS_L3_nentries_6_V_din(i),
      nent_i7 => AS_L3_nentries_7_V_din(i),
      enb => AS_L3_dataarray_data_V_enb(i),
      addrb => AS_L3_dataarray_data_V_readaddr(i),
      doutb => AS_L3_dataarray_data_V_dout(i),
      nent_o0 => AS_L3_nentries_0_V_dout(i),
      nent_o1 => AS_L3_nentries_1_V_dout(i),
      nent_o2 => AS_L3_nentries_2_V_dout(i),
      nent_o3 => AS_L3_nentries_3_V_dout(i),
      nent_o4 => AS_L3_nentries_4_V_dout(i),
      nent_o5 => AS_L3_nentries_5_V_dout(i),
      nent_o6 => AS_L3_nentries_6_V_dout(i),
      nent_o7 => AS_L3_nentries_7_V_dout(i),
      regceb => std_logic' ('1')
      );
  end generate gen_MemoryAS_L3;
  
  gen_MemoryMCL1L2: for i in 0 to 3 generate
  MemoryMCL1L2: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>0)
    port map(
      clka=>    clk_PRMEMC,
      clkb=>    clk_PRMEMC,
      rstb=> reset,
      wea=>    FM_L1L2XX_dataarray_data_V_wea(i),
      addra=>    FM_L1L2XX_dataarray_data_V_writeaddr(i),
      dina=>    FM_L1L2XX_dataarray_data_V_din(i),
      nent_we0=>    FM_L1L2XX_nentries_0_V_we(i),
      nent_i0=>    FM_L1L2XX_nentries_0_V_din(i),
      nent_we1=>    FM_L1L2XX_nentries_1_V_we(i),
      nent_i1=>    FM_L1L2XX_nentries_1_V_din(i),
      enb=>    FM_L1L2XX_dataarray_data_V_enb(i),
      addrb=>    FM_L1L2XX_dataarray_data_V_readaddr(i),
      doutb=>    FM_L1L2XX_dataarray_data_V_dout(i),
      nent_o0=>    FM_L1L2XX_nentries_0_V_dout(i),
      nent_o1=>    FM_L1L2XX_nentries_1_V_dout(i),
      regceb=> std_logic' ('1')
      );
  end generate gen_MemoryMCL1L2;

  gen_MemoryMCL5L6: for i in 0 to 3 generate
  MemoryMCL5L6: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>0)
    port map(
      clka=>   clk_PRMEMC,
      clkb=>   clk_PRMEMC,
      rstb=> reset,
      wea=>    FM_L5L6XX_dataarray_data_V_wea(i),
      addra=>    FM_L5L6XX_dataarray_data_V_writeaddr(i),
      dina=>    FM_L5L6XX_dataarray_data_V_din(i),
      nent_we0=>    FM_L5L6XX_nentries_0_V_we(i),
      nent_i0=>    FM_L5L6XX_nentries_0_V_din(i),
      nent_we1=>    FM_L5L6XX_nentries_1_V_we(i),
      nent_i1=>    FM_L5L6XX_nentries_1_V_din(i),
      enb=>    FM_L5L6XX_dataarray_data_V_enb(i),
      addrb=>    FM_L5L6XX_dataarray_data_V_readaddr(i),
      doutb=>    FM_L5L6XX_dataarray_data_V_dout(i),
      nent_o0=>    FM_L5L6XX_nentries_0_V_dout(i),
      nent_o1=>    FM_L5L6XX_nentries_1_V_dout(i),
      regceb=> std_logic' ('1')
      );
  end generate gen_MemoryMCL5L6;

  FM_L5L6XX_dataarray_data_V_dout_out <= FM_L5L6XX_dataarray_data_V_dout;
  FM_L1L2XX_dataarray_data_V_dout_out <= FM_L1L2XX_dataarray_data_V_dout;
  FM_L1L2XX_dataarray_data_V_enb_out <= FM_L1L2XX_dataarray_data_V_enb;
  FM_L5L6XX_dataarray_data_V_enb_out <= FM_L5L6XX_dataarray_data_V_enb;
  FM_L5L6XX_dataarray_data_V_dout_emulation_out <= FM_L5L6XX_dataarray_data_V_dout_emulation;
  FM_L1L2XX_dataarray_data_V_dout_emulation_out <= FM_L1L2XX_dataarray_data_V_dout_emulation;
  FM_L1L2XX_dataarray_data_V_enb_emulation_out <= FM_L1L2XX_dataarray_data_V_enb_emulation;
  FM_L5L6XX_dataarray_data_V_enb_emulation_out <= FM_L5L6XX_dataarray_data_V_enb_emulation;
  

  gen_MemoryMCL1L2_emulation: for i in 0 to 3 generate
  MemoryMCL1L2_emulation: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>1,
      INIT_FILE=>string'("FullMatches_FM_L1L2_L3PHI"& PHIMap(i) &"_04MOD.dat"))
    port map(
      clka=>    clk_PRMEMC,
      clkb=>    clk_PRMEMC,
      wea=>    FM_L1L2XX_dataarray_data_V_wea_emulation(i),
      addra=>    FM_L1L2XX_dataarray_data_V_writeaddr_emulation(i),
      dina=>    FM_L1L2XX_dataarray_data_V_din_emulation(i),
      nent_we0=>    FM_L1L2XX_nentries_0_V_we_emulation(i),
      nent_i0=>    FM_L1L2XX_nentries_0_V_din_emulation(i),
      nent_we1=>    FM_L1L2XX_nentries_1_V_we_emulation(i),
      nent_i1=>    FM_L1L2XX_nentries_1_V_din_emulation(i),
      enb=>    FM_L1L2XX_dataarray_data_V_enb_emulation(i),
      addrb=>    FM_L1L2XX_dataarray_data_V_readaddr_emulation(i),
      doutb=>    FM_L1L2XX_dataarray_data_V_dout_emulation(i),
      nent_o0=>    FM_L1L2XX_nentries_0_V_dout_emulation(i),
      nent_o1=>    FM_L1L2XX_nentries_1_V_dout_emulation(i),
      regceb=> std_logic' ('1')
      );
  end generate gen_MemoryMCL1L2_emulation;

  gen_MemoryMCL5L6_emulation: for i in 0 to 3 generate
  MemoryMCL5L6_emulation: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>1,
      INIT_FILE=>string'("FullMatches_FM_L5L6_L3PHI"& PHIMap(i) &"_04MOD.dat"))
    port map(
      clka=>   clk_PRMEMC,
      clkb=>   clk_PRMEMC,
      wea=>    FM_L5L6XX_dataarray_data_V_wea_emulation(i),
      addra=>    FM_L5L6XX_dataarray_data_V_writeaddr_emulation(i),
      dina=>    FM_L5L6XX_dataarray_data_V_din_emulation(i),
      nent_we0=>    FM_L5L6XX_nentries_0_V_we_emulation(i),
      nent_i0=>    FM_L5L6XX_nentries_0_V_din_emulation(i),
      nent_we1=>    FM_L5L6XX_nentries_1_V_we_emulation(i),
      nent_i1=>    FM_L5L6XX_nentries_1_V_din_emulation(i),
      enb=>    FM_L5L6XX_dataarray_data_V_enb_emulation(i),
      addrb=>    FM_L5L6XX_dataarray_data_V_readaddr_emulation(i),
      doutb=>    FM_L5L6XX_dataarray_data_V_dout_emulation(i),
      nent_o0=>    FM_L5L6XX_nentries_0_V_dout_emulation(i),
      nent_o1=>    FM_L5L6XX_nentries_1_V_dout_emulation(i),
      regceb=> std_logic' ('1')
      );
  end generate gen_MemoryMCL5L6_emulation;
  
  count_clk_PRMEMC: process (clk_PRMEMC)
  begin
    if rising_edge(clk_PRMEMC) then
      counter_PRMEMC <= to_unsigned(to_integer(counter_PRMEMC) + 1,32);
      if (counter_PRMEMC = to_unsigned(540,32)) then
        counter_PRMEMC <= to_unsigned(0,32);
        bx_in <= std_logic_vector(to_unsigned(to_integer(unsigned(bx_in)) + 1, 3));
      end if;
    end if;
  end process count_clk_PRMEMC;

  gen_check_output_PRMEMC: for i in 0 to 3 generate
  check_output_PRMEMC: process (clk_PRMEMC)
    begin
      if rising_edge(clk_PRMEMC) then
        if (MatchCalculator_done(i) = std_logic' ('1')) then
          FM_L1L2XX_dataarray_data_V_enb(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_enb_emulation(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_enb(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_enb_emulation(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_readaddr(i) <= std_logic_vector(to_unsigned(to_integer(unsigned(FM_L1L2XX_dataarray_data_V_readaddr(i))) +1,8));
          FM_L1L2XX_dataarray_data_V_readaddr_emulation(i) <= std_logic_vector(to_unsigned(to_integer(unsigned(FM_L1L2XX_dataarray_data_V_readaddr_emulation(i))) +1,8));
          FM_L5L6XX_dataarray_data_V_enb(i) <= std_logic' ('1');
          FM_L5L6XX_dataarray_data_V_enb_emulation(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_enb(i) <= std_logic' ('1');
          FM_L1L2XX_dataarray_data_V_enb_emulation(i) <= std_logic' ('1');
          FM_L5L6XX_dataarray_data_V_readaddr(i) <= std_logic_vector(to_unsigned(to_integer(unsigned(FM_L5L6XX_dataarray_data_V_readaddr(i))) +1,8));
          FM_L5L6XX_dataarray_data_V_readaddr_emulation(i) <= std_logic_vector(to_unsigned(to_integer(unsigned(FM_L5L6XX_dataarray_data_V_readaddr_emulation(i))) +1,8));
          if (FM_L1L2XX_dataarray_data_V_enb(i) = std_logic' ('1')) then
          if not((FM_L1L2XX_dataarray_data_V_dout(i) = FM_L1L2XX_dataarray_data_V_dout_emulation(i)) or (FM_L5L6XX_dataarray_data_V_dout(i) = FM_L5L6XX_dataarray_data_V_dout_emulation(i))) then
            error(i) <= std_logic' ('1');
          else
            pass(i) <= std_logic' ('1');
          end if;
          end if;
        end if;
      end if;
    end process check_output_PRMEMC;
    end generate gen_check_output_PRMEMC;

                                                                                                                                                                              
 -- gen_PRMEMC: for i in 0 to 3 generate
  PRMEMC_A: entity work.uut
   generic map(
     PRPhiSlice => "A",
     NumTProj => TProj_NumMap(0))
   port map (
-- Control signals
   clk => clk_PRMEMC,
   reset => reset,
   en_proc => std_logic' ('1'),
   bx_in_ProjectionRouter => bx_in,
     
-- PR inputs
   TPROJ_L3_dataarray_data_V_dout => TPROJ_L3_dataarray_data_V_dout(0), 
   TPROJ_L3_nentries_0_V_dout => TPROJ_L3_nentries_0_V_dout(0), 
   TPROJ_L3_nentries_1_V_dout => TPROJ_L3_nentries_1_V_dout(0),
   TPROJ_L3_dataarray_data_V_enb => TPROJ_L3_dataarray_data_V_enb(0),
   TPROJ_L3_dataarray_data_V_readaddr => TPROJ_L3_dataarray_data_V_readaddr(0),
                   
-- ME inputs
     VMSME_L3_dataarray_data_V_enb => VMSME_L3_dataarray_data_V_enb(0),
     VMSME_L3_dataarray_data_V_readaddr => VMSME_L3_dataarray_data_V_readaddr(0),
     VMSME_L3_dataarray_data_V_dout => VMSME_L3_dataarray_data_V_dout(0),
     VMSME_L3_nentries_0_0_V_dout => VMSME_L3_nentries_0_0_V_dout(0),
     VMSME_L3_nentries_0_1_V_dout => VMSME_L3_nentries_0_1_V_dout(0),
     VMSME_L3_nentries_0_2_V_dout => VMSME_L3_nentries_0_2_V_dout(0),
     VMSME_L3_nentries_0_3_V_dout => VMSME_L3_nentries_0_3_V_dout(0),
     VMSME_L3_nentries_0_4_V_dout => VMSME_L3_nentries_0_4_V_dout(0),
     VMSME_L3_nentries_0_5_V_dout => VMSME_L3_nentries_0_5_V_dout(0),
     VMSME_L3_nentries_0_6_V_dout => VMSME_L3_nentries_0_6_V_dout(0),
     VMSME_L3_nentries_0_7_V_dout => VMSME_L3_nentries_0_7_V_dout(0),
     VMSME_L3_nentries_1_0_V_dout => VMSME_L3_nentries_1_0_V_dout(0),
     VMSME_L3_nentries_1_1_V_dout => VMSME_L3_nentries_1_1_V_dout(0),
     VMSME_L3_nentries_1_2_V_dout => VMSME_L3_nentries_1_2_V_dout(0),
     VMSME_L3_nentries_1_3_V_dout => VMSME_L3_nentries_1_3_V_dout(0),
     VMSME_L3_nentries_1_4_V_dout => VMSME_L3_nentries_1_4_V_dout(0),
     VMSME_L3_nentries_1_5_V_dout => VMSME_L3_nentries_1_5_V_dout(0),
     VMSME_L3_nentries_1_6_V_dout => VMSME_L3_nentries_1_6_V_dout(0),
     VMSME_L3_nentries_1_7_V_dout => VMSME_L3_nentries_1_7_V_dout(0),
     VMSME_L3_nentries_2_0_V_dout => VMSME_L3_nentries_2_0_V_dout(0),
     VMSME_L3_nentries_2_1_V_dout => VMSME_L3_nentries_2_1_V_dout(0),
     VMSME_L3_nentries_2_2_V_dout => VMSME_L3_nentries_2_2_V_dout(0),
     VMSME_L3_nentries_2_3_V_dout => VMSME_L3_nentries_2_3_V_dout(0),
     VMSME_L3_nentries_2_4_V_dout => VMSME_L3_nentries_2_4_V_dout(0),
     VMSME_L3_nentries_2_5_V_dout => VMSME_L3_nentries_2_5_V_dout(0),
     VMSME_L3_nentries_2_6_V_dout => VMSME_L3_nentries_2_6_V_dout(0),
     VMSME_L3_nentries_2_7_V_dout => VMSME_L3_nentries_2_7_V_dout(0),
     VMSME_L3_nentries_3_0_V_dout => VMSME_L3_nentries_3_0_V_dout(0),
     VMSME_L3_nentries_3_1_V_dout => VMSME_L3_nentries_3_1_V_dout(0),
     VMSME_L3_nentries_3_2_V_dout => VMSME_L3_nentries_3_2_V_dout(0),
     VMSME_L3_nentries_3_3_V_dout => VMSME_L3_nentries_3_3_V_dout(0),
     VMSME_L3_nentries_3_4_V_dout => VMSME_L3_nentries_3_4_V_dout(0),
     VMSME_L3_nentries_3_5_V_dout => VMSME_L3_nentries_3_5_V_dout(0),
     VMSME_L3_nentries_3_6_V_dout => VMSME_L3_nentries_3_6_V_dout(0),
     VMSME_L3_nentries_3_7_V_dout => VMSME_L3_nentries_3_7_V_dout(0),
   
 -- MC inputs
     AS_L3_dataarray_data_V_enb => AS_L3_dataarray_data_V_enb(0),
     AS_L3_dataarray_data_V_readaddr => AS_L3_dataarray_data_V_readaddr(0),
     AS_L3_dataarray_data_V_dout => AS_L3_dataarray_data_V_dout(0),
     AS_L3_nentries_0_V_we => AS_L3_nentries_0_V_we(0),
     AS_L3_nentries_0_V_dout => AS_L3_nentries_0_V_dout(0),
     AS_L3_nentries_1_V_we => AS_L3_nentries_1_V_we(0),
     AS_L3_nentries_1_V_dout => AS_L3_nentries_1_V_dout(0),
     AS_L3_nentries_2_V_we => AS_L3_nentries_2_V_we(0),
     AS_L3_nentries_2_V_dout => AS_L3_nentries_2_V_dout(0),
     AS_L3_nentries_3_V_we => AS_L3_nentries_3_V_we(0),
     AS_L3_nentries_3_V_dout => AS_L3_nentries_3_V_dout(0),
     AS_L3_nentries_4_V_we => AS_L3_nentries_4_V_we(0),
     AS_L3_nentries_4_V_dout => AS_L3_nentries_4_V_dout(0),
     AS_L3_nentries_5_V_we => AS_L3_nentries_5_V_we(0),
     AS_L3_nentries_5_V_dout => AS_L3_nentries_5_V_dout(0),
     AS_L3_nentries_6_V_we => AS_L3_nentries_6_V_we(0),
     AS_L3_nentries_6_V_dout => AS_L3_nentries_6_V_dout(0),
     AS_L3_nentries_7_V_we => AS_L3_nentries_7_V_we(0),
     AS_L3_nentries_7_V_dout => AS_L3_nentries_7_V_dout(0),

 -- MC outputs
   FM_L1L2XX_dataarray_data_V_enb => FM_L1L2XX_dataarray_data_V_wea(0),
   FM_L1L2XX_dataarray_data_V_readaddr => FM_L1L2XX_dataarray_data_V_writeaddr(0),
   FM_L1L2XX_dataarray_data_V_dout => FM_L1L2XX_dataarray_data_V_din(0),
   FM_L1L2XX_nentries_0_V_dout => FM_L1L2XX_nentries_0_V_din(0),
   FM_L1L2XX_nentries_1_V_dout => FM_L1L2XX_nentries_1_V_din(0),
   FM_L5L6XX_dataarray_data_V_enb => FM_L5L6XX_dataarray_data_V_wea(0),
   FM_L5L6XX_dataarray_data_V_readaddr => FM_L5L6XX_dataarray_data_V_writeaddr(0),
   FM_L5L6XX_dataarray_data_V_dout => FM_L5L6XX_dataarray_data_V_din(0),
   FM_L5L6XX_nentries_0_V_dout => FM_L5L6XX_nentries_0_V_din(0),
   FM_L5L6XX_nentries_1_V_dout => FM_L5L6XX_nentries_1_V_din(0),

 -- More control signals
   bx_out_MatchCalculator => bx_out_MatchCalculator(0),
   MatchCalculator_done => MatchCalculator_done(0)
 
   );
   
     PRMEMC_B: entity work.uut
     generic map(
       PRPhiSlice => "B",
       NumTProj => TProj_NumMap(1))
     port map (
 -- Control signals
     clk => clk_PRMEMC,
     reset => reset,
     en_proc => std_logic' ('1'),
     bx_in_ProjectionRouter => bx_in,
       
 -- PR inputs
     TPROJ_L3_dataarray_data_V_dout => TPROJ_L3_dataarray_data_V_dout(1), 
     TPROJ_L3_nentries_0_V_dout => TPROJ_L3_nentries_0_V_dout(1), 
     TPROJ_L3_nentries_1_V_dout => TPROJ_L3_nentries_1_V_dout(1),
     TPROJ_L3_dataarray_data_V_enb => TPROJ_L3_dataarray_data_V_enb(1),
     TPROJ_L3_dataarray_data_V_readaddr => TPROJ_L3_dataarray_data_V_readaddr(1),
                     
 -- ME inputs
       VMSME_L3_dataarray_data_V_enb => VMSME_L3_dataarray_data_V_enb(1),
       VMSME_L3_dataarray_data_V_readaddr => VMSME_L3_dataarray_data_V_readaddr(1),
       VMSME_L3_dataarray_data_V_dout => VMSME_L3_dataarray_data_V_dout(1),
       VMSME_L3_nentries_0_0_V_dout => VMSME_L3_nentries_0_0_V_dout(1),
       VMSME_L3_nentries_0_1_V_dout => VMSME_L3_nentries_0_1_V_dout(1),
       VMSME_L3_nentries_0_2_V_dout => VMSME_L3_nentries_0_2_V_dout(1),
       VMSME_L3_nentries_0_3_V_dout => VMSME_L3_nentries_0_3_V_dout(1),
       VMSME_L3_nentries_0_4_V_dout => VMSME_L3_nentries_0_4_V_dout(1),
       VMSME_L3_nentries_0_5_V_dout => VMSME_L3_nentries_0_5_V_dout(1),
       VMSME_L3_nentries_0_6_V_dout => VMSME_L3_nentries_0_6_V_dout(1),
       VMSME_L3_nentries_0_7_V_dout => VMSME_L3_nentries_0_7_V_dout(1),
       VMSME_L3_nentries_1_0_V_dout => VMSME_L3_nentries_1_0_V_dout(1),
       VMSME_L3_nentries_1_1_V_dout => VMSME_L3_nentries_1_1_V_dout(1),
       VMSME_L3_nentries_1_2_V_dout => VMSME_L3_nentries_1_2_V_dout(1),
       VMSME_L3_nentries_1_3_V_dout => VMSME_L3_nentries_1_3_V_dout(1),
       VMSME_L3_nentries_1_4_V_dout => VMSME_L3_nentries_1_4_V_dout(1),
       VMSME_L3_nentries_1_5_V_dout => VMSME_L3_nentries_1_5_V_dout(1),
       VMSME_L3_nentries_1_6_V_dout => VMSME_L3_nentries_1_6_V_dout(1),
       VMSME_L3_nentries_1_7_V_dout => VMSME_L3_nentries_1_7_V_dout(1),
       VMSME_L3_nentries_2_0_V_dout => VMSME_L3_nentries_2_0_V_dout(1),
       VMSME_L3_nentries_2_1_V_dout => VMSME_L3_nentries_2_1_V_dout(1),
       VMSME_L3_nentries_2_2_V_dout => VMSME_L3_nentries_2_2_V_dout(1),
       VMSME_L3_nentries_2_3_V_dout => VMSME_L3_nentries_2_3_V_dout(1),
       VMSME_L3_nentries_2_4_V_dout => VMSME_L3_nentries_2_4_V_dout(1),
       VMSME_L3_nentries_2_5_V_dout => VMSME_L3_nentries_2_5_V_dout(1),
       VMSME_L3_nentries_2_6_V_dout => VMSME_L3_nentries_2_6_V_dout(1),
       VMSME_L3_nentries_2_7_V_dout => VMSME_L3_nentries_2_7_V_dout(1),
       VMSME_L3_nentries_3_0_V_dout => VMSME_L3_nentries_3_0_V_dout(1),
       VMSME_L3_nentries_3_1_V_dout => VMSME_L3_nentries_3_1_V_dout(1),
       VMSME_L3_nentries_3_2_V_dout => VMSME_L3_nentries_3_2_V_dout(1),
       VMSME_L3_nentries_3_3_V_dout => VMSME_L3_nentries_3_3_V_dout(1),
       VMSME_L3_nentries_3_4_V_dout => VMSME_L3_nentries_3_4_V_dout(1),
       VMSME_L3_nentries_3_5_V_dout => VMSME_L3_nentries_3_5_V_dout(1),
       VMSME_L3_nentries_3_6_V_dout => VMSME_L3_nentries_3_6_V_dout(1),
       VMSME_L3_nentries_3_7_V_dout => VMSME_L3_nentries_3_7_V_dout(1),
     
   -- MC inputs
       AS_L3_dataarray_data_V_enb => AS_L3_dataarray_data_V_enb(1),
       AS_L3_dataarray_data_V_readaddr => AS_L3_dataarray_data_V_readaddr(1),
       AS_L3_dataarray_data_V_dout => AS_L3_dataarray_data_V_dout(1),
       AS_L3_nentries_0_V_we => AS_L3_nentries_0_V_we(1),
       AS_L3_nentries_0_V_dout => AS_L3_nentries_0_V_dout(1),
       AS_L3_nentries_1_V_we => AS_L3_nentries_1_V_we(1),
       AS_L3_nentries_1_V_dout => AS_L3_nentries_1_V_dout(1),
       AS_L3_nentries_2_V_we => AS_L3_nentries_2_V_we(1),
       AS_L3_nentries_2_V_dout => AS_L3_nentries_2_V_dout(1),
       AS_L3_nentries_3_V_we => AS_L3_nentries_3_V_we(1),
       AS_L3_nentries_3_V_dout => AS_L3_nentries_3_V_dout(1),
       AS_L3_nentries_4_V_we => AS_L3_nentries_4_V_we(1),
       AS_L3_nentries_4_V_dout => AS_L3_nentries_4_V_dout(1),
       AS_L3_nentries_5_V_we => AS_L3_nentries_5_V_we(1),
       AS_L3_nentries_5_V_dout => AS_L3_nentries_5_V_dout(1),
       AS_L3_nentries_6_V_we => AS_L3_nentries_6_V_we(1),
       AS_L3_nentries_6_V_dout => AS_L3_nentries_6_V_dout(1),
       AS_L3_nentries_7_V_we => AS_L3_nentries_7_V_we(1),
       AS_L3_nentries_7_V_dout => AS_L3_nentries_7_V_dout(1),
 
   -- MC outputs
     FM_L1L2XX_dataarray_data_V_enb => FM_L1L2XX_dataarray_data_V_wea(1),
     FM_L1L2XX_dataarray_data_V_readaddr => FM_L1L2XX_dataarray_data_V_writeaddr(1),
     FM_L1L2XX_dataarray_data_V_dout => FM_L1L2XX_dataarray_data_V_din(1),
     FM_L1L2XX_nentries_0_V_dout => FM_L1L2XX_nentries_0_V_din(1),
     FM_L1L2XX_nentries_1_V_dout => FM_L1L2XX_nentries_1_V_din(1),
     FM_L5L6XX_dataarray_data_V_enb => FM_L5L6XX_dataarray_data_V_wea(1),
     FM_L5L6XX_dataarray_data_V_readaddr => FM_L5L6XX_dataarray_data_V_writeaddr(1),
     FM_L5L6XX_dataarray_data_V_dout => FM_L5L6XX_dataarray_data_V_din(1),
     FM_L5L6XX_nentries_0_V_dout => FM_L5L6XX_nentries_0_V_din(1),
     FM_L5L6XX_nentries_1_V_dout => FM_L5L6XX_nentries_1_V_din(1),
 
   -- More control signals
     bx_out_MatchCalculator => bx_out_MatchCalculator(1),
     MatchCalculator_done => MatchCalculator_done(1)
   
     );
     
       PRMEMC_C: entity work.uut
       generic map(
         PRPhiSlice => "C",
         NumTProj => TProj_NumMap(2))
       port map (
   -- Control signals
       clk => clk_PRMEMC,
       reset => reset,
       en_proc => std_logic' ('1'),
       bx_in_ProjectionRouter => bx_in,
         
   -- PR inputs
       TPROJ_L3_dataarray_data_V_dout => TPROJ_L3_dataarray_data_V_dout(2), 
       TPROJ_L3_nentries_0_V_dout => TPROJ_L3_nentries_0_V_dout(2), 
       TPROJ_L3_nentries_1_V_dout => TPROJ_L3_nentries_1_V_dout(2),
       TPROJ_L3_dataarray_data_V_enb => TPROJ_L3_dataarray_data_V_enb(2),
       TPROJ_L3_dataarray_data_V_readaddr => TPROJ_L3_dataarray_data_V_readaddr(2),
                       
   -- ME inputs
         VMSME_L3_dataarray_data_V_enb => VMSME_L3_dataarray_data_V_enb(2),
         VMSME_L3_dataarray_data_V_readaddr => VMSME_L3_dataarray_data_V_readaddr(2),
         VMSME_L3_dataarray_data_V_dout => VMSME_L3_dataarray_data_V_dout(2),
         VMSME_L3_nentries_0_0_V_dout => VMSME_L3_nentries_0_0_V_dout(2),
         VMSME_L3_nentries_0_1_V_dout => VMSME_L3_nentries_0_1_V_dout(2),
         VMSME_L3_nentries_0_2_V_dout => VMSME_L3_nentries_0_2_V_dout(2),
         VMSME_L3_nentries_0_3_V_dout => VMSME_L3_nentries_0_3_V_dout(2),
         VMSME_L3_nentries_0_4_V_dout => VMSME_L3_nentries_0_4_V_dout(2),
         VMSME_L3_nentries_0_5_V_dout => VMSME_L3_nentries_0_5_V_dout(2),
         VMSME_L3_nentries_0_6_V_dout => VMSME_L3_nentries_0_6_V_dout(2),
         VMSME_L3_nentries_0_7_V_dout => VMSME_L3_nentries_0_7_V_dout(2),
         VMSME_L3_nentries_1_0_V_dout => VMSME_L3_nentries_1_0_V_dout(2),
         VMSME_L3_nentries_1_1_V_dout => VMSME_L3_nentries_1_1_V_dout(2),
         VMSME_L3_nentries_1_2_V_dout => VMSME_L3_nentries_1_2_V_dout(2),
         VMSME_L3_nentries_1_3_V_dout => VMSME_L3_nentries_1_3_V_dout(2),
         VMSME_L3_nentries_1_4_V_dout => VMSME_L3_nentries_1_4_V_dout(2),
         VMSME_L3_nentries_1_5_V_dout => VMSME_L3_nentries_1_5_V_dout(2),
         VMSME_L3_nentries_1_6_V_dout => VMSME_L3_nentries_1_6_V_dout(2),
         VMSME_L3_nentries_1_7_V_dout => VMSME_L3_nentries_1_7_V_dout(2),
         VMSME_L3_nentries_2_0_V_dout => VMSME_L3_nentries_2_0_V_dout(2),
         VMSME_L3_nentries_2_1_V_dout => VMSME_L3_nentries_2_1_V_dout(2),
         VMSME_L3_nentries_2_2_V_dout => VMSME_L3_nentries_2_2_V_dout(2),
         VMSME_L3_nentries_2_3_V_dout => VMSME_L3_nentries_2_3_V_dout(2),
         VMSME_L3_nentries_2_4_V_dout => VMSME_L3_nentries_2_4_V_dout(2),
         VMSME_L3_nentries_2_5_V_dout => VMSME_L3_nentries_2_5_V_dout(2),
         VMSME_L3_nentries_2_6_V_dout => VMSME_L3_nentries_2_6_V_dout(2),
         VMSME_L3_nentries_2_7_V_dout => VMSME_L3_nentries_2_7_V_dout(2),
         VMSME_L3_nentries_3_0_V_dout => VMSME_L3_nentries_3_0_V_dout(2),
         VMSME_L3_nentries_3_1_V_dout => VMSME_L3_nentries_3_1_V_dout(2),
         VMSME_L3_nentries_3_2_V_dout => VMSME_L3_nentries_3_2_V_dout(2),
         VMSME_L3_nentries_3_3_V_dout => VMSME_L3_nentries_3_3_V_dout(2),
         VMSME_L3_nentries_3_4_V_dout => VMSME_L3_nentries_3_4_V_dout(2),
         VMSME_L3_nentries_3_5_V_dout => VMSME_L3_nentries_3_5_V_dout(2),
         VMSME_L3_nentries_3_6_V_dout => VMSME_L3_nentries_3_6_V_dout(2),
         VMSME_L3_nentries_3_7_V_dout => VMSME_L3_nentries_3_7_V_dout(2),
       
     -- MC inputs
         AS_L3_dataarray_data_V_enb => AS_L3_dataarray_data_V_enb(2),
         AS_L3_dataarray_data_V_readaddr => AS_L3_dataarray_data_V_readaddr(2),
         AS_L3_dataarray_data_V_dout => AS_L3_dataarray_data_V_dout(2),
         AS_L3_nentries_0_V_we => AS_L3_nentries_0_V_we(2),
         AS_L3_nentries_0_V_dout => AS_L3_nentries_0_V_dout(2),
         AS_L3_nentries_1_V_we => AS_L3_nentries_1_V_we(2),
         AS_L3_nentries_1_V_dout => AS_L3_nentries_1_V_dout(2),
         AS_L3_nentries_2_V_we => AS_L3_nentries_2_V_we(2),
         AS_L3_nentries_2_V_dout => AS_L3_nentries_2_V_dout(2),
         AS_L3_nentries_3_V_we => AS_L3_nentries_3_V_we(2),
         AS_L3_nentries_3_V_dout => AS_L3_nentries_3_V_dout(2),
         AS_L3_nentries_4_V_we => AS_L3_nentries_4_V_we(2),
         AS_L3_nentries_4_V_dout => AS_L3_nentries_4_V_dout(2),
         AS_L3_nentries_5_V_we => AS_L3_nentries_5_V_we(2),
         AS_L3_nentries_5_V_dout => AS_L3_nentries_5_V_dout(2),
         AS_L3_nentries_6_V_we => AS_L3_nentries_6_V_we(2),
         AS_L3_nentries_6_V_dout => AS_L3_nentries_6_V_dout(2),
         AS_L3_nentries_7_V_we => AS_L3_nentries_7_V_we(2),
         AS_L3_nentries_7_V_dout => AS_L3_nentries_7_V_dout(2),
   
     -- MC outputs
       FM_L1L2XX_dataarray_data_V_enb => FM_L1L2XX_dataarray_data_V_wea(2),
       FM_L1L2XX_dataarray_data_V_readaddr => FM_L1L2XX_dataarray_data_V_writeaddr(2),
       FM_L1L2XX_dataarray_data_V_dout => FM_L1L2XX_dataarray_data_V_din(2),
       FM_L1L2XX_nentries_0_V_dout => FM_L1L2XX_nentries_0_V_din(2),
       FM_L1L2XX_nentries_1_V_dout => FM_L1L2XX_nentries_1_V_din(2),
       FM_L5L6XX_dataarray_data_V_enb => FM_L5L6XX_dataarray_data_V_wea(2),
       FM_L5L6XX_dataarray_data_V_readaddr => FM_L5L6XX_dataarray_data_V_writeaddr(2),
       FM_L5L6XX_dataarray_data_V_dout => FM_L5L6XX_dataarray_data_V_din(2),
       FM_L5L6XX_nentries_0_V_dout => FM_L5L6XX_nentries_0_V_din(2),
       FM_L5L6XX_nentries_1_V_dout => FM_L5L6XX_nentries_1_V_din(2),
   
     -- More control signals
       bx_out_MatchCalculator => bx_out_MatchCalculator(2),
       MatchCalculator_done => MatchCalculator_done(2)
     
       );
         
  PRMEMC_D: entity work.uut
    generic map(
      PRPhiSlice => "D",
      NumTProj => TProj_NumMap(3))
    port map (
-- Control signals
    clk => clk_PRMEMC,
    reset => reset,
    en_proc => std_logic' ('1'),
    bx_in_ProjectionRouter => bx_in,
      
-- PR inputs
    TPROJ_L3_dataarray_data_V_dout => TPROJ_L3_dataarray_data_V_dout(3), 
    TPROJ_L3_nentries_0_V_dout => TPROJ_L3_nentries_0_V_dout(3), 
    TPROJ_L3_nentries_1_V_dout => TPROJ_L3_nentries_1_V_dout(3),
    TPROJ_L3_dataarray_data_V_enb => TPROJ_L3_dataarray_data_V_enb(3),
    TPROJ_L3_dataarray_data_V_readaddr => TPROJ_L3_dataarray_data_V_readaddr(3),
                    
-- ME inputs
      VMSME_L3_dataarray_data_V_enb => VMSME_L3_dataarray_data_V_enb(3),
      VMSME_L3_dataarray_data_V_readaddr => VMSME_L3_dataarray_data_V_readaddr(3),
      VMSME_L3_dataarray_data_V_dout => VMSME_L3_dataarray_data_V_dout(3),
      VMSME_L3_nentries_0_0_V_dout => VMSME_L3_nentries_0_0_V_dout(3),
      VMSME_L3_nentries_0_1_V_dout => VMSME_L3_nentries_0_1_V_dout(3),
      VMSME_L3_nentries_0_2_V_dout => VMSME_L3_nentries_0_2_V_dout(3),
      VMSME_L3_nentries_0_3_V_dout => VMSME_L3_nentries_0_3_V_dout(3),
      VMSME_L3_nentries_0_4_V_dout => VMSME_L3_nentries_0_4_V_dout(3),
      VMSME_L3_nentries_0_5_V_dout => VMSME_L3_nentries_0_5_V_dout(3),
      VMSME_L3_nentries_0_6_V_dout => VMSME_L3_nentries_0_6_V_dout(3),
      VMSME_L3_nentries_0_7_V_dout => VMSME_L3_nentries_0_7_V_dout(3),
      VMSME_L3_nentries_1_0_V_dout => VMSME_L3_nentries_1_0_V_dout(3),
      VMSME_L3_nentries_1_1_V_dout => VMSME_L3_nentries_1_1_V_dout(3),
      VMSME_L3_nentries_1_2_V_dout => VMSME_L3_nentries_1_2_V_dout(3),
      VMSME_L3_nentries_1_3_V_dout => VMSME_L3_nentries_1_3_V_dout(3),
      VMSME_L3_nentries_1_4_V_dout => VMSME_L3_nentries_1_4_V_dout(3),
      VMSME_L3_nentries_1_5_V_dout => VMSME_L3_nentries_1_5_V_dout(3),
      VMSME_L3_nentries_1_6_V_dout => VMSME_L3_nentries_1_6_V_dout(3),
      VMSME_L3_nentries_1_7_V_dout => VMSME_L3_nentries_1_7_V_dout(3),
      VMSME_L3_nentries_2_0_V_dout => VMSME_L3_nentries_2_0_V_dout(3),
      VMSME_L3_nentries_2_1_V_dout => VMSME_L3_nentries_2_1_V_dout(3),
      VMSME_L3_nentries_2_2_V_dout => VMSME_L3_nentries_2_2_V_dout(3),
      VMSME_L3_nentries_2_3_V_dout => VMSME_L3_nentries_2_3_V_dout(3),
      VMSME_L3_nentries_2_4_V_dout => VMSME_L3_nentries_2_4_V_dout(3),
      VMSME_L3_nentries_2_5_V_dout => VMSME_L3_nentries_2_5_V_dout(3),
      VMSME_L3_nentries_2_6_V_dout => VMSME_L3_nentries_2_6_V_dout(3),
      VMSME_L3_nentries_2_7_V_dout => VMSME_L3_nentries_2_7_V_dout(3),
      VMSME_L3_nentries_3_0_V_dout => VMSME_L3_nentries_3_0_V_dout(3),
      VMSME_L3_nentries_3_1_V_dout => VMSME_L3_nentries_3_1_V_dout(3),
      VMSME_L3_nentries_3_2_V_dout => VMSME_L3_nentries_3_2_V_dout(3),
      VMSME_L3_nentries_3_3_V_dout => VMSME_L3_nentries_3_3_V_dout(3),
      VMSME_L3_nentries_3_4_V_dout => VMSME_L3_nentries_3_4_V_dout(3),
      VMSME_L3_nentries_3_5_V_dout => VMSME_L3_nentries_3_5_V_dout(3),
      VMSME_L3_nentries_3_6_V_dout => VMSME_L3_nentries_3_6_V_dout(3),
      VMSME_L3_nentries_3_7_V_dout => VMSME_L3_nentries_3_7_V_dout(3),
    
  -- MC inputs
      AS_L3_dataarray_data_V_enb => AS_L3_dataarray_data_V_enb(3),
      AS_L3_dataarray_data_V_readaddr => AS_L3_dataarray_data_V_readaddr(3),
      AS_L3_dataarray_data_V_dout => AS_L3_dataarray_data_V_dout(3),
      AS_L3_nentries_0_V_we => AS_L3_nentries_0_V_we(3),
      AS_L3_nentries_0_V_dout => AS_L3_nentries_0_V_dout(3),
      AS_L3_nentries_1_V_we => AS_L3_nentries_1_V_we(3),
      AS_L3_nentries_1_V_dout => AS_L3_nentries_1_V_dout(3),
      AS_L3_nentries_2_V_we => AS_L3_nentries_2_V_we(3),
      AS_L3_nentries_2_V_dout => AS_L3_nentries_2_V_dout(3),
      AS_L3_nentries_3_V_we => AS_L3_nentries_3_V_we(3),
      AS_L3_nentries_3_V_dout => AS_L3_nentries_3_V_dout(3),
      AS_L3_nentries_4_V_we => AS_L3_nentries_4_V_we(3),
      AS_L3_nentries_4_V_dout => AS_L3_nentries_4_V_dout(3),
      AS_L3_nentries_5_V_we => AS_L3_nentries_5_V_we(3),
      AS_L3_nentries_5_V_dout => AS_L3_nentries_5_V_dout(3),
      AS_L3_nentries_6_V_we => AS_L3_nentries_6_V_we(3),
      AS_L3_nentries_6_V_dout => AS_L3_nentries_6_V_dout(3),
      AS_L3_nentries_7_V_we => AS_L3_nentries_7_V_we(3),
      AS_L3_nentries_7_V_dout => AS_L3_nentries_7_V_dout(3),

  -- MC outputs
    FM_L1L2XX_dataarray_data_V_enb => FM_L1L2XX_dataarray_data_V_wea(3),
    FM_L1L2XX_dataarray_data_V_readaddr => FM_L1L2XX_dataarray_data_V_writeaddr(3),
    FM_L1L2XX_dataarray_data_V_dout => FM_L1L2XX_dataarray_data_V_din(3),
    FM_L1L2XX_nentries_0_V_dout => FM_L1L2XX_nentries_0_V_din(3),
    FM_L1L2XX_nentries_1_V_dout => FM_L1L2XX_nentries_1_V_din(3),
    FM_L5L6XX_dataarray_data_V_enb => FM_L5L6XX_dataarray_data_V_wea(3),
    FM_L5L6XX_dataarray_data_V_readaddr => FM_L5L6XX_dataarray_data_V_writeaddr(3),
    FM_L5L6XX_dataarray_data_V_dout => FM_L5L6XX_dataarray_data_V_din(3),
    FM_L5L6XX_nentries_0_V_dout => FM_L5L6XX_nentries_0_V_din(3),
    FM_L5L6XX_nentries_1_V_dout => FM_L5L6XX_nentries_1_V_din(3),

  -- More control signals
    bx_out_MatchCalculator => bx_out_MatchCalculator(3),
    MatchCalculator_done => MatchCalculator_done(3)
  
    );
  
end architecture structure;
