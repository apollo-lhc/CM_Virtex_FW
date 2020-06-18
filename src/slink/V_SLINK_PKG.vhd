--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package V_SLINK_CTRL is
  type V_SLINK_MON_t is record
    CMMD_REG_r                 :std_logic_vector(31 downto 0);
    FNCT_REG_r                 :std_logic_vector(31 downto 0);
    CFFS_REG_r                 :std_logic_vector(31 downto 0);
    RDAT_REG                   :std_logic_vector(31 downto 0);
    SND_CH0_SD_STAT_REG        :std_logic_vector(31 downto 0);
    SND_CH1_SD_STAT_REG        :std_logic_vector(31 downto 0);
    SND_CH2_SD_STAT_REG        :std_logic_vector(31 downto 0);
    SND_CH3_SD_STAT_REG        :std_logic_vector(31 downto 0);
    RCV_CH0_SD_STAT_REG        :std_logic_vector(31 downto 0);
    RCV_CH1_SD_STAT_REG        :std_logic_vector(31 downto 0);
    RCV_CH2_SD_STAT_REG        :std_logic_vector(31 downto 0);
    RCV_CH3_SD_STAT_REG        :std_logic_vector(31 downto 0);
    RCV_CH0_PCKT_CNT_REG       :std_logic_vector(31 downto 0);
    RCV_CH1_PCKT_CNT_REG       :std_logic_vector(31 downto 0);
    RCV_CH2_PCKT_CNT_REG       :std_logic_vector(31 downto 0);
    RCV_CH3_PCKT_CNT_REG       :std_logic_vector(31 downto 0);
    CNT0_REG                   :std_logic_vector(31 downto 0);
    CNT1_REG                   :std_logic_vector(31 downto 0);
    CNT2_REG                   :std_logic_vector(31 downto 0);
    CNT3_REG                   :std_logic_vector(31 downto 0);
    CNT4_REG                   :std_logic_vector(31 downto 0);
    CNT5_REG                   :std_logic_vector(31 downto 0);
    CNT6_REG                   :std_logic_vector(31 downto 0);
    CNT7_REG                   :std_logic_vector(31 downto 0);
  end record V_SLINK_MON_t;


  type V_SLINK_CTRL_t is record
    CMMD_REG                   :std_logic_vector(31 downto 0);
    FNCT_REG                   :std_logic_vector(31 downto 0);
    CFFS_REG                   :std_logic_vector(31 downto 0);
    WDAT_REG                   :std_logic_vector(31 downto 0);
  end record V_SLINK_CTRL_t;


  constant DEFAULT_V_SLINK_CTRL_t : V_SLINK_CTRL_t := (
                                                       FNCT_REG => (others => '0'),
                                                       CMMD_REG => (others => '0'),
                                                       CFFS_REG => (others => '0'),
                                                       WDAT_REG => (others => '0')
                                                      );


end package V_SLINK_CTRL;