library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;
use work.uut_pkg.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity top is
  port (
    -- clocks
    p_clk_200a : in  std_logic;
    n_clk_200a : in  std_logic;                -- 200 MHz system clock

    -- Zynq AXI Chip2Chip
    n_util_clk_chan0 : in std_logic;
    p_util_clk_chan0 : in std_logic;
    n_mgt_z2v        : in  std_logic_vector(1 downto 1);
    p_mgt_z2v        : in  std_logic_vector(1 downto 1);
    n_mgt_v2z        : out std_logic_vector(1 downto 1);
    p_mgt_v2z        : out std_logic_vector(1 downto 1);

    v_fpga_i2c_scl   : inout std_logic;
    v_fpga_i2c_sda   : inout std_logic;
    
    -- tri-color LED
    led_red : out std_logic;
    led_green : out std_logic;
    led_blue : out std_logic       -- assert to turn on
    );    
end entity top;

architecture structure of top is

  signal clk_200_raw     : std_logic;
  signal clk_200         : std_logic;
  signal clk_50          : std_logic;
  signal reset           : std_logic;
  signal counter         : unsigned(31 downto 0);
  signal locked_clk200   : std_logic;

  signal led_blue_local  : std_logic;
  signal led_red_local   : std_logic;
  signal led_green_local : std_logic;

  constant localAXISlaves    : integer := 4;
  signal local_AXI_ReadMOSI  :  AXIReadMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMOSI);
  signal local_AXI_ReadMISO  :  AXIReadMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIReadMISO);
  signal local_AXI_WriteMOSI : AXIWriteMOSI_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMOSI);
  signal local_AXI_WriteMISO : AXIWriteMISO_array_t(0 to localAXISlaves-1) := (others => DefaultAXIWriteMISO);
  signal AXI_CLK             : std_logic;
  signal AXI_RST_N           : std_logic;

  signal debug : std_logic_vector(2 downto 0);

  signal myreg1_test_vector : std_logic_vector(31 downto 0);
  signal myreg2_test_vector : std_logic_vector(31 downto 0);

  --PRMEMC
  signal clk_PRMEMC : std_logic;
  signal counter_PRMEMC : unsigned(31 downto 0) := to_unsigned(0,32);
  signal bx_in: std_logic_vector(2 downto 0) := "110";
  signal bx_out_MatchCalculator : std_logic_vector(2 downto 0);
  signal MatchCalculator_done:std_logic;
  --AS
  signal AS_L3PHICn4_dataarray_data_V_wea: std_logic;
  signal AS_L3PHICn4_dataarray_data_V_writeaddr: std_logic_vector(9 downto 0);
  signal AS_L3PHICn4_dataarray_data_V_din: std_logic_vector(35 downto 0);
  signal AS_L3PHICn4_nentries_0_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_0_V_din: std_logic_vector(7 downto 0) := "00111110";
  signal AS_L3PHICn4_nentries_1_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_1_V_din: std_logic_vector(7 downto 0) := "00111010";
  signal AS_L3PHICn4_nentries_2_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_2_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_nentries_3_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_3_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_nentries_4_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_4_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_nentries_5_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_5_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_nentries_6_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_6_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_nentries_7_V_we: std_logic := '1';
  signal AS_L3PHICn4_nentries_7_V_din: std_logic_vector(7 downto 0) := "00000000";
  signal AS_L3PHICn4_dataarray_data_V_enb: std_logic;
  signal AS_L3PHICn4_dataarray_data_V_readaddr: std_logic_vector(9 downto 0);
  signal AS_L3PHICn4_dataarray_data_V_dout: std_logic_vector(35 downto 0);
  signal AS_L3PHICn4_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_2_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_3_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_4_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_5_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_6_V_dout: std_logic_vector(7 downto 0);
  signal AS_L3PHICn4_nentries_7_V_dout: std_logic_vector(7 downto 0);
  
  --PR
   signal TPROJ_L1L2XXH_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00000110";
   signal TPROJ_L1L2XXH_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00001000";
   signal TPROJ_L5L6XXC_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00001010";
   signal TPROJ_L5L6XXC_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00000010";
   signal TPROJ_L1L2XXI_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00001010";
   signal TPROJ_L1L2XXI_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00001011";
   signal TPROJ_L5L6XXB_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00000000";
   signal TPROJ_L5L6XXB_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00000000";
   signal TPROJ_L5L6XXD_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00000001";
   signal TPROJ_L5L6XXD_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00000100";
   signal TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00000100";
   signal TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00001111";
   signal TPROJ_L1L2XXG_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00010111";
   signal TPROJ_L1L2XXG_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00001111";
   signal TPROJ_L1L2XXF_L3PHIC_nentries_0_V_din: std_logic_vector(7 downto 0) := "00000001";
   signal TPROJ_L1L2XXF_L3PHIC_nentries_1_V_din: std_logic_vector(7 downto 0) := "00000000";
   signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_wea : std_logic;
    signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_writeaddr : std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
    signal TPROJ_L1L2XXH_L3PHIC_nentries_0_V_we: std_logic := '1';
    signal TPROJ_L1L2XXH_L3PHIC_nentries_1_V_we: std_logic := '1';
    signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb: std_logic;
    signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  
  signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_wea: std_logic;
    signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
    signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
    signal TPROJ_L5L6XXC_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L5L6XXC_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb: std_logic;
    signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
    signal TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
    signal TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
    signal TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_wea: std_logic;
    signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L1L2XXI_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb: std_logic;
    signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
    signal TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_wea: std_logic;
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L5L6XXB_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb: std_logic;
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_wea: std_logic;
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L5L6XXD_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb: std_logic;
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_wea: std_logic;
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb: std_logic;
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_wea: std_logic;
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L1L2XXG_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb: std_logic;
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_wea: std_logic;
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_writeaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_din: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_nentries_0_V_we: std_logic := '1';
  signal TPROJ_L1L2XXF_L3PHIC_nentries_1_V_we: std_logic := '1';
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb: std_logic;
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout: std_logic_vector(59 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout: std_logic_vector(7 downto 0);
  signal TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout: std_logic_vector(7 downto 0);
  -- ME
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_wea : std_logic_vector(7 downto 0);
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_writeaddr : VMSME_writeaddr_array;
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_din : VMSME_data_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_0_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_0_1_V_din : VMSME_nentries_array := ("0010", "0101", "0000", "0010", "0100", "0001", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_0_2_V_din : VMSME_nentries_array := ("0000", "0001", "0010", "0010", "0010", "0001", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_0_3_V_din : VMSME_nentries_array := ("0001", "0001", "0011", "0001", "0011", "0100", "0100", "0011");
  signal VMSME_L3PHIC17to24n1_nentries_0_4_V_din : VMSME_nentries_array := ("0010", "0010", "0011", "0000", "0000", "0100", "0011", "0001");
  signal VMSME_L3PHIC17to24n1_nentries_0_5_V_din : VMSME_nentries_array := ("0001", "0001", "0110", "0010", "0010", "0001", "0010", "0001");
  signal VMSME_L3PHIC17to24n1_nentries_0_6_V_din : VMSME_nentries_array := ("0000", "0001", "0000", "0000", "0010", "0011", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_0_7_V_din : VMSME_nentries_array := ("0010", "0011", "0001", "0000", "0000", "0001", "0000", "0001");
  signal VMSME_L3PHIC17to24n1_nentries_1_0_V_din : VMSME_nentries_array := ("0010", "0001", "0001", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_1_1_V_din : VMSME_nentries_array := ("0000", "0000", "0001", "0000", "0000", "0001", "0010", "0001");
  signal VMSME_L3PHIC17to24n1_nentries_1_2_V_din : VMSME_nentries_array := ("0000", "0001", "0010", "0010", "0000", "0001", "0001", "0010");
  signal VMSME_L3PHIC17to24n1_nentries_1_3_V_din : VMSME_nentries_array := ("0011", "0100", "0001", "0000", "0010", "0100", "0010", "0010");
  signal VMSME_L3PHIC17to24n1_nentries_1_4_V_din : VMSME_nentries_array := ("0100", "0011", "0010", "0001", "0010", "0010", "0010", "0100");
  signal VMSME_L3PHIC17to24n1_nentries_1_5_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0010", "0001", "0001", "0010", "0100");
  signal VMSME_L3PHIC17to24n1_nentries_1_6_V_din : VMSME_nentries_array := ("0011", "0001", "0010", "0001", "0000", "0000", "0001", "0001");
  signal VMSME_L3PHIC17to24n1_nentries_1_7_V_din : VMSME_nentries_array := ("0000", "0000", "0001", "0001", "0000", "0100", "0101", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_0_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_1_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_2_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_3_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_4_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_5_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_6_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_2_7_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_0_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_1_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_2_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_3_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_4_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_5_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_6_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  signal VMSME_L3PHIC17to24n1_nentries_3_7_V_din : VMSME_nentries_array := ("0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000");
  
  signal VMSME_L3PHIC17to24n1_nentries_0_0_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_1_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_2_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_3_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_4_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_5_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_6_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_0_7_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_nentries_1_0_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_1_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_2_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_3_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_4_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_5_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_6_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_1_7_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_0_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_1_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_2_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_3_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_4_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_5_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_6_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_2_7_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_0_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_1_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_2_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_3_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_4_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_5_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_6_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal     VMSME_L3PHIC17to24n1_nentries_3_7_V_we : std_logic_vector(7 downto 0) := "11111111";
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_enb : std_logic_vector(7 downto 0);
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr : VMSME_readaddr_array;
  signal VMSME_L3PHIC17to24n1_dataarray_data_V_dout : VMSME_data_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_0_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_1_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_2_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_3_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_4_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_5_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_6_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_0_7_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_0_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_1_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_2_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_3_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_4_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_5_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_6_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_1_7_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_0_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_1_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_2_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_3_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_4_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_5_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_6_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_2_7_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_0_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_1_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_2_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_3_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_4_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_5_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_6_V_dout : VMSME_nentries_array;
  signal VMSME_L3PHIC17to24n1_nentries_3_7_V_dout : VMSME_nentries_array;
--MC
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_wea: std_logic;
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_writeaddr : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_din : std_logic_vector(44 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_0_V_we: std_logic;
  signal FM_L1L2XX_L3PHIC_nentries_0_V_din : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_1_V_we: std_logic;
  signal FM_L1L2XX_L3PHIC_nentries_1_V_din : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_enb: std_logic:= std_logic' ('0');
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr : std_logic_vector(7 downto 0):= "00000000";
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_dout: std_logic_vector(44 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_0_V_dout : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_1_V_dout : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_wea: std_logic;
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_writeaddr : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_din: std_logic_vector(44 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_0_V_we: std_logic;
  signal FM_L5L6XX_L3PHIC_nentries_0_V_din : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_1_V_we: std_logic;
  signal FM_L5L6XX_L3PHIC_nentries_1_V_din : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_enb: std_logic:= std_logic' ('0');
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr : std_logic_vector(7 downto 0) := "00000000";
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_dout: std_logic_vector(44 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_0_V_dout : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_1_V_dout : std_logic_vector(7 downto 0);

  signal FM_L1L2XX_L3PHIC_dataarray_data_V_wea_emulation : std_logic;
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_writeaddr_emulation : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_din_emulation : std_logic_vector(44 downto 0);
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_enb_emulation : std_logic := std_logic' ('0');
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr_emulation  : std_logic_vector(7 downto 0) := "00000000";
  signal FM_L1L2XX_L3PHIC_dataarray_data_V_dout_emulation : std_logic_vector(44 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_0_V_dout_emulation : std_logic_vector(7 downto 0);
  signal FM_L1L2XX_L3PHIC_nentries_1_V_dout_emulation : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_wea_emulation : std_logic;
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_writeaddr_emulation : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_din_emulation : std_logic_vector(44 downto 0);
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_enb_emulation : std_logic := std_logic' ('0');
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr_emulation : std_logic_vector(7 downto 0) := "00000000";
  signal FM_L5L6XX_L3PHIC_dataarray_data_V_dout_emulation : std_logic_vector(44 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_0_V_dout_emulation : std_logic_vector(7 downto 0);
  signal FM_L5L6XX_L3PHIC_nentries_1_V_dout_emulation : std_logic_vector(7 downto 0);
  signal error : std_logic_vector(1 downto 0) := "00";
  signal FM_L1L2XX_L3PHIC_nentries_0_V_we_emulation : std_logic := std_logic' ('1');
  signal FM_L1L2XX_L3PHIC_nentries_1_V_we_emulation : std_logic:= std_logic' ('1');
  signal FM_L5L6XX_L3PHIC_nentries_0_V_we_emulation : std_logic:= std_logic' ('1');
  signal FM_L5L6XX_L3PHIC_nentries_1_V_we_emulation : std_logic:= std_logic' ('1');
  signal FM_L1L2XX_L3PHIC_nentries_0_V_din_emulation: std_logic_vector(7 downto 0) := "00000011";
  signal FM_L1L2XX_L3PHIC_nentries_1_V_din_emulation: std_logic_vector(7 downto 0) := "00000100";
  signal FM_L5L6XX_L3PHIC_nentries_0_V_din_emulation: std_logic_vector(7 downto 0) := "00000010";
  signal FM_L5L6XX_L3PHIC_nentries_1_V_din_emulation: std_logic_vector(7 downto 0) := "00000000";
  
  
begin  -- architecture structure
  
  --Clocking
  reset <= not locked_clk200;
  Local_Clocking_1: entity work.Local_Clocking
    port map (
      clk_200   => clk_200,
      clk_50    => clk_50,
      clk_axi   => AXI_CLK,
      clk_250   => clk_PRMEMC,
      reset     => std_logic' ('0'),
      locked    => locked_clk200,
      clk_in1_p => p_clk_200a,
      clk_in1_n => n_clk_200a);

  --led_blue  <= led_blue_local;
  --led_red   <= led_red_local;
  --led_green <= led_green_local;

  led_blue <= std_logic' ('0') when unsigned(FM_L1L2XX_L3PHIC_dataarray_data_V_din) = to_unsigned(0,45) else std_logic' ('1');
  led_red <= std_logic' ('0') when unsigned(FM_L5L6XX_L3PHIC_dataarray_data_V_din) = to_unsigned(0,45) else std_logic' ('1');
  led_green <= std_logic' ('1') when FM_L1L2XX_L3PHIC_dataarray_data_V_wea = std_logic' ('0') and FM_L5L6XX_L3PHIC_dataarray_data_V_wea = std_logic' ('0');
  
  counter_proc: process (clk_200) is
  begin  -- process counter_proc
    if clk_200'event and clk_200 = std_logic' ('1') then  -- rising clock edge
      counter <= counter +1;
    end if;
  end process counter_proc;


  RGB_pwm_1: entity work.RGB_pwm
    generic map (
      CLKFREQ => 200000000,
      RGBFREQ => 1000)
    port map (
      clk        => clk_200,
      redcount   => myreg1_test_vector( 7 downto  0),
      greencount => myreg1_test_vector(15 downto  8),
      bluecount  => myreg1_test_vector(23 downto 16),
      LEDred     => led_red_local,
      LEDgreen   => led_green_local,
      LEDblue    => led_blue_local);
  

  c2csslave_wrapper_1: entity work.c2cslave_wrapper
    port map (
      AXI_CLK                  => AXI_CLK,
      AXI_RST_N(0)             => AXI_RST_N,
      C2CLink_phy_Rx_rxn       => n_mgt_z2v,
      C2CLink_phy_Rx_rxp       => p_mgt_z2v,
      C2CLink_phy_Tx_txn       => n_mgt_v2z,
      C2CLink_phy_Tx_txp       => p_mgt_v2z,
      C2CLink_phy_refclk_clk_n => n_util_clk_chan0,
      C2CLink_phy_refclk_clk_p => p_util_clk_chan0,
      clk50Mhz                 => clk_50,
      MYVREG0_araddr            => local_AXI_ReadMOSI(0).address,              
      MYVREG0_arprot            => local_AXI_ReadMOSI(0).protection_type,      
      MYVREG0_arready(0)        => local_AXI_ReadMISO(0).ready_for_address,    
      MYVREG0_arvalid(0)        => local_AXI_ReadMOSI(0).address_valid,        
      MYVREG0_awaddr            => local_AXI_WriteMOSI(0).address,             
      MYVREG0_awprot            => local_AXI_WriteMOSI(0).protection_type,     
      MYVREG0_awready(0)           => local_AXI_WriteMISO(0).ready_for_address,   
      MYVREG0_awvalid(0)           => local_AXI_WriteMOSI(0).address_valid,       
      MYVREG0_bready(0)            => local_AXI_WriteMOSI(0).ready_for_response,  
      MYVREG0_bresp             => local_AXI_WriteMISO(0).response,            
      MYVREG0_bvalid(0)            => local_AXI_WriteMISO(0).response_valid,      
      MYVREG0_rdata             => local_AXI_ReadMISO(0).data,                 
      MYVREG0_rready(0)            => local_AXI_ReadMOSI(0).ready_for_data,       
      MYVREG0_rresp             => local_AXI_ReadMISO(0).response,             
      MYVREG0_rvalid(0)            => local_AXI_ReadMISO(0).data_valid,           
      MYVREG0_wdata             => local_AXI_WriteMOSI(0).data,                
      MYVREG0_wready(0)            => local_AXI_WriteMISO(0).ready_for_data,       
      MYVREG0_wstrb             => local_AXI_WriteMOSI(0).data_write_strobe,   
      MYVREG0_wvalid(0)            => local_AXI_WriteMOSI(0).data_valid,          
      MYVREG1_araddr            => local_AXI_ReadMOSI(1).address,              
      MYVREG1_arprot            => local_AXI_ReadMOSI(1).protection_type,      
      MYVREG1_arready(0)           => local_AXI_ReadMISO(1).ready_for_address,    
      MYVREG1_arvalid(0)           => local_AXI_ReadMOSI(1).address_valid,        
      MYVREG1_awaddr            => local_AXI_WriteMOSI(1).address,             
      MYVREG1_awprot            => local_AXI_WriteMOSI(1).protection_type,     
      MYVREG1_awready(0)           => local_AXI_WriteMISO(1).ready_for_address,   
      MYVREG1_awvalid(0)           => local_AXI_WriteMOSI(1).address_valid,       
      MYVREG1_bready(0)            => local_AXI_WriteMOSI(1).ready_for_response,  
      MYVREG1_bresp             => local_AXI_WriteMISO(1).response,            
      MYVREG1_bvalid(0)            => local_AXI_WriteMISO(1).response_valid,      
      MYVREG1_rdata             => local_AXI_ReadMISO(1).data,                 
      MYVREG1_rready(0)            => local_AXI_ReadMOSI(1).ready_for_data,       
      MYVREG1_rresp             => local_AXI_ReadMISO(1).response,             
      MYVREG1_rvalid(0)            => local_AXI_ReadMISO(1).data_valid,           
      MYVREG1_wdata             => local_AXI_WriteMOSI(1).data,                
      MYVREG1_wready(0)            => local_AXI_WriteMISO(1).ready_for_data,       
      MYVREG1_wstrb             => local_AXI_WriteMOSI(1).data_write_strobe,   
      MYVREG1_wvalid(0)            => local_AXI_WriteMOSI(1).data_valid,
      CM_V_INFO_araddr            => local_AXI_ReadMOSI(2).address,              
      CM_V_INFO_arprot            => local_AXI_ReadMOSI(2).protection_type,      
      CM_V_INFO_arready(0)           => local_AXI_ReadMISO(2).ready_for_address,    
      CM_V_INFO_arvalid(0)           => local_AXI_ReadMOSI(2).address_valid,        
      CM_V_INFO_awaddr            => local_AXI_WriteMOSI(2).address,             
      CM_V_INFO_awprot            => local_AXI_WriteMOSI(2).protection_type,     
      CM_V_INFO_awready(0)           => local_AXI_WriteMISO(2).ready_for_address,   
      CM_V_INFO_awvalid(0)           => local_AXI_WriteMOSI(2).address_valid,       
      CM_V_INFO_bready(0)            => local_AXI_WriteMOSI(2).ready_for_response,  
      CM_V_INFO_bresp             => local_AXI_WriteMISO(2).response,            
      CM_V_INFO_bvalid(0)            => local_AXI_WriteMISO(2).response_valid,      
      CM_V_INFO_rdata             => local_AXI_ReadMISO(2).data,                 
      CM_V_INFO_rready(0)            => local_AXI_ReadMOSI(2).ready_for_data,       
      CM_V_INFO_rresp             => local_AXI_ReadMISO(2).response,             
      CM_V_INFO_rvalid(0)            => local_AXI_ReadMISO(2).data_valid,           
      CM_V_INFO_wdata             => local_AXI_WriteMOSI(2).data,                
      CM_V_INFO_wready(0)            => local_AXI_WriteMISO(2).ready_for_data,       
      CM_V_INFO_wstrb             => local_AXI_WriteMOSI(2).data_write_strobe,   
      CM_V_INFO_wvalid(0)            => local_AXI_WriteMOSI(2).data_valid,          

      reset_n                  => locked_clk200,--reset,
      C2CLink_aurora_do_cc                => open, 
      C2CLink_axi_c2c_config_error_out    => open, 
      C2CLink_axi_c2c_link_status_out     => open, 
      C2CLink_axi_c2c_multi_bit_error_out => open, 
      C2CLink_phy_gt_pll_lock             => debug(0), 
      C2CLink_phy_hard_err                => open, 
      C2CLink_phy_lane_up                 => debug(1 downto 1), 
      C2CLink_phy_link_reset_out          => open, 
      C2CLink_phy_mmcm_not_locked_out     => debug(2), 
      C2CLink_phy_power_down              => std_logic' ('0'), 
      C2CLink_phy_soft_err                => open,
      VIRTEX_SYS_MGMT_sda                 => v_fpga_i2c_sda,
      VIRTEX_SYS_MGMT_scl                 => v_fpga_i2c_scl,
      IPBUS_VIRTEX_araddr            => local_AXI_ReadMOSI(3).address,              
      IPBUS_VIRTEX_arprot            => local_AXI_ReadMOSI(3).protection_type,      
      IPBUS_VIRTEX_arready(0)        => local_AXI_ReadMISO(3).ready_for_address,    
      IPBUS_VIRTEX_arvalid(0)        => local_AXI_ReadMOSI(3).address_valid,        
      IPBUS_VIRTEX_awaddr            => local_AXI_WriteMOSI(3).address,             
      IPBUS_VIRTEX_awprot            => local_AXI_WriteMOSI(3).protection_type,     
      IPBUS_VIRTEX_awready(0)           => local_AXI_WriteMISO(3).ready_for_address,   
      IPBUS_VIRTEX_awvalid(0)           => local_AXI_WriteMOSI(3).address_valid,       
      IPBUS_VIRTEX_bready(0)            => local_AXI_WriteMOSI(3).ready_for_response,  
      IPBUS_VIRTEX_bresp             => local_AXI_WriteMISO(3).response,            
      IPBUS_VIRTEX_bvalid(0)            => local_AXI_WriteMISO(3).response_valid,      
      IPBUS_VIRTEX_rdata             => local_AXI_ReadMISO(3).data,                 
      IPBUS_VIRTEX_rready(0)            => local_AXI_ReadMOSI(3).ready_for_data,       
      IPBUS_VIRTEX_rresp             => local_AXI_ReadMISO(3).response,             
      IPBUS_VIRTEX_rvalid(0)            => local_AXI_ReadMISO(3).data_valid,           
      IPBUS_VIRTEX_wdata             => local_AXI_WriteMOSI(3).data,                
      IPBUS_VIRTEX_wready(0)            => local_AXI_WriteMISO(3).ready_for_data,       
      IPBUS_VIRTEX_wstrb             => local_AXI_WriteMOSI(3).data_write_strobe,   
      IPBUS_VIRTEX_wvalid(0)            => local_AXI_WriteMOSI(3).data_valid

);

  myReg_1: entity work.myReg
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(0),
      readMISO    => local_AXI_ReadMISO(0),
      writeMOSI   => local_AXI_WriteMOSI(0),
      writeMISO   => local_AXI_WriteMISO(0),
      test        => myreg1_test_vector);
  myReg_2: entity work.myReg
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(1),
      readMISO    => local_AXI_ReadMISO(1),
      writeMOSI   => local_AXI_WriteMOSI(1),
      writeMISO   => local_AXI_WriteMISO(1),
      test        => myreg2_test_vector);

  CM_V_info_1: entity work.FW_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(2),
      readMISO    => local_AXI_ReadMISO(2),
      writeMOSI   => local_AXI_WriteMOSI(2),
      writeMISO   => local_AXI_WriteMISO(2));


---  clk_PRMEMC <= clk_200;
  MemoryTPL1L2H: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
      RAM_DEPTH => 256,
      RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
      HEX => 1,
      INIT_FILE => string'("TrackletProjections_TPROJ_L1L2H_L3PHIC_04MOD.dat"))
    port map ( 
      clka => clk_PRMEMC,
      clkb => clk_PRMEMC,
      wea => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_wea,
      addra => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_writeaddr,
      dina => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_din,
      nent_we0 => TPROJ_L1L2XXH_L3PHIC_nentries_0_V_we,
      nent_i0 => TPROJ_L1L2XXH_L3PHIC_nentries_0_V_din,
      nent_we1 => TPROJ_L1L2XXH_L3PHIC_nentries_1_V_we,
      nent_i1 => TPROJ_L1L2XXH_L3PHIC_nentries_1_V_din,
      enb => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb,
      addrb => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr,
      doutb => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout,
      nent_o0 => TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout,
      nent_o1 => TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout,
      regceb => std_logic' ('1') 
      );
  MemoryTPL5L6C: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L5L6C_L3PHIC_04MOD.dat"))
    port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L5L6XXC_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L5L6XXC_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L5L6XXC_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L5L6XXC_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
  MemoryTPL1L2I: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L1L2I_L3PHIC_04MOD.dat"))
     port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L1L2XXI_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L1L2XXI_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L1L2XXI_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L1L2XXI_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
    MemoryTPL5L6B: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L5L6B_L3PHIC_04MOD.dat"))
    port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L5L6XXB_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L5L6XXB_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L5L6XXB_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L5L6XXB_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
  MemoryTPL5L6D: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L5L6D_L3PHIC_04MOD.dat"))
     port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L5L6XXD_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L5L6XXD_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L5L6XXD_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L5L6XXD_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
  MemoryTPL1L2J: entity work.Memory
      generic map (  RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L1L2J_L3PHIC_04MOD.dat"))
      port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
  MemoryTPL1L2G: entity work.Memory
      generic map (
        RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L1L2G_L3PHIC_04MOD.dat"))
      port map ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L1L2XXG_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L1L2XXG_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L1L2XXG_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L1L2XXG_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1') 
          );
  MemoryTPL1L2F: entity work.Memory
    generic map ( 
      RAM_WIDTH => 60,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
        HEX => 1,
        INIT_FILE => string'("TrackletProjections_TPROJ_L1L2F_L3PHIC_04MOD.dat"))
     port map  ( 
          clka => clk_PRMEMC,
            clkb => clk_PRMEMC,
            wea => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_wea,
            addra => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_writeaddr,
            dina => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_din,
            nent_we0 => TPROJ_L1L2XXF_L3PHIC_nentries_0_V_we,
            nent_i0 => TPROJ_L1L2XXF_L3PHIC_nentries_0_V_din,
            nent_we1 => TPROJ_L1L2XXF_L3PHIC_nentries_1_V_we,
            nent_i1 => TPROJ_L1L2XXF_L3PHIC_nentries_1_V_din,
            enb => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb,
            addrb => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr,
            doutb => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout,
            nent_o0 => TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout,
            nent_o1 => TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout,
            regceb => std_logic' ('1')
    );
  
  gen_MemoryVMStub: for i in 0 to 7 generate
    MemoryVMStub: entity work.MemoryBinned
      generic map (
        RAM_WIDTH => 14,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE =>  string'("LOW_LATENCY"),
        HEX => 1,
        INIT_FILE => string'("VMStubs_VMSME_L3PHIC" & integer'image(i+17) & "n1_04MOD.dat"))
      port map (                
        clka => clk_PRMEMC,
        clkb => clk_PRMEMC,
        rstb => std_logic' ('0'),
        wea => VMSME_L3PHIC17to24n1_dataarray_data_V_wea(i),
        addra => VMSME_L3PHIC17to24n1_dataarray_data_V_writeaddr(i),
        dina => VMSME_L3PHIC17to24n1_dataarray_data_V_din(i),
        nent_0_we0 => VMSME_L3PHIC17to24n1_nentries_0_0_V_we(i),
        nent_0_i0 => VMSME_L3PHIC17to24n1_nentries_0_0_V_din(i)(3 downto 0),
        nent_0_we1 => VMSME_L3PHIC17to24n1_nentries_0_1_V_we(i),
        nent_0_i1 => VMSME_L3PHIC17to24n1_nentries_0_1_V_din(i)(3 downto 0),
        nent_0_we2 => VMSME_L3PHIC17to24n1_nentries_0_2_V_we(i),
        nent_0_i2 => VMSME_L3PHIC17to24n1_nentries_0_2_V_din(i)(3 downto 0),
        nent_0_we3 => VMSME_L3PHIC17to24n1_nentries_0_3_V_we(i),
        nent_0_i3 => VMSME_L3PHIC17to24n1_nentries_0_3_V_din(i)(3 downto 0),
        nent_0_we4 => VMSME_L3PHIC17to24n1_nentries_0_4_V_we(i),
        nent_0_i4 => VMSME_L3PHIC17to24n1_nentries_0_4_V_din(i)(3 downto 0),
        nent_0_we5 => VMSME_L3PHIC17to24n1_nentries_0_5_V_we(i),
        nent_0_i5 => VMSME_L3PHIC17to24n1_nentries_0_5_V_din(i)(3 downto 0),
        nent_0_we6 => VMSME_L3PHIC17to24n1_nentries_0_6_V_we(i),
        nent_0_i6 => VMSME_L3PHIC17to24n1_nentries_0_6_V_din(i)(3 downto 0),
        nent_0_we7 => VMSME_L3PHIC17to24n1_nentries_0_7_V_we(i),
        nent_0_i7 => VMSME_L3PHIC17to24n1_nentries_0_7_V_din(i)(3 downto 0),
        nent_1_we0 => VMSME_L3PHIC17to24n1_nentries_1_0_V_we(i),
        nent_1_i0 => VMSME_L3PHIC17to24n1_nentries_1_0_V_din(i)(3 downto 0),
        nent_1_we1 => VMSME_L3PHIC17to24n1_nentries_1_1_V_we(i),
        nent_1_i1 => VMSME_L3PHIC17to24n1_nentries_1_1_V_din(i)(3 downto 0),
        nent_1_we2 => VMSME_L3PHIC17to24n1_nentries_1_2_V_we(i),
        nent_1_i2 => VMSME_L3PHIC17to24n1_nentries_1_2_V_din(i)(3 downto 0),
        nent_1_we3 => VMSME_L3PHIC17to24n1_nentries_1_3_V_we(i),
        nent_1_i3 => VMSME_L3PHIC17to24n1_nentries_1_3_V_din(i)(3 downto 0),
        nent_1_we4 => VMSME_L3PHIC17to24n1_nentries_1_4_V_we(i),
        nent_1_i4 => VMSME_L3PHIC17to24n1_nentries_1_4_V_din(i)(3 downto 0),
        nent_1_we5 => VMSME_L3PHIC17to24n1_nentries_1_5_V_we(i),
        nent_1_i5 => VMSME_L3PHIC17to24n1_nentries_1_5_V_din(i)(3 downto 0),
        nent_1_we6 => VMSME_L3PHIC17to24n1_nentries_1_6_V_we(i),
        nent_1_i6 => VMSME_L3PHIC17to24n1_nentries_1_6_V_din(i)(3 downto 0),
        nent_1_we7 => VMSME_L3PHIC17to24n1_nentries_1_7_V_we(i),
        nent_1_i7 => VMSME_L3PHIC17to24n1_nentries_1_7_V_din(i)(3 downto 0),
        nent_2_we0 => VMSME_L3PHIC17to24n1_nentries_2_0_V_we(i),
        nent_2_i0 => VMSME_L3PHIC17to24n1_nentries_2_0_V_din(i)(3 downto 0),
        nent_2_we1 => VMSME_L3PHIC17to24n1_nentries_2_1_V_we(i),
        nent_2_i1 => VMSME_L3PHIC17to24n1_nentries_2_1_V_din(i)(3 downto 0),
        nent_2_we2 => VMSME_L3PHIC17to24n1_nentries_2_2_V_we(i),
        nent_2_i2 => VMSME_L3PHIC17to24n1_nentries_2_2_V_din(i)(3 downto 0),
        nent_2_we3 => VMSME_L3PHIC17to24n1_nentries_2_3_V_we(i),
        nent_2_i3 => VMSME_L3PHIC17to24n1_nentries_2_3_V_din(i)(3 downto 0),
        nent_2_we4 => VMSME_L3PHIC17to24n1_nentries_2_4_V_we(i),
        nent_2_i4 => VMSME_L3PHIC17to24n1_nentries_2_4_V_din(i)(3 downto 0),
        nent_2_we5 => VMSME_L3PHIC17to24n1_nentries_2_5_V_we(i),
        nent_2_i5 => VMSME_L3PHIC17to24n1_nentries_2_5_V_din(i)(3 downto 0),
        nent_2_we6 => VMSME_L3PHIC17to24n1_nentries_2_6_V_we(i),
        nent_2_i6 => VMSME_L3PHIC17to24n1_nentries_2_6_V_din(i)(3 downto 0),
        nent_2_we7 => VMSME_L3PHIC17to24n1_nentries_2_7_V_we(i),
        nent_2_i7 => VMSME_L3PHIC17to24n1_nentries_2_7_V_din(i)(3 downto 0),
        nent_3_we0 => VMSME_L3PHIC17to24n1_nentries_3_0_V_we(i),
        nent_3_i0 => VMSME_L3PHIC17to24n1_nentries_3_0_V_din(i)(3 downto 0),
        nent_3_we1 => VMSME_L3PHIC17to24n1_nentries_3_1_V_we(i),
        nent_3_i1 => VMSME_L3PHIC17to24n1_nentries_3_1_V_din(i)(3 downto 0),
        nent_3_we2 => VMSME_L3PHIC17to24n1_nentries_3_2_V_we(i),
        nent_3_i2 => VMSME_L3PHIC17to24n1_nentries_3_2_V_din(i)(3 downto 0),
        nent_3_we3 => VMSME_L3PHIC17to24n1_nentries_3_3_V_we(i),
        nent_3_i3 => VMSME_L3PHIC17to24n1_nentries_3_3_V_din(i)(3 downto 0),
        nent_3_we4 => VMSME_L3PHIC17to24n1_nentries_3_4_V_we(i),
        nent_3_i4 => VMSME_L3PHIC17to24n1_nentries_3_4_V_din(i)(3 downto 0),
        nent_3_we5 => VMSME_L3PHIC17to24n1_nentries_3_5_V_we(i),
        nent_3_i5 => VMSME_L3PHIC17to24n1_nentries_3_5_V_din(i)(3 downto 0),
        nent_3_we6 => VMSME_L3PHIC17to24n1_nentries_3_6_V_we(i),
        nent_3_i6 => VMSME_L3PHIC17to24n1_nentries_3_6_V_din(i)(3 downto 0),
        nent_3_we7 => VMSME_L3PHIC17to24n1_nentries_3_7_V_we(i),
        nent_3_i7 => VMSME_L3PHIC17to24n1_nentries_3_7_V_din(i)(3 downto 0),
        enb => VMSME_L3PHIC17to24n1_dataarray_data_V_enb(i),
        addrb => VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr(i)(7 downto 0),
        doutb => VMSME_L3PHIC17to24n1_dataarray_data_V_dout(i),
        nent_0_o0 => VMSME_L3PHIC17to24n1_nentries_0_0_V_dout(i)(3 downto 0),
        nent_0_o1 => VMSME_L3PHIC17to24n1_nentries_0_1_V_dout(i)(3 downto 0),
        nent_0_o2 => VMSME_L3PHIC17to24n1_nentries_0_2_V_dout(i)(3 downto 0),
        nent_0_o3 => VMSME_L3PHIC17to24n1_nentries_0_3_V_dout(i)(3 downto 0),
        nent_0_o4 => VMSME_L3PHIC17to24n1_nentries_0_4_V_dout(i)(3 downto 0),
        nent_0_o5 => VMSME_L3PHIC17to24n1_nentries_0_5_V_dout(i)(3 downto 0),
        nent_0_o6 => VMSME_L3PHIC17to24n1_nentries_0_6_V_dout(i)(3 downto 0),
        nent_0_o7 => VMSME_L3PHIC17to24n1_nentries_0_7_V_dout(i)(3 downto 0),
        nent_1_o0 => VMSME_L3PHIC17to24n1_nentries_1_0_V_dout(i)(3 downto 0),
        nent_1_o1 => VMSME_L3PHIC17to24n1_nentries_1_1_V_dout(i)(3 downto 0),
        nent_1_o2 => VMSME_L3PHIC17to24n1_nentries_1_2_V_dout(i)(3 downto 0),
        nent_1_o3 => VMSME_L3PHIC17to24n1_nentries_1_3_V_dout(i)(3 downto 0),
        nent_1_o4 => VMSME_L3PHIC17to24n1_nentries_1_4_V_dout(i)(3 downto 0),
        nent_1_o5 => VMSME_L3PHIC17to24n1_nentries_1_5_V_dout(i)(3 downto 0),
        nent_1_o6 => VMSME_L3PHIC17to24n1_nentries_1_6_V_dout(i)(3 downto 0),
        nent_1_o7 => VMSME_L3PHIC17to24n1_nentries_1_7_V_dout(i)(3 downto 0),
        nent_2_o0 => VMSME_L3PHIC17to24n1_nentries_2_0_V_dout(i)(3 downto 0),
        nent_2_o1 => VMSME_L3PHIC17to24n1_nentries_2_1_V_dout(i)(3 downto 0),
        nent_2_o2 => VMSME_L3PHIC17to24n1_nentries_2_2_V_dout(i)(3 downto 0),
        nent_2_o3 => VMSME_L3PHIC17to24n1_nentries_2_3_V_dout(i)(3 downto 0),
        nent_2_o4 => VMSME_L3PHIC17to24n1_nentries_2_4_V_dout(i)(3 downto 0),
        nent_2_o5 => VMSME_L3PHIC17to24n1_nentries_2_5_V_dout(i)(3 downto 0),
        nent_2_o6 => VMSME_L3PHIC17to24n1_nentries_2_6_V_dout(i)(3 downto 0),
        nent_2_o7 => VMSME_L3PHIC17to24n1_nentries_2_7_V_dout(i)(3 downto 0),
        nent_3_o0 => VMSME_L3PHIC17to24n1_nentries_3_0_V_dout(i)(3 downto 0),
        nent_3_o1 => VMSME_L3PHIC17to24n1_nentries_3_1_V_dout(i)(3 downto 0),
        nent_3_o2 => VMSME_L3PHIC17to24n1_nentries_3_2_V_dout(i)(3 downto 0),
        nent_3_o3 => VMSME_L3PHIC17to24n1_nentries_3_3_V_dout(i)(3 downto 0),
        nent_3_o4 => VMSME_L3PHIC17to24n1_nentries_3_4_V_dout(i)(3 downto 0),
        nent_3_o5 => VMSME_L3PHIC17to24n1_nentries_3_5_V_dout(i)(3 downto 0),
        nent_3_o6 => VMSME_L3PHIC17to24n1_nentries_3_6_V_dout(i)(3 downto 0),
        nent_3_o7 => VMSME_L3PHIC17to24n1_nentries_3_7_V_dout(i)(3 downto 0),
        regceb => std_logic' ('1')
        );
  end generate gen_MemoryVMStub;

  MemoryMCL1L2: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>0)
    port map(
      clka=>    clk_PRMEMC,
      clkb=>    clk_PRMEMC,
      wea=>    FM_L1L2XX_L3PHIC_dataarray_data_V_wea,
      addra=>    FM_L1L2XX_L3PHIC_dataarray_data_V_writeaddr,
      dina=>    FM_L1L2XX_L3PHIC_dataarray_data_V_din,
      nent_we0=>    FM_L1L2XX_L3PHIC_nentries_0_V_we,
      nent_i0=>    FM_L1L2XX_L3PHIC_nentries_0_V_din,
      nent_we1=>    FM_L1L2XX_L3PHIC_nentries_1_V_we,
      nent_i1=>    FM_L1L2XX_L3PHIC_nentries_1_V_din,
      enb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_enb,
      addrb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr,
      doutb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_dout,
      nent_o0=>    FM_L1L2XX_L3PHIC_nentries_0_V_dout,
      nent_o1=>    FM_L1L2XX_L3PHIC_nentries_1_V_dout,
      regceb=> std_logic' ('1')
      );
  
  MemoryMCL5L6: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>0)
    port map(
      clka=>   clk_PRMEMC,
      clkb=>   clk_PRMEMC,
      wea=>    FM_L5L6XX_L3PHIC_dataarray_data_V_wea,
      addra=>    FM_L5L6XX_L3PHIC_dataarray_data_V_writeaddr,
      dina=>    FM_L5L6XX_L3PHIC_dataarray_data_V_din,
      nent_we0=>    FM_L5L6XX_L3PHIC_nentries_0_V_we,
      nent_i0=>    FM_L5L6XX_L3PHIC_nentries_0_V_din,
      nent_we1=>    FM_L5L6XX_L3PHIC_nentries_1_V_we,
      nent_i1=>    FM_L5L6XX_L3PHIC_nentries_1_V_din,
      enb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_enb,
      addrb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr,
      doutb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_dout,
      nent_o0=>    FM_L5L6XX_L3PHIC_nentries_0_V_dout,
      nent_o1=>    FM_L5L6XX_L3PHIC_nentries_1_V_dout,
      regceb=> std_logic' ('1')
      );

  MemoryMCL1L2_emulation: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>1,
      INIT_FILE=>string'("FullMatches_FM_L1L2_L3PHIC_04MOD.dat"))
    port map(
      clka=>    clk_PRMEMC,
      clkb=>    clk_PRMEMC,
      wea=>    FM_L1L2XX_L3PHIC_dataarray_data_V_wea_emulation,
      addra=>    FM_L1L2XX_L3PHIC_dataarray_data_V_writeaddr_emulation,
      dina=>    FM_L1L2XX_L3PHIC_dataarray_data_V_din_emulation,
      nent_we0=>    FM_L1L2XX_L3PHIC_nentries_0_V_we_emulation,
      nent_i0=>    FM_L1L2XX_L3PHIC_nentries_0_V_din_emulation,
      nent_we1=>    FM_L1L2XX_L3PHIC_nentries_1_V_we_emulation,
      nent_i1=>    FM_L1L2XX_L3PHIC_nentries_1_V_din_emulation,
      enb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_enb_emulation,
      addrb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr_emulation,
      doutb=>    FM_L1L2XX_L3PHIC_dataarray_data_V_dout_emulation,
      nent_o0=>    FM_L1L2XX_L3PHIC_nentries_0_V_dout_emulation,
      nent_o1=>    FM_L1L2XX_L3PHIC_nentries_1_V_dout_emulation,
      regceb=> std_logic' ('1')
      );
  
  MemoryMCL5L6_emulation: entity work.Memory
    generic map (
      RAM_WIDTH => 45,
      RAM_DEPTH=> 256,
      RAM_PERFORMANCE=>string'("HIGH_PERFORMANCE"),
      HEX=>1,
      INIT_FILE=>string'("FullMatches_FM_L5L6_L3PHIC_04MOD.dat")
    port map(
      clka=>   clk_PRMEMC,
      clkb=>   clk_PRMEMC,
      wea=>    FM_L5L6XX_L3PHIC_dataarray_data_V_wea_emulation,
      addra=>    FM_L5L6XX_L3PHIC_dataarray_data_V_writeaddr_emulation,
      dina=>    FM_L5L6XX_L3PHIC_dataarray_data_V_din_emulation,
      nent_we0=>    FM_L5L6XX_L3PHIC_nentries_0_V_we_emulation,
      nent_i0=>    FM_L5L6XX_L3PHIC_nentries_0_V_din_emulation,
      nent_we1=>    FM_L5L6XX_L3PHIC_nentries_1_V_we_emulation,
      nent_i1=>    FM_L5L6XX_L3PHIC_nentries_1_V_din_emulation,
      enb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_enb_emulation,
      addrb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr_emulation,
      doutb=>    FM_L5L6XX_L3PHIC_dataarray_data_V_dout_emulation,
      nent_o0=>    FM_L5L6XX_L3PHIC_nentries_0_V_dout_emulation,
      nent_o1=>    FM_L5L6XX_L3PHIC_nentries_1_V_dout_emulation,
      regceb=> std_logic' ('1')
      );
  
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

  check_output_PRMEMC: process (clk_PRMEMC)
    begin
      if rising_edge(clk_PRMEMC) then
        if (MatchCalculator_done) then
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb_emulation <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb_emulation <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr <= FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr + std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr_emulation <= FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr_emulation + std_logic' ('1');
          FM_L5L6XX_L3PHIC_dataarray_data_V_enb <= std_logic' ('1');
          FM_L5L6XX_L3PHIC_dataarray_data_V_enb_emulation <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb <= std_logic' ('1');
          FM_L1L2XX_L3PHIC_dataarray_data_V_enb_emulation <= std_logic' ('1');
          FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr <= FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr + std_logic' ('1');
          FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr_emulation <= FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr_emulation + std_logic' ('1');
        end if;
        if (FM_L1L2XX_L3PHIC_dataarray_data_V_dout != FM_L1L2XX_L3PHIC_dataarray_data_V_dout_emulation) then
          error(0) <= std_logic' ('1');
        end if;
        if (FM_L5L6XX_L3PHIC_dataarray_data_V_dout != FM_L5L6XX_L3PHIC_dataarray_data_V_dout_emulation) then
          error(1) <= std_logic' ('1');
        end if;
      end if;
    end process check_output_PRMEMC;

                                                                                                                                                                              
                 
  PRMEMC: entity work.uut
    port map (
-- Control signals
    clk => clk_PRMEMC,
    reset => reset,
    en_proc => std_logic' ('1'),
    bx_in_ProjectionRouter => bx_in,
      
-- PR inputs
    TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout,
    TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout => TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout,
    TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout => TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout,
    TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout,
    TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout => TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout,
    TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout => TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout,
    TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout,
    TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout => TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout,
    TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout => TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout,
    TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout,
    TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout => TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout,
    TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout => TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout,
    TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout,
    TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout => TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout,
    TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout => TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout,
    TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout,
    TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout => TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout,
    TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout => TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout,
    TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout,
    TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout => TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout,
    TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout => TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout,
    TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout,
    TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout => TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout,
    TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout => TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout,
    TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb,
    TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb,
    TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb,
    TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb,
    TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb,
    TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb,
    TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb,
    TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr,
    TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb,
    TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr,
    
-- ME inputs
      VMSME_L3PHIC17to24n1_dataarray_data_V_enb => VMSME_L3PHIC17to24n1_dataarray_data_V_enb,
      VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr => VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr,
      VMSME_L3PHIC17to24n1_dataarray_data_V_dout => VMSME_L3PHIC17to24n1_dataarray_data_V_dout,
    VMSME_L3PHIC17to24n1_nentries_0_0_V_dout => VMSME_L3PHIC17to24n1_nentries_0_0_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_1_V_dout => VMSME_L3PHIC17to24n1_nentries_0_1_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_2_V_dout => VMSME_L3PHIC17to24n1_nentries_0_2_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_3_V_dout => VMSME_L3PHIC17to24n1_nentries_0_3_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_4_V_dout => VMSME_L3PHIC17to24n1_nentries_0_4_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_5_V_dout => VMSME_L3PHIC17to24n1_nentries_0_5_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_6_V_dout => VMSME_L3PHIC17to24n1_nentries_0_6_V_dout,
      VMSME_L3PHIC17to24n1_nentries_0_7_V_dout => VMSME_L3PHIC17to24n1_nentries_0_7_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_0_V_dout => VMSME_L3PHIC17to24n1_nentries_1_0_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_1_V_dout => VMSME_L3PHIC17to24n1_nentries_1_1_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_2_V_dout => VMSME_L3PHIC17to24n1_nentries_1_2_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_3_V_dout => VMSME_L3PHIC17to24n1_nentries_1_3_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_4_V_dout => VMSME_L3PHIC17to24n1_nentries_1_4_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_5_V_dout => VMSME_L3PHIC17to24n1_nentries_1_5_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_6_V_dout => VMSME_L3PHIC17to24n1_nentries_1_6_V_dout,
      VMSME_L3PHIC17to24n1_nentries_1_7_V_dout => VMSME_L3PHIC17to24n1_nentries_1_7_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_0_V_dout => VMSME_L3PHIC17to24n1_nentries_2_0_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_1_V_dout => VMSME_L3PHIC17to24n1_nentries_2_1_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_2_V_dout => VMSME_L3PHIC17to24n1_nentries_2_2_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_3_V_dout => VMSME_L3PHIC17to24n1_nentries_2_3_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_4_V_dout => VMSME_L3PHIC17to24n1_nentries_2_4_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_5_V_dout => VMSME_L3PHIC17to24n1_nentries_2_5_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_6_V_dout => VMSME_L3PHIC17to24n1_nentries_2_6_V_dout,
      VMSME_L3PHIC17to24n1_nentries_2_7_V_dout => VMSME_L3PHIC17to24n1_nentries_2_7_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_0_V_dout => VMSME_L3PHIC17to24n1_nentries_3_0_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_1_V_dout => VMSME_L3PHIC17to24n1_nentries_3_1_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_2_V_dout => VMSME_L3PHIC17to24n1_nentries_3_2_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_3_V_dout => VMSME_L3PHIC17to24n1_nentries_3_3_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_4_V_dout => VMSME_L3PHIC17to24n1_nentries_3_4_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_5_V_dout => VMSME_L3PHIC17to24n1_nentries_3_5_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_6_V_dout => VMSME_L3PHIC17to24n1_nentries_3_6_V_dout,
      VMSME_L3PHIC17to24n1_nentries_3_7_V_dout => VMSME_L3PHIC17to24n1_nentries_3_7_V_dout,
    
  -- MC inputs
      AS_L3PHICn4_dataarray_data_V_enb => AS_L3PHICn4_dataarray_data_V_wea,
      AS_L3PHICn4_dataarray_data_V_readaddr => AS_L3PHICn4_dataarray_data_V_writeaddr,
      AS_L3PHICn4_dataarray_data_V_dout => AS_L3PHICn4_dataarray_data_V_din,
      AS_L3PHICn4_nentries_0_V_we => AS_L3PHICn4_nentries_0_V_we,
      AS_L3PHICn4_nentries_0_V_dout => AS_L3PHICn4_nentries_0_V_din,
      AS_L3PHICn4_nentries_1_V_we => AS_L3PHICn4_nentries_1_V_we,
      AS_L3PHICn4_nentries_1_V_dout => AS_L3PHICn4_nentries_1_V_din,
      AS_L3PHICn4_nentries_2_V_we => AS_L3PHICn4_nentries_2_V_we,
      AS_L3PHICn4_nentries_2_V_dout => AS_L3PHICn4_nentries_2_V_din,
      AS_L3PHICn4_nentries_3_V_we => AS_L3PHICn4_nentries_3_V_we,
      AS_L3PHICn4_nentries_3_V_dout => AS_L3PHICn4_nentries_3_V_din,
      AS_L3PHICn4_nentries_4_V_we => AS_L3PHICn4_nentries_4_V_we,
      AS_L3PHICn4_nentries_4_V_dout => AS_L3PHICn4_nentries_4_V_din,
      AS_L3PHICn4_nentries_5_V_we => AS_L3PHICn4_nentries_5_V_we,
      AS_L3PHICn4_nentries_5_V_dout => AS_L3PHICn4_nentries_5_V_din,
      AS_L3PHICn4_nentries_6_V_we => AS_L3PHICn4_nentries_6_V_we,
      AS_L3PHICn4_nentries_6_V_dout => AS_L3PHICn4_nentries_6_V_din,
      AS_L3PHICn4_nentries_7_V_we => AS_L3PHICn4_nentries_7_V_we,
      AS_L3PHICn4_nentries_7_V_dout => AS_L3PHICn4_nentries_7_V_din,

  -- MC outputs
    FM_L1L2XX_L3PHIC_dataarray_data_V_enb => FM_L1L2XX_L3PHIC_dataarray_data_V_wea,
    FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr => FM_L1L2XX_L3PHIC_dataarray_data_V_writeaddr,
    FM_L1L2XX_L3PHIC_dataarray_data_V_dout => FM_L1L2XX_L3PHIC_dataarray_data_V_din,
    FM_L1L2XX_L3PHIC_nentries_0_V_dout => FM_L1L2XX_L3PHIC_nentries_0_V_din,
    FM_L1L2XX_L3PHIC_nentries_1_V_dout => FM_L1L2XX_L3PHIC_nentries_1_V_din,
    FM_L5L6XX_L3PHIC_dataarray_data_V_enb => FM_L5L6XX_L3PHIC_dataarray_data_V_wea,
    FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr => FM_L5L6XX_L3PHIC_dataarray_data_V_writeaddr,
    FM_L5L6XX_L3PHIC_dataarray_data_V_dout => FM_L5L6XX_L3PHIC_dataarray_data_V_din,
    FM_L5L6XX_L3PHIC_nentries_0_V_dout => FM_L5L6XX_L3PHIC_nentries_0_V_din,
    FM_L5L6XX_L3PHIC_nentries_1_V_dout => FM_L5L6XX_L3PHIC_nentries_1_V_din,

  -- More control signals
    bx_out_MatchCalculator => bx_out_MatchCalculator,
    MatchCalculator_done => MatchCalculator_done
  
    );
  
end architecture structure;
