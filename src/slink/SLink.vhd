library ieee;
use ieee.std_logic_1164.all;
use work.axiRegPkg.all;
use work.V_SLINK_Ctrl.all;

entity SLink is
  
  port (
    clk_axi              : in  std_logic; --50 MHz
    reset_axi_n          : in  std_logic;
    readMOSI             : in  AXIreadMOSI;
    readMISO             : out AXIreadMISO;
    writeMOSI            : in  AXIwriteMOSI;
    writeMISO            : out AXIwriteMISO);  
end entity SLink;

architecture behavioral of SLink is

  signal Mon : V_SLINK_Mon_t;
  signal Ctrl : V_SLINK_Ctrl_t;

begin  -- architecture behavioral

  --Axi to local record bridge
  V_SLINK_interface_1: entity work.V_SLINK_interface
    port map (
      clk_axi         => clk_axi,
      reset_axi_n     => reset_axi_n,
      slave_readMOSI  => readMOSI,
      slave_readMISO  => readMISO,
      slave_writeMOSI => writeMOSI,
      slave_writeMISO => writeMISO,
      Mon             => Mon,
      Ctrl            => Ctrl);

  --set monitor values
  Mon.CMMD_REG_r                 <= x"deadbeef";
  Mon.FNCT_REG_r                 <= x"deadbeef";
  Mon.CFFS_REG_r                 <= x"deadbeef";
  Mon.RDAT_REG                   <= x"deadbeef";
  Mon.SND_CH0_SD_STAT_REG        <= x"deadbeef";
  Mon.SND_CH1_SD_STAT_REG        <= x"deadbeef";
  Mon.SND_CH2_SD_STAT_REG        <= x"deadbeef";
  Mon.SND_CH3_SD_STAT_REG        <= x"deadbeef";
  Mon.RCV_CH0_SD_STAT_REG        <= x"deadbeef";
  Mon.RCV_CH1_SD_STAT_REG        <= x"deadbeef";
  Mon.RCV_CH2_SD_STAT_REG        <= x"deadbeef";
  Mon.RCV_CH3_SD_STAT_REG        <= x"deadbeef";
  Mon.RCV_CH0_PCKT_CNT_REG       <= x"deadbeef";
  Mon.RCV_CH1_PCKT_CNT_REG       <= x"deadbeef";
  Mon.RCV_CH2_PCKT_CNT_REG       <= x"deadbeef";
  Mon.RCV_CH3_PCKT_CNT_REG       <= x"deadbeef";
  Mon.CNT0_REG                   <= x"deadbeef";
  Mon.CNT1_REG                   <= x"deadbeef";
  Mon.CNT2_REG                   <= x"deadbeef";
  Mon.CNT3_REG                   <= x"deadbeef";
  Mon.CNT4_REG                   <= Ctrl.CMMD_REG;
  Mon.CNT5_REG                   <= Ctrl.FNCT_REG;
  Mon.CNT6_REG                   <= Ctrl.CFFS_REG;
  Mon.CNT7_REG                   <= Ctrl.WDAT_REG;

  
end architecture behavioral;
