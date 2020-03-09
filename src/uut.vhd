library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;
use work.uut_pkg.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity uut is
    port (
      clk : in std_logic;
      reset : in std_logic;
-- For PR		       
      en_proc : in std_logic;
      bx_in_ProjectionRouter : in std_logic_vector(2 downto 0);
      TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
      TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
      TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
      TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout : in std_logic_vector(59 downto 0);
   TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout : in std_logic_vector(7 downto 0);
       TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
       TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb : out std_logic;
   TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
-- For ME
  VMSME_L3PHIC17to24n1_dataarray_data_V_enb : out std_logic_vector(7 downto 0);-- [7:0) : in std_logic;
  VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr : out VMSME_readaddr_array;-- [7:0) : in std_logic;
  VMSME_L3PHIC17to24n1_dataarray_data_V_dout : in VMSME_data_array;
   VMSME_L3PHIC17to24n1_nentries_0_0_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_1_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_2_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_3_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_4_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_5_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_6_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_0_7_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_0_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_1_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_2_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_3_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_4_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_5_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_6_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_1_7_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_0_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_1_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_2_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_3_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_4_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_5_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_6_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_2_7_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_0_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_1_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_2_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_3_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_4_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_5_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_6_V_dout : in VMSME_nentries_array;
   VMSME_L3PHIC17to24n1_nentries_3_7_V_dout : in VMSME_nentries_array;
  -- For MC
   AS_L3PHICn4_dataarray_data_V_enb : out std_logic;
   AS_L3PHICn4_dataarray_data_V_readaddr : out std_logic_vector(9 downto 0);
   AS_L3PHICn4_dataarray_data_V_dout : in std_logic_vector(35 downto 0);
   as_l3phicn4_nentries_0_v_we   : in std_logic;
   as_l3phicn4_nentries_1_v_we   : in std_logic;
   as_l3phicn4_nentries_2_v_we   : in std_logic;
   as_l3phicn4_nentries_3_v_we   : in std_logic;
   as_l3phicn4_nentries_4_v_we   : in std_logic;
   as_l3phicn4_nentries_5_v_we   : in std_logic;
   as_l3phicn4_nentries_6_v_we   : in std_logic;
   as_l3phicn4_nentries_7_v_we   : in std_logic;
   AS_L3PHICn4_nentries_0_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_1_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_2_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_3_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_4_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_5_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_6_V_dout : in std_logic_vector(7 downto 0);
   AS_L3PHICn4_nentries_7_V_dout : in std_logic_vector(7 downto 0);
   bx_out_MatchCalculator : out std_logic_vector(2 downto 0);
   FM_L1L2XX_L3PHIC_dataarray_data_V_enb : out std_logic;
   FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
   FM_L1L2XX_L3PHIC_dataarray_data_V_dout : out std_logic_vector(44 downto 0);
   FM_L1L2XX_L3PHIC_nentries_0_V_we : out std_logic;
   FM_L1L2XX_L3PHIC_nentries_0_V_dout : out std_logic_vector(7 downto 0);
   FM_L1L2XX_L3PHIC_nentries_1_V_we : out std_logic;
   FM_L1L2XX_L3PHIC_nentries_1_V_dout : out std_logic_vector(7 downto 0);
   FM_L5L6XX_L3PHIC_dataarray_data_V_enb : out std_logic;
   FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr : out std_logic_vector(7 downto 0);
   FM_L5L6XX_L3PHIC_dataarray_data_V_dout : out std_logic_vector(44 downto 0);
   FM_L5L6XX_L3PHIC_nentries_0_V_we : out std_logic;
   FM_L5L6XX_L3PHIC_nentries_0_V_dout : out std_logic_vector(7 downto 0);
   FM_L5L6XX_L3PHIC_nentries_1_V_we : out std_logic;
   FM_L5L6XX_L3PHIC_nentries_1_V_dout : out std_logic_vector(7 downto 0);
   MatchCalculator_done : out std_logic		       
);
end entity uut;

architecture structure of uut is
--PR output
   
--wire [0:7) y2 [3:0)          -- y is an 8-bit vector net with a depth of 4

  signal bx_out_ProjectionRouter : std_logic_vector(2 downto 0);
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_wea : std_logic_vector(7 downto 0); --8 nonants
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr  : VMSME_writeaddr_array;
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_din  : VMPROJ_data_array;
  signal VMPROJ_L3PHIC17to24_nentries_0_V_we : std_logic_vector(7 downto 0);
  signal VMPROJ_L3PHIC17to24_nentries_0_V_din  : array8_8;
  signal VMPROJ_L3PHIC17to24_nentries_1_V_we : std_logic_vector(7 downto 0);
  signal VMPROJ_L3PHIC17to24_nentries_1_V_din  : array8_8;
  signal ProjectionRouter_done : std_logic;
  signal AP_L3PHIC_dataarray_data_V_wea : std_logic;
  signal AP_L3PHIC_dataarray_data_V_writeaddr : std_logic_vector(9 downto 0);
  signal AP_L3PHIC_dataarray_data_V_din : std_logic_vector(59 downto 0);
  signal AP_L3PHIC_nentries_0_V_we : std_logic;
  signal AP_L3PHIC_nentries_0_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_1_V_we : std_logic;
  signal AP_L3PHIC_nentries_1_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_2_V_we : std_logic;
  signal AP_L3PHIC_nentries_2_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_3_V_we : std_logic;
  signal AP_L3PHIC_nentries_3_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_4_V_we : std_logic;
  signal AP_L3PHIC_nentries_4_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_5_V_we : std_logic;
  signal AP_L3PHIC_nentries_5_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_6_V_we : std_logic;
  signal AP_L3PHIC_nentries_6_V_din : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_7_V_we : std_logic;
  signal AP_L3PHIC_nentries_7_V_din : std_logic_vector(7 downto 0);

  signal MatchEngine_start : std_logic := std_logic' ('0');

  -- PR Output ME Input 8 MEs
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_enb : std_logic_vector(7 downto 0);
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_readaddr : array8_8;
  signal VMPROJ_L3PHIC17to24_dataarray_data_V_dout : array8_21;
  signal VMPROJ_L3PHIC17to24_nentries_0_V_dout : array8_8;
  signal VMPROJ_L3PHIC17to24_nentries_1_V_dout : array8_8;
  

  -- PR Output MC Input
  signal AP_L3PHIC_dataarray_data_V_enb : std_logic;
  signal AP_L3PHIC_dataarray_data_V_readaddr : std_logic_vector(9 downto 0);
  signal AP_L3PHIC_dataarray_data_V_dout : std_logic_vector(59 downto 0);
  signal AP_L3PHIC_nentries_0_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_1_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_2_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_3_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_4_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_5_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_6_V_dout : std_logic_vector(7 downto 0);
  signal AP_L3PHIC_nentries_7_V_dout : std_logic_vector(7 downto 0);

  signal bx_out_MatchEngine : bx_array;
  signal                MatchEngine_done : std_logic_vector(7 downto 0);
  signal CM_L3PHIC17to24_dataarray_data_V_wea : std_logic_vector(7 downto 0);
  signal CM_L3PHIC17to24_dataarray_data_V_writeaddr  : array8_8;
  signal CM_L3PHIC17to24_dataarray_data_V_din  : VMSME_data_array;
  signal CM_L3PHIC17to24_nentries_0_V_we  : std_logic_vector(7 downto 0);
  signal  CM_L3PHIC17to24_nentries_0_V_din  : array8_8;
  signal CM_L3PHIC17to24_nentries_1_V_we  : std_logic_vector(7 downto 0);
  signal CM_L3PHIC17to24_nentries_1_V_din  : array8_8;
  signal CM_L3PHIC17to24_dataarray_data_V_enb  : std_logic_vector(7 downto 0);
  signal CM_L3PHIC17to24_dataarray_data_V_readaddr  : array8_8;
  signal CM_L3PHIC17to24_dataarray_data_V_dout  : array8_14;
  signal CM_L3PHIC17to24_nentries_0_V_dout  : array8_8;
  signal CM_L3PHIC17to24_nentries_1_V_dout  : array8_8;
  
begin
  
PR_L3PHIC: entity work.PR_L3PHIC
  port map(
  ap_clk => clk,
  ap_rst => reset,
  ap_start => en_proc,
  ap_done => ProjectionRouter_done,
  bx_V => bx_in_ProjectionRouter,
  proj1in_dataarray_data_V_ce0 => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_enb,
  proj1in_dataarray_data_V_address0 => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_readaddr,
  proj1in_dataarray_data_V_q0 => TPROJ_L1L2XXF_L3PHIC_dataarray_data_V_dout,
  proj1in_nentries_0_V => TPROJ_L1L2XXF_L3PHIC_nentries_0_V_dout,
  proj1in_nentries_1_V => TPROJ_L1L2XXF_L3PHIC_nentries_1_V_dout,
  proj2in_dataarray_data_V_ce0 => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_enb,
  proj2in_dataarray_data_V_address0 => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_readaddr,
  proj2in_dataarray_data_V_q0 => TPROJ_L1L2XXG_L3PHIC_dataarray_data_V_dout,
  proj2in_nentries_0_V => TPROJ_L1L2XXG_L3PHIC_nentries_0_V_dout,
  proj2in_nentries_1_V => TPROJ_L1L2XXG_L3PHIC_nentries_1_V_dout,
  proj3in_dataarray_data_V_ce0 => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_enb,
  proj3in_dataarray_data_V_address0 => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_readaddr,
  proj3in_dataarray_data_V_q0 => TPROJ_L1L2XXH_L3PHIC_dataarray_data_V_dout,
  proj3in_nentries_0_V => TPROJ_L1L2XXH_L3PHIC_nentries_0_V_dout,
  proj3in_nentries_1_V => TPROJ_L1L2XXH_L3PHIC_nentries_1_V_dout,
  proj4in_dataarray_data_V_ce0 => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_enb,
  proj4in_dataarray_data_V_address0 => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_readaddr,
  proj4in_dataarray_data_V_q0 => TPROJ_L1L2XXI_L3PHIC_dataarray_data_V_dout,
  proj4in_nentries_0_V => TPROJ_L1L2XXI_L3PHIC_nentries_0_V_dout,
  proj4in_nentries_1_V => TPROJ_L1L2XXI_L3PHIC_nentries_1_V_dout,
  proj5in_dataarray_data_V_ce0 => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_enb,
  proj5in_dataarray_data_V_address0 => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_readaddr,
  proj5in_dataarray_data_V_q0 => TPROJ_L1L2XXJ_L3PHIC_dataarray_data_V_dout,
  proj5in_nentries_0_V => TPROJ_L1L2XXJ_L3PHIC_nentries_0_V_dout,
  proj5in_nentries_1_V => TPROJ_L1L2XXJ_L3PHIC_nentries_1_V_dout,
  proj6in_dataarray_data_V_ce0 => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_enb,
  proj6in_dataarray_data_V_address0 => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_readaddr,
  proj6in_dataarray_data_V_q0 => TPROJ_L5L6XXB_L3PHIC_dataarray_data_V_dout,
  proj6in_nentries_0_V => TPROJ_L5L6XXB_L3PHIC_nentries_0_V_dout,
  proj6in_nentries_1_V => TPROJ_L5L6XXB_L3PHIC_nentries_1_V_dout,
  proj7in_dataarray_data_V_ce0 => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_enb,
  proj7in_dataarray_data_V_address0 => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_readaddr,
  proj7in_dataarray_data_V_q0 => TPROJ_L5L6XXC_L3PHIC_dataarray_data_V_dout,
  proj7in_nentries_0_V => TPROJ_L5L6XXC_L3PHIC_nentries_0_V_dout,
  proj7in_nentries_1_V => TPROJ_L5L6XXC_L3PHIC_nentries_1_V_dout,
  proj8in_dataarray_data_V_ce0 => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_enb,
  proj8in_dataarray_data_V_address0 => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_readaddr,
  proj8in_dataarray_data_V_q0 => TPROJ_L5L6XXD_L3PHIC_dataarray_data_V_dout,
  proj8in_nentries_0_V => TPROJ_L5L6XXD_L3PHIC_nentries_0_V_dout,
  proj8in_nentries_1_V => TPROJ_L5L6XXD_L3PHIC_nentries_1_V_dout,
  bx_o_V => bx_out_ProjectionRouter,
  allprojout_dataarray_data_V_we0 => AP_L3PHIC_dataarray_data_V_wea,
  allprojout_dataarray_data_V_address0 => AP_L3PHIC_dataarray_data_V_writeaddr,
  allprojout_dataarray_data_V_d0 => AP_L3PHIC_dataarray_data_V_din,
  allprojout_nentries_0_V_ap_vld => AP_L3PHIC_nentries_0_V_we,
  allprojout_nentries_0_V => AP_L3PHIC_nentries_0_V_din,
  allprojout_nentries_1_V_ap_vld => AP_L3PHIC_nentries_1_V_we,
  allprojout_nentries_1_V => AP_L3PHIC_nentries_1_V_din,
  allprojout_nentries_2_V_ap_vld => AP_L3PHIC_nentries_2_V_we,
  allprojout_nentries_2_V => AP_L3PHIC_nentries_2_V_din,
  allprojout_nentries_3_V_ap_vld => AP_L3PHIC_nentries_3_V_we,
  allprojout_nentries_3_V => AP_L3PHIC_nentries_3_V_din,
  allprojout_nentries_4_V_ap_vld => AP_L3PHIC_nentries_4_V_we,
  allprojout_nentries_4_V => AP_L3PHIC_nentries_4_V_din,
  allprojout_nentries_5_V_ap_vld => AP_L3PHIC_nentries_5_V_we,
  allprojout_nentries_5_V => AP_L3PHIC_nentries_5_V_din,
  allprojout_nentries_6_V_ap_vld => AP_L3PHIC_nentries_6_V_we,
  allprojout_nentries_6_V => AP_L3PHIC_nentries_6_V_din,
  allprojout_nentries_7_V_ap_vld => AP_L3PHIC_nentries_7_V_we,
  allprojout_nentries_7_V => AP_L3PHIC_nentries_7_V_din,
  vmprojout1_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(0),
  vmprojout1_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(0),
  vmprojout1_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(0),
  vmprojout1_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(0),
  vmprojout1_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(0),
  vmprojout1_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(0),
  vmprojout1_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(0),
  vmprojout2_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(1),
  vmprojout2_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(1),
  vmprojout2_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(1),
  vmprojout2_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(1),
  vmprojout2_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(1),
  vmprojout2_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(1),
  vmprojout2_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(1),
  vmprojout3_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(2),
  vmprojout3_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(2),
  vmprojout3_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(2),
  vmprojout3_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(2),
  vmprojout3_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(2),
  vmprojout3_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(2),
  vmprojout3_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(2),
  vmprojout4_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(3),
  vmprojout4_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(3),
  vmprojout4_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(3),
  vmprojout4_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(3),
  vmprojout4_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(3),
  vmprojout4_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(3),
  vmprojout4_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(3),
  vmprojout5_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(4),
  vmprojout5_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(4),
  vmprojout5_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(4),
  vmprojout5_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(4),
  vmprojout5_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(4),
  vmprojout5_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(4),
  vmprojout5_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(4),
  vmprojout6_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(5),
  vmprojout6_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(5),
  vmprojout6_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(5),
  vmprojout6_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(5),
  vmprojout6_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(5),
  vmprojout6_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(5),
  vmprojout6_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(5),
  vmprojout7_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(6),
  vmprojout7_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(6),
  vmprojout7_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(6),
  vmprojout7_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(6),
  vmprojout7_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(6),
  vmprojout7_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(6),
  vmprojout7_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(6),
  vmprojout8_dataarray_data_V_we0 => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(7),
  vmprojout8_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(7),
  vmprojout8_dataarray_data_V_d0 => VMPROJ_L3PHIC17to24_dataarray_data_V_din(7),
  vmprojout8_nentries_0_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_0_V_we(7),
  vmprojout8_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_din(7),
  vmprojout8_nentries_1_V_ap_vld => VMPROJ_L3PHIC17to24_nentries_1_V_we(7),
  vmprojout8_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_din(7)
);

MatchEngine_start <= std_logic' ('1') when ProjectionRouter_done = std_logic' ('1');

gen_MemoryVMProj: for i in 0 to 7 generate
    MemoryVMProj: entity work.Memory
      generic map(
        RAM_WIDTH => 21,
        RAM_DEPTH => 256,
        RAM_PERFORMANCE => string'("LOW_LATENCY"),
        HEX => 1)
      port map(
        clka => clk,
        clkb => clk,
        wea => VMPROJ_L3PHIC17to24_dataarray_data_V_wea(i),
        addra => VMPROJ_L3PHIC17to24_dataarray_data_V_writeaddr(i),
        dina => VMPROJ_L3PHIC17to24_dataarray_data_V_din(i),
        nent_we0 => VMPROJ_L3PHIC17to24_nentries_0_V_we(i),
        nent_i0 => VMPROJ_L3PHIC17to24_nentries_0_V_din(i),
        nent_we1 => VMPROJ_L3PHIC17to24_nentries_1_V_we(i),
        nent_i1 => VMPROJ_L3PHIC17to24_nentries_1_V_din(i),
        enb => VMPROJ_L3PHIC17to24_dataarray_data_V_enb(i),
        addrb => VMPROJ_L3PHIC17to24_dataarray_data_V_readaddr(i),
        doutb => VMPROJ_L3PHIC17to24_dataarray_data_V_dout(i),
        nent_o0 => VMPROJ_L3PHIC17to24_nentries_0_V_dout(i),
        nent_o1 => VMPROJ_L3PHIC17to24_nentries_1_V_dout(i),
        regceb => std_logic' ('1')
      );
end generate gen_MemoryVMProj;      

MemoryAP: entity work.Memory
  generic map(
    RAM_WIDTH => 60,
    RAM_DEPTH => 1024,
    RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
    HEX => 1)
  port map (
    clka => clk,
      clkb => clk,
      wea => AP_L3PHIC_dataarray_data_V_wea,
      addra => AP_L3PHIC_dataarray_data_V_writeaddr,
      dina => AP_L3PHIC_dataarray_data_V_din,
      nent_we0 => AP_L3PHIC_nentries_0_V_we,
      nent_i0 => AP_L3PHIC_nentries_0_V_din,
      nent_we1 => AP_L3PHIC_nentries_1_V_we,
      nent_i1 => AP_L3PHIC_nentries_1_V_din,
      nent_we2 => AP_L3PHIC_nentries_2_V_we,
      nent_i2 => AP_L3PHIC_nentries_2_V_din,
      nent_we3 => AP_L3PHIC_nentries_3_V_we,
      nent_i3 => AP_L3PHIC_nentries_3_V_din,
      nent_we4 => AP_L3PHIC_nentries_4_V_we,
      nent_i4 => AP_L3PHIC_nentries_4_V_din,
      nent_we5 => AP_L3PHIC_nentries_5_V_we,
      nent_i5 => AP_L3PHIC_nentries_5_V_din,
      nent_we6 => AP_L3PHIC_nentries_6_V_we,
      nent_i6 => AP_L3PHIC_nentries_6_V_din,
      nent_we7 => AP_L3PHIC_nentries_7_V_we,
      nent_i7 => AP_L3PHIC_nentries_7_V_din,
      enb => AP_L3PHIC_dataarray_data_V_enb,
      addrb => AP_L3PHIC_dataarray_data_V_readaddr,
      doutb => AP_L3PHIC_dataarray_data_V_dout,
      nent_o0 => AP_L3PHIC_nentries_0_V_dout,
      nent_o1 => AP_L3PHIC_nentries_1_V_dout,
      nent_o2 => AP_L3PHIC_nentries_2_V_dout,
      nent_o3 => AP_L3PHIC_nentries_3_V_dout,
      nent_o4 => AP_L3PHIC_nentries_4_V_dout,
      nent_o5 => AP_L3PHIC_nentries_5_V_dout,
      nent_o6 => AP_L3PHIC_nentries_6_V_dout,
      nent_o7 => AP_L3PHIC_nentries_7_V_dout,
      regceb => std_logic' ('1')
    );

gen_MatchEngineTopL3: for a in 0 to 7 generate
  MatchEngineTopL3_0: entity work.MatchEngineTopL3_0
    port map(
  ap_clk => clk,
  ap_rst => reset,
  ap_start => MatchEngine_start,
  ap_done => MatchEngine_done(a),
  bx_V => bx_out_ProjectionRouter,
  bx_o_V => bx_out_MatchEngine(a),
  instubdata_dataarray_data_V_ce0 => VMSME_L3PHIC17to24n1_dataarray_data_V_enb(a),
  instubdata_dataarray_data_V_address0 => VMSME_L3PHIC17to24n1_dataarray_data_V_readaddr(a),
  instubdata_dataarray_data_V_q0 => VMSME_L3PHIC17to24n1_dataarray_data_V_dout(a),
  instubdata_nentries_0_V_0 => VMSME_L3PHIC17to24n1_nentries_0_0_V_dout(a),
  instubdata_nentries_0_V_1 => VMSME_L3PHIC17to24n1_nentries_0_1_V_dout(a),
  instubdata_nentries_0_V_2 => VMSME_L3PHIC17to24n1_nentries_0_2_V_dout(a),
  instubdata_nentries_0_V_3 => VMSME_L3PHIC17to24n1_nentries_0_3_V_dout(a),
  instubdata_nentries_0_V_4 => VMSME_L3PHIC17to24n1_nentries_0_4_V_dout(a),
  instubdata_nentries_0_V_5 => VMSME_L3PHIC17to24n1_nentries_0_5_V_dout(a),
  instubdata_nentries_0_V_6 => VMSME_L3PHIC17to24n1_nentries_0_6_V_dout(a),
  instubdata_nentries_0_V_7 => VMSME_L3PHIC17to24n1_nentries_0_7_V_dout(a),
  instubdata_nentries_1_V_0 => VMSME_L3PHIC17to24n1_nentries_1_0_V_dout(a),
  instubdata_nentries_1_V_1 => VMSME_L3PHIC17to24n1_nentries_1_1_V_dout(a),
  instubdata_nentries_1_V_2 => VMSME_L3PHIC17to24n1_nentries_1_2_V_dout(a),
  instubdata_nentries_1_V_3 => VMSME_L3PHIC17to24n1_nentries_1_3_V_dout(a),
  instubdata_nentries_1_V_4 => VMSME_L3PHIC17to24n1_nentries_1_4_V_dout(a),
  instubdata_nentries_1_V_5 => VMSME_L3PHIC17to24n1_nentries_1_5_V_dout(a),
  instubdata_nentries_1_V_6 => VMSME_L3PHIC17to24n1_nentries_1_6_V_dout(a),
  instubdata_nentries_1_V_7 => VMSME_L3PHIC17to24n1_nentries_1_7_V_dout(a),
  instubdata_nentries_2_V_0 => VMSME_L3PHIC17to24n1_nentries_2_0_V_dout(a),
  instubdata_nentries_2_V_1 => VMSME_L3PHIC17to24n1_nentries_2_1_V_dout(a),
  instubdata_nentries_2_V_2 => VMSME_L3PHIC17to24n1_nentries_2_2_V_dout(a),
  instubdata_nentries_2_V_3 => VMSME_L3PHIC17to24n1_nentries_2_3_V_dout(a),
  instubdata_nentries_2_V_4 => VMSME_L3PHIC17to24n1_nentries_2_4_V_dout(a),
  instubdata_nentries_2_V_5 => VMSME_L3PHIC17to24n1_nentries_2_5_V_dout(a),
  instubdata_nentries_2_V_6 => VMSME_L3PHIC17to24n1_nentries_2_6_V_dout(a),
  instubdata_nentries_2_V_7 => VMSME_L3PHIC17to24n1_nentries_2_7_V_dout(a),
  instubdata_nentries_3_V_0 => VMSME_L3PHIC17to24n1_nentries_3_0_V_dout(a),
  instubdata_nentries_3_V_1 => VMSME_L3PHIC17to24n1_nentries_3_1_V_dout(a),
  instubdata_nentries_3_V_2 => VMSME_L3PHIC17to24n1_nentries_3_2_V_dout(a),
  instubdata_nentries_3_V_3 => VMSME_L3PHIC17to24n1_nentries_3_3_V_dout(a),
  instubdata_nentries_3_V_4 => VMSME_L3PHIC17to24n1_nentries_3_4_V_dout(a),
  instubdata_nentries_3_V_5 => VMSME_L3PHIC17to24n1_nentries_3_5_V_dout(a),
  instubdata_nentries_3_V_6 => VMSME_L3PHIC17to24n1_nentries_3_6_V_dout(a),
  instubdata_nentries_3_V_7 => VMSME_L3PHIC17to24n1_nentries_3_7_V_dout(a),				      
  inprojdata_dataarray_data_V_ce0 => VMPROJ_L3PHIC17to24_dataarray_data_V_enb(a),
  inprojdata_dataarray_data_V_address0 => VMPROJ_L3PHIC17to24_dataarray_data_V_readaddr(a),
  inprojdata_dataarray_data_V_q0 => VMPROJ_L3PHIC17to24_dataarray_data_V_dout(a),
  inprojdata_nentries_0_V => VMPROJ_L3PHIC17to24_nentries_0_V_dout(a),
  inprojdata_nentries_1_V => VMPROJ_L3PHIC17to24_nentries_1_V_dout(a),
  outcandmatch_dataarray_data_V_we0 => CM_L3PHIC17to24_dataarray_data_V_wea(a),
  outcandmatch_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_writeaddr(a),
  outcandmatch_dataarray_data_V_d0 => CM_L3PHIC17to24_dataarray_data_V_din(a),
  outcandmatch_nentries_0_V_ap_vld => CM_L3PHIC17to24_nentries_0_V_we(a),
  outcandmatch_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_din(a),
  outcandmatch_nentries_1_V_ap_vld => CM_L3PHIC17to24_nentries_1_V_we(a),
  outcandmatch_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_din(a)
);
end generate gen_MatchEngineTopL3;


gen_MemoryCM: for b in 0 to 7 generate
  MemoryCM: entity work.Memory
    generic map(
      RAM_WIDTH => 14,
      RAM_DEPTH => 256,
      RAM_PERFORMANCE => string'("HIGH_PERFORMANCE"),
      HEX => 1)
    port map (
      clka => clk,
      clkb => clk,
      rstb => reset,
      wea => CM_L3PHIC17to24_dataarray_data_V_wea(b),
      addra => CM_L3PHIC17to24_dataarray_data_V_writeaddr(b),
      dina => CM_L3PHIC17to24_dataarray_data_V_din(b),
      nent_we0 => CM_L3PHIC17to24_nentries_0_V_we(b),
      nent_i0 => CM_L3PHIC17to24_nentries_0_V_din(b),
      nent_we1 => CM_L3PHIC17to24_nentries_1_V_we(b),
      nent_i1 => CM_L3PHIC17to24_nentries_1_V_din(b),
      enb => CM_L3PHIC17to24_dataarray_data_V_enb(b),
      addrb => CM_L3PHIC17to24_dataarray_data_V_readaddr(b),
      doutb => CM_L3PHIC17to24_dataarray_data_V_dout(b),
      nent_o0 => CM_L3PHIC17to24_nentries_0_V_dout(b),
      nent_o1 => CM_L3PHIC17to24_nentries_1_V_dout(b),
      regceb => std_logic' ('1')
      );
end generate gen_MemoryCM;
       

MC_L3PHIC: entity work.MC_L3PHIC
  port map(
  ap_clk => clk,
  ap_rst => reset,
  ap_start => en_proc,
  ap_done => MatchCalculator_done,
  bx_V => bx_out_MatchEngine(0),
  match1_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(0),
  match1_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(0),
  match1_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(0),
  match1_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(0),
  match1_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(0),
  match2_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(1),
  match2_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(1),
  match2_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(1),
  match2_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(1),
  match2_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(1),
  match3_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(2),
  match3_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(2),
  match3_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(2),
  match3_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(2),
  match3_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(2),
  match4_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(3),
  match4_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(3),
  match4_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(3),
  match4_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(3),
  match4_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(3),
  match5_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(4),
  match5_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(4),
  match5_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(4),
  match5_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(4),
  match5_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(4),
  match6_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(5),
  match6_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(5),
  match6_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(5),
  match6_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(5),
  match6_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(5),
  match7_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(6),
  match7_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(6),
  match7_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(6),
  match7_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(6),
  match7_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(6),
  match8_dataarray_data_V_ce0 => CM_L3PHIC17to24_dataarray_data_V_enb(7),
  match8_dataarray_data_V_address0 => CM_L3PHIC17to24_dataarray_data_V_readaddr(7),
  match8_dataarray_data_V_q0 => CM_L3PHIC17to24_dataarray_data_V_dout(7),
  match8_nentries_0_V => CM_L3PHIC17to24_nentries_0_V_dout(7),
  match8_nentries_1_V => CM_L3PHIC17to24_nentries_1_V_dout(7),
  allstub_dataarray_data_V_ce0 => AS_L3PHICn4_dataarray_data_V_enb,
  allstub_dataarray_data_V_address0 => AS_L3PHICn4_dataarray_data_V_readaddr,
  allstub_dataarray_data_V_q0 => AS_L3PHICn4_dataarray_data_V_dout,
  allstub_nentries_0_V => AS_L3PHICn4_nentries_0_V_dout,
  allstub_nentries_1_V => AS_L3PHICn4_nentries_1_V_dout,
  allstub_nentries_2_V => AS_L3PHICn4_nentries_2_V_dout,
  allstub_nentries_3_V => AS_L3PHICn4_nentries_3_V_dout,
  allstub_nentries_4_V => AS_L3PHICn4_nentries_4_V_dout,
  allstub_nentries_5_V => AS_L3PHICn4_nentries_5_V_dout,
  allstub_nentries_6_V => AS_L3PHICn4_nentries_6_V_dout,
  allstub_nentries_7_V => AS_L3PHICn4_nentries_7_V_dout,
  allproj_dataarray_data_V_ce0 => AP_L3PHIC_dataarray_data_V_enb,
  allproj_dataarray_data_V_address0 => AP_L3PHIC_dataarray_data_V_readaddr,
  allproj_dataarray_data_V_q0 => AP_L3PHIC_dataarray_data_V_dout,
  allproj_nentries_0_V => AP_L3PHIC_nentries_0_V_dout,
  allproj_nentries_1_V => AP_L3PHIC_nentries_1_V_dout,
  allproj_nentries_2_V => AP_L3PHIC_nentries_2_V_dout,
  allproj_nentries_3_V => AP_L3PHIC_nentries_3_V_dout,
  allproj_nentries_4_V => AP_L3PHIC_nentries_4_V_dout,
  allproj_nentries_5_V => AP_L3PHIC_nentries_5_V_dout,
  allproj_nentries_6_V => AP_L3PHIC_nentries_6_V_dout,
  allproj_nentries_7_V => AP_L3PHIC_nentries_7_V_dout,
  bx_o_V => bx_out_MatchCalculator,
  fullmatch1_dataarray_data_V_we0 => FM_L1L2XX_L3PHIC_dataarray_data_V_enb,
  fullmatch1_dataarray_data_V_address0 => FM_L1L2XX_L3PHIC_dataarray_data_V_readaddr,
  fullmatch1_dataarray_data_V_d0 => FM_L1L2XX_L3PHIC_dataarray_data_V_dout,
  fullmatch1_nentries_0_V_ap_vld => FM_L1L2XX_L3PHIC_nentries_0_V_we,
  fullmatch1_nentries_0_V => FM_L1L2XX_L3PHIC_nentries_0_V_dout,
  fullmatch1_nentries_1_V_ap_vld => FM_L1L2XX_L3PHIC_nentries_1_V_we,
  fullmatch1_nentries_1_V => FM_L1L2XX_L3PHIC_nentries_1_V_dout,
  fullmatch3_dataarray_data_V_we0 => FM_L5L6XX_L3PHIC_dataarray_data_V_enb,
  fullmatch3_dataarray_data_V_address0 => FM_L5L6XX_L3PHIC_dataarray_data_V_readaddr,
  fullmatch3_dataarray_data_V_d0 => FM_L5L6XX_L3PHIC_dataarray_data_V_dout,
  fullmatch3_nentries_0_V_ap_vld => FM_L5L6XX_L3PHIC_nentries_0_V_we,
  fullmatch3_nentries_0_V => FM_L5L6XX_L3PHIC_nentries_0_V_dout,
  fullmatch3_nentries_1_V_ap_vld => FM_L5L6XX_L3PHIC_nentries_1_V_we,
  fullmatch3_nentries_1_V => FM_L5L6XX_L3PHIC_nentries_1_V_dout
);

end architecture structure;
