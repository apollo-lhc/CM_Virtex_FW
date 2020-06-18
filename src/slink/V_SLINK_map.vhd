--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.V_SLINK_Ctrl.all;
entity V_SLINK_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  V_SLINK_Mon_t;
    Ctrl             : out V_SLINK_Ctrl_t
    );
end entity V_SLINK_interface;
architecture behavioral of V_SLINK_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 39);
  constant Default_reg_data : slv32_array_t(integer range 0 to 39) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteReg
    port map (
      clk_axi     => clk_axi,
      reset_axi_n => reset_axi_n,
      readMOSI    => slave_readMOSI,
      readMISO    => slave_readMISO,
      writeMOSI   => slave_writeMOSI,
      writeMISO   => slave_writeMISO,
      address     => localAddress,
      rd_data     => localRdData_latch,
      wr_data     => localWrData,
      write_en    => localWrEn,
      read_req    => localRdReq,
      read_ack    => localRdAck);

  latch_reads: process (clk_axi) is
  begin  -- process latch_reads
    if clk_axi'event and clk_axi = '1' then  -- rising clock edge
      if localRdReq = '1' then
        localRdData_latch <= localRdData;        
      end if;
    end if;
  end process latch_reads;
  reads: process (localRdReq,localAddress,reg_data) is
  begin  -- process reads
    localRdAck  <= '0';
    localRdData <= x"00000000";
    if localRdReq = '1' then
      localRdAck  <= '1';
      case to_integer(unsigned(localAddress(5 downto 0))) is

        when 0 => --0x0
          localRdData(31 downto  0)  <=  reg_data( 0)(31 downto  0);      --
        when 1 => --0x1
          localRdData(31 downto  0)  <=  reg_data( 1)(31 downto  0);      --
        when 2 => --0x2
          localRdData(31 downto  0)  <=  reg_data( 2)(31 downto  0);      --
        when 3 => --0x3
          localRdData(31 downto  0)  <=  reg_data( 3)(31 downto  0);      --
        when 4 => --0x4
          localRdData(31 downto  0)  <=  Mon.CMMD_REG_r;                  --
        when 5 => --0x5
          localRdData(31 downto  0)  <=  Mon.FNCT_REG_r;                  --
        when 6 => --0x6
          localRdData(31 downto  0)  <=  Mon.CFFS_REG_r;                  --
        when 7 => --0x7
          localRdData(31 downto  0)  <=  Mon.RDAT_REG;                    --
        when 8 => --0x8
          localRdData(31 downto  0)  <=  Mon.SND_CH0_SD_STAT_REG;         --
        when 9 => --0x9
          localRdData(31 downto  0)  <=  Mon.SND_CH1_SD_STAT_REG;         --
        when 16 => --0x10
          localRdData(31 downto  0)  <=  Mon.SND_CH2_SD_STAT_REG;         --
        when 17 => --0x11
          localRdData(31 downto  0)  <=  Mon.SND_CH3_SD_STAT_REG;         --
        when 18 => --0x12
          localRdData(31 downto  0)  <=  Mon.RCV_CH0_SD_STAT_REG;         --
        when 19 => --0x13
          localRdData(31 downto  0)  <=  Mon.RCV_CH1_SD_STAT_REG;         --
        when 20 => --0x14
          localRdData(31 downto  0)  <=  Mon.RCV_CH2_SD_STAT_REG;         --
        when 21 => --0x15
          localRdData(31 downto  0)  <=  Mon.RCV_CH3_SD_STAT_REG;         --
        when 22 => --0x16
          localRdData(31 downto  0)  <=  Mon.RCV_CH0_PCKT_CNT_REG;        --
        when 23 => --0x17
          localRdData(31 downto  0)  <=  Mon.RCV_CH1_PCKT_CNT_REG;        --
        when 24 => --0x18
          localRdData(31 downto  0)  <=  Mon.RCV_CH2_PCKT_CNT_REG;        --
        when 25 => --0x19
          localRdData(31 downto  0)  <=  Mon.RCV_CH3_PCKT_CNT_REG;        --
        when 32 => --0x20
          localRdData(31 downto  0)  <=  Mon.CNT0_REG;                    --
        when 33 => --0x21
          localRdData(31 downto  0)  <=  Mon.CNT1_REG;                    --
        when 34 => --0x22
          localRdData(31 downto  0)  <=  Mon.CNT2_REG;                    --
        when 35 => --0x23
          localRdData(31 downto  0)  <=  Mon.CNT3_REG;                    --
        when 36 => --0x24
          localRdData(31 downto  0)  <=  Mon.CNT4_REG;                    --
        when 37 => --0x25
          localRdData(31 downto  0)  <=  Mon.CNT5_REG;                    --
        when 38 => --0x26
          localRdData(31 downto  0)  <=  Mon.CNT6_REG;                    --
        when 39 => --0x27
          localRdData(31 downto  0)  <=  Mon.CNT7_REG;                    --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CMMD_REG  <=  reg_data( 0)(31 downto  0);     
  Ctrl.FNCT_REG  <=  reg_data( 1)(31 downto  0);     
  Ctrl.CFFS_REG  <=  reg_data( 2)(31 downto  0);     
  Ctrl.WDAT_REG  <=  reg_data( 3)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)(31 downto  0)  <= DEFAULT_V_SLINK_CTRL_t.CMMD_REG;
      reg_data( 1)(31 downto  0)  <= DEFAULT_V_SLINK_CTRL_t.FNCT_REG;
      reg_data( 2)(31 downto  0)  <= DEFAULT_V_SLINK_CTRL_t.CFFS_REG;
      reg_data( 3)(31 downto  0)  <= DEFAULT_V_SLINK_CTRL_t.WDAT_REG;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(5 downto 0))) is
        when 0 => --0x0
          reg_data( 0)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 1 => --0x1
          reg_data( 1)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 2 => --0x2
          reg_data( 2)(31 downto  0)  <=  localWrData(31 downto  0);      --
        when 3 => --0x3
          reg_data( 3)(31 downto  0)  <=  localWrData(31 downto  0);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;