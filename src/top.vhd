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
    p_clk0_chan0     : in std_logic; -- 312.5 MHz system clock
    n_clk0_chan0     : in std_logic;
    p_clk1_chan0     : in std_logic; -- 312.195122 MHz synth clock
    n_clk1_chan0     : in std_logic;
    p_ff1_xmit0      : out std_logic;
    n_ff1_xmit0      : out std_logic;
    p_ff1_recv0      : in  std_logic;
    n_ff1_recv0      : in  std_logic;
              
    
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
  signal error_PRMEMC : std_logic_vector(7 downto 0) := (others => std_logic' ('1'));
  signal pass_PRMEMC : std_logic_vector(7 downto 0) := (others => std_logic' ('1'));
  signal FM_L5L6XX_dataarray_data_V_dout:FM_data_array(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_dout: FM_data_array(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_enb : std_logic_vector(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_enb : std_logic_vector(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_dout_emulation :FM_data_array(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_dout_emulation: FM_data_array(3 downto 0);
  signal FM_L5L6XX_dataarray_data_V_enb_emulation : std_logic_vector(3 downto 0);
  signal FM_L1L2XX_dataarray_data_V_enb_emulation : std_logic_vector(3 downto 0);
  
  
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


  led_blue <= std_logic' ('0') when (unsigned(FM_L1L2XX_dataarray_data_V_dout(0)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout(1)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout(2)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout(3)) = to_unsigned(0,45)) and  (unsigned(FM_L1L2XX_dataarray_data_V_dout_emulation(0)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout_emulation(1)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout_emulation(2)) = to_unsigned(0,45) and unsigned(FM_L1L2XX_dataarray_data_V_dout_emulation(3)) = to_unsigned(0,45))else std_logic' ('1');
  
  led_red <= std_logic' ('0') when (unsigned(FM_L5L6XX_dataarray_data_V_dout(0)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout(1)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout(2)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout(3)) = to_unsigned(0,45)) and (unsigned(FM_L5L6XX_dataarray_data_V_dout_emulation(0)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout_emulation(1)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout_emulation(2)) = to_unsigned(0,45) and unsigned(FM_L5L6XX_dataarray_data_V_dout_emulation(3)) = to_unsigned(0,45)) else std_logic' ('1');
  led_green <= std_logic' ('1') when FM_L1L2XX_dataarray_data_V_enb = "0000" and FM_L5L6XX_dataarray_data_V_enb = "0000" else std_logic' ('0');
  
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
      VIRTEX_TCDS_DRP_araddr                     => local_AXI_ReadMOSI(0).address,
      VIRTEX_TCDS_DRP_arprot                     => local_AXI_ReadMOSI(0).protection_type,
      VIRTEX_TCDS_DRP_arready(0)                 => local_AXI_ReadMISO(0).ready_for_address,
      VIRTEX_TCDS_DRP_arvalid(0)                 => local_AXI_ReadMOSI(0).address_valid,
      VIRTEX_TCDS_DRP_awaddr                     => local_AXI_WriteMOSI(0).address,
      VIRTEX_TCDS_DRP_awprot                     => local_AXI_WriteMOSI(0).protection_type,
      VIRTEX_TCDS_DRP_awready(0)                 => local_AXI_WriteMISO(0).ready_for_address,
      VIRTEX_TCDS_DRP_awvalid(0)                 => local_AXI_WriteMOSI(0).address_valid,
      VIRTEX_TCDS_DRP_bready(0)                  => local_AXI_WriteMOSI(0).ready_for_response,
      VIRTEX_TCDS_DRP_bresp                      => local_AXI_WriteMISO(0).response,
      VIRTEX_TCDS_DRP_bvalid(0)                  => local_AXI_WriteMISO(0).response_valid,
      VIRTEX_TCDS_DRP_rdata                      => local_AXI_ReadMISO(0).data,
      VIRTEX_TCDS_DRP_rready(0)                  => local_AXI_ReadMOSI(0).ready_for_data,
      VIRTEX_TCDS_DRP_rresp                      => local_AXI_ReadMISO(0).response,
      VIRTEX_TCDS_DRP_rvalid(0)                  => local_AXI_ReadMISO(0).data_valid,
      VIRTEX_TCDS_DRP_wdata                      => local_AXI_WriteMOSI(0).data,
      VIRTEX_TCDS_DRP_wready(0)                  => local_AXI_WriteMISO(0).ready_for_data,
      VIRTEX_TCDS_DRP_wstrb                      => local_AXI_WriteMOSI(0).data_write_strobe,
      VIRTEX_TCDS_DRP_wvalid(0)                  => local_AXI_WriteMOSI(0).data_valid,
      VIRTEX_TCDS_araddr                         => local_AXI_ReadMOSI(1).address,
      VIRTEX_TCDS_arprot                         => local_AXI_ReadMOSI(1).protection_type,
      VIRTEX_TCDS_arready(0)                     => local_AXI_ReadMISO(1).ready_for_address,
      VIRTEX_TCDS_arvalid(0)                     => local_AXI_ReadMOSI(1).address_valid,
      VIRTEX_TCDS_awaddr                         => local_AXI_WriteMOSI(1).address,
      VIRTEX_TCDS_awprot                         => local_AXI_WriteMOSI(1).protection_type,
      VIRTEX_TCDS_awready(0)                     => local_AXI_WriteMISO(1).ready_for_address,
      VIRTEX_TCDS_awvalid(0)                     => local_AXI_WriteMOSI(1).address_valid,
      VIRTEX_TCDS_bready(0)                      => local_AXI_WriteMOSI(1).ready_for_response,
      VIRTEX_TCDS_bresp                          => local_AXI_WriteMISO(1).response,
      VIRTEX_TCDS_bvalid(0)                      => local_AXI_WriteMISO(1).response_valid,
      VIRTEX_TCDS_rdata                          => local_AXI_ReadMISO(1).data,
      VIRTEX_TCDS_rready(0)                      => local_AXI_ReadMOSI(1).ready_for_data,
      VIRTEX_TCDS_rresp                          => local_AXI_ReadMISO(1).response,
      VIRTEX_TCDS_rvalid(0)                      => local_AXI_ReadMISO(1).data_valid,
      VIRTEX_TCDS_wdata                          => local_AXI_WriteMOSI(1).data,
      VIRTEX_TCDS_wready(0)                      => local_AXI_WriteMISO(1).ready_for_data,
      VIRTEX_TCDS_wstrb                          => local_AXI_WriteMOSI(1).data_write_strobe,
      VIRTEX_TCDS_wvalid(0)                      => local_AXI_WriteMOSI(1).data_valid,
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

  TCDS_1: entity work.TCDS
    port map (
      clk_axi              => AXI_CLK,
      clk_200              => clk_200,
      reset_axi_n          => AXI_RST_N,
      readMOSI             => local_AXI_readMOSI(1),
      readMISO             => local_AXI_readMISO(1),
      writeMOSI            => local_AXI_writeMOSI(1),
      writeMISO            => local_AXI_writeMISO(1),
      DRP_readMOSI         => local_AXI_readMOSI(0),
      DRP_readMISO         => local_AXI_readMISO(0),
      DRP_writeMOSI        => local_AXI_writeMOSI(0),
      DRP_writeMISO        => local_AXI_writeMISO(0),
      refclk0_p => p_clk0_chan0,
      refclk0_n => n_clk0_chan0,
      refclk1_p => p_clk1_chan0,
      refclk1_n => n_clk1_chan0,
      tx_p     => p_ff1_xmit0,
      tx_n     => n_ff1_xmit0,
      rx_p     => p_ff1_recv0,
      rx_n     => n_ff1_recv0,
      error_PRMEMC => error_PRMEMC,
      pass_PRMEMC => pass_PRMEMC,
      TxRx_clk_sel => '0');
  
  CM_V_info_1: entity work.FW_info
    port map (
      clk_axi     => AXI_CLK,
      reset_axi_n => AXI_RST_N,
      readMOSI    => local_AXI_ReadMOSI(2),
      readMISO    => local_AXI_ReadMISO(2),
      writeMOSI   => local_AXI_WriteMOSI(2),
      writeMISO   => local_AXI_WriteMISO(2));

  
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

  PRMEMCTest: entity work.PRMEMCTest
    port map (
      clk_PRMEMC   => clk_PRMEMC,
      reset        => reset,
      pass         => pass_PRMEMC,
      error        => error_PRMEMC,
      FM_L5L6XX_dataarray_data_V_dout_out => FM_L5L6XX_dataarray_data_V_dout,
      FM_L1L2XX_dataarray_data_V_dout_out => FM_L1L2XX_dataarray_data_V_dout,
      FM_L1L2XX_dataarray_data_V_enb_out => FM_L1L2XX_dataarray_data_V_enb,
      FM_L5L6XX_dataarray_data_V_enb_out => FM_L5L6XX_dataarray_data_V_enb,
      FM_L5L6XX_dataarray_data_V_dout_emulation_out => FM_L5L6XX_dataarray_data_V_dout_emulation,
      FM_L1L2XX_dataarray_data_V_dout_emulation_out => FM_L1L2XX_dataarray_data_V_dout_emulation,
      FM_L1L2XX_dataarray_data_V_enb_emulation_out => FM_L1L2XX_dataarray_data_V_enb_emulation,
      FM_L5L6XX_dataarray_data_V_enb_emulation_out => FM_L5L6XX_dataarray_data_V_enb_emulation
);
  
end architecture structure;
