library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axiRegPkg.all;
use work.types.all;

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

  constant localAXISlaves    : integer := 3;
  signal local_AXI_ReadMOSI  :  AXIReadMOSI_array_t(0 to localAXISlaves-1);
  signal local_AXI_ReadMISO  :  AXIReadMISO_array_t(0 to localAXISlaves-1);
  signal local_AXI_WriteMOSI : AXIWriteMOSI_array_t(0 to localAXISlaves-1);
  signal local_AXI_WriteMISO : AXIWriteMISO_array_t(0 to localAXISlaves-1);
  signal AXI_CLK             : std_logic;
  signal AXI_RST_N           : std_logic;

  signal debug : std_logic_vector(2 downto 0);

  signal myreg1_test_vector : std_logic_vector(31 downto 0);
  signal myreg2_test_vector : std_logic_vector(31 downto 0);
  
begin  -- architecture structure

  --Clocking
  reset <= not locked_clk200;
  Local_Clocking_1: entity work.Local_Clocking
    port map (
      clk_200   => clk_200,
      clk_50    => clk_50,
      clk_axi   => AXI_CLK,
      reset     => '0',
      locked    => locked_clk200,
      clk_in1_p => p_clk_200a,
      clk_in1_n => n_clk_200a);

  led_blue  <= led_blue_local;
  led_red   <= led_red_local;
  led_green <= led_green_local;
  
  counter_proc: process (clk_200) is
  begin  -- process counter_proc
    if clk_200'event and clk_200 = '1' then  -- rising clock edge
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
      MYVREG0_arready           => local_AXI_ReadMISO(0).ready_for_address,    
      MYVREG0_arvalid           => local_AXI_ReadMOSI(0).address_valid,        
      MYVREG0_awaddr            => local_AXI_WriteMOSI(0).address,             
      MYVREG0_awprot            => local_AXI_WriteMOSI(0).protection_type,     
      MYVREG0_awready           => local_AXI_WriteMISO(0).ready_for_address,   
      MYVREG0_awvalid           => local_AXI_WriteMOSI(0).address_valid,       
      MYVREG0_bready            => local_AXI_WriteMOSI(0).ready_for_response,  
      MYVREG0_bresp             => local_AXI_WriteMISO(0).response,            
      MYVREG0_bvalid            => local_AXI_WriteMISO(0).response_valid,      
      MYVREG0_rdata             => local_AXI_ReadMISO(0).data,                 
      MYVREG0_rready            => local_AXI_ReadMOSI(0).ready_for_data,       
      MYVREG0_rresp             => local_AXI_ReadMISO(0).response,             
      MYVREG0_rvalid            => local_AXI_ReadMISO(0).data_valid,           
      MYVREG0_wdata             => local_AXI_WriteMOSI(0).data,                
      MYVREG0_wready            => local_AXI_WriteMISO(0).ready_for_data,       
      MYVREG0_wstrb             => local_AXI_WriteMOSI(0).data_write_strobe,   
      MYVREG0_wvalid            => local_AXI_WriteMOSI(0).data_valid,          
      MYVREG1_araddr            => local_AXI_ReadMOSI(1).address,              
      MYVREG1_arprot            => local_AXI_ReadMOSI(1).protection_type,      
      MYVREG1_arready           => local_AXI_ReadMISO(1).ready_for_address,    
      MYVREG1_arvalid           => local_AXI_ReadMOSI(1).address_valid,        
      MYVREG1_awaddr            => local_AXI_WriteMOSI(1).address,             
      MYVREG1_awprot            => local_AXI_WriteMOSI(1).protection_type,     
      MYVREG1_awready           => local_AXI_WriteMISO(1).ready_for_address,   
      MYVREG1_awvalid           => local_AXI_WriteMOSI(1).address_valid,       
      MYVREG1_bready            => local_AXI_WriteMOSI(1).ready_for_response,  
      MYVREG1_bresp             => local_AXI_WriteMISO(1).response,            
      MYVREG1_bvalid            => local_AXI_WriteMISO(1).response_valid,      
      MYVREG1_rdata             => local_AXI_ReadMISO(1).data,                 
      MYVREG1_rready            => local_AXI_ReadMOSI(1).ready_for_data,       
      MYVREG1_rresp             => local_AXI_ReadMISO(1).response,             
      MYVREG1_rvalid            => local_AXI_ReadMISO(1).data_valid,           
      MYVREG1_wdata             => local_AXI_WriteMOSI(1).data,                
      MYVREG1_wready            => local_AXI_WriteMISO(1).ready_for_data,       
      MYVREG1_wstrb             => local_AXI_WriteMOSI(1).data_write_strobe,   
      MYVREG1_wvalid            => local_AXI_WriteMOSI(1).data_valid,
      CM_V_INFO_araddr            => local_AXI_ReadMOSI(2).address,              
      CM_V_INFO_arprot            => local_AXI_ReadMOSI(2).protection_type,      
      CM_V_INFO_arready           => local_AXI_ReadMISO(2).ready_for_address,    
      CM_V_INFO_arvalid           => local_AXI_ReadMOSI(2).address_valid,        
      CM_V_INFO_awaddr            => local_AXI_WriteMOSI(2).address,             
      CM_V_INFO_awprot            => local_AXI_WriteMOSI(2).protection_type,     
      CM_V_INFO_awready           => local_AXI_WriteMISO(2).ready_for_address,   
      CM_V_INFO_awvalid           => local_AXI_WriteMOSI(2).address_valid,       
      CM_V_INFO_bready            => local_AXI_WriteMOSI(2).ready_for_response,  
      CM_V_INFO_bresp             => local_AXI_WriteMISO(2).response,            
      CM_V_INFO_bvalid            => local_AXI_WriteMISO(2).response_valid,      
      CM_V_INFO_rdata             => local_AXI_ReadMISO(2).data,                 
      CM_V_INFO_rready            => local_AXI_ReadMOSI(2).ready_for_data,       
      CM_V_INFO_rresp             => local_AXI_ReadMISO(2).response,             
      CM_V_INFO_rvalid            => local_AXI_ReadMISO(2).data_valid,           
      CM_V_INFO_wdata             => local_AXI_WriteMOSI(2).data,                
      CM_V_INFO_wready            => local_AXI_WriteMISO(2).ready_for_data,       
      CM_V_INFO_wstrb             => local_AXI_WriteMOSI(2).data_write_strobe,   
      CM_V_INFO_wvalid            => local_AXI_WriteMOSI(2).data_valid,          

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
      C2CLink_phy_power_down              => '0', 
      C2CLink_phy_soft_err                => open,
      VIRTEX_SYS_MGMT_sda                 => v_fpga_i2c_sda,
      VIRTEX_SYS_MGMT_scl                 => v_fpga_i2c_scl,
      BRAM_PORTB_0_addr( 7 downto  0)     => myreg2_test_vector( 7 downto  0),
      BRAM_PORTB_0_addr(31 downto  8)     => x"000000",
      BRAM_PORTB_0_clk                    => AXI_CLK,
      BRAM_PORTB_0_din(15 downto  0)      => myreg2_test_vector(23 downto  8),
      BRAM_PORTB_0_din(31 downto 16)      => x"0000",
      BRAM_PORTB_0_dout                   => open,
      BRAM_PORTB_0_en                     => '1',
      BRAM_PORTB_0_rst                    => '0',
      BRAM_PORTB_0_we                     => myreg2_test_vector(27 downto 24)

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
  
end architecture structure;
