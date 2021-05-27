library IEEE;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
              
package uut_pkg is
  type VMSME_nentries_array is array (7 downto 0) of std_logic_vector(4 downto 0);
  type VMSME_writeaddr_array is array (7 downto 0) of std_logic_vector(7 downto 0);
  type VMSME_readaddr_array is array (7 downto 0) of std_logic_vector(8 downto 0);
  type VMSME_data_array is array (7 downto 0) of std_logic_vector(13 downto 0);
--  type VMPROJ_data_array is array (7 downto 0) of std_logic_vector(20 downto 0);
  type VMSME_4PHI_nentries_array is array (3 downto 0) of VMSME_nentries_array;
  type VMSME_4PHI_nentries_we_array is array (3 downto 0) of std_logic_vector(7 downto 0);
  type VMSME_4PHI_writeaddr_array is array (3 downto 0) of VMSME_writeaddr_array;
  type VMSME_4PHI_readaddr_array is array (3 downto 0) of VMSME_readaddr_array;
  type VMSME_4PHI_data_array is array (3 downto 0) of VMSME_data_array;
  type VMSME_4PHI_data_wea_array is array (3 downto 0) of std_logic_vector(7 downto 0);
  type VMPROJ_data_array is array (integer range <>) of std_logic_vector(20 downto 0);
  type TPROJ_nentries_array is array(integer range <>) of std_logic_vector(7 downto 0);
  type TPROJ_data_addr_array is array(integer range <>) of std_logic_vector(7 downto 0);
  type TPROJ_data_array is array(integer range <>) of std_logic_vector(59 downto 0);
  type TPROJ_4PHI_nentries_array is array (3 downto 0) of TPROJ_nentries_array(8 downto 0);
  type TPROJ_4PHI_data_addr_array is array (3 downto 0) of TPROJ_data_addr_array(8 downto 0);
  type TPROJ_4PHI_nentries_we_array is array (3 downto 0) of std_logic_vector(8 downto 0);
  type TPROJ_4PHI_data_array is array (3 downto 0) of TPROJ_data_array(8 downto 0);
  
  type Map_array is array(integer range <>) of string;
  type Integer_array is array(integer range <>) of integer;
  type TPROJ_Map_array is array(0 to 3) of Map_array(8 downto 0);

  type AS_data_addr_array is array(integer range <>) of std_logic_vector(9 downto 0);
  type AS_data_array is array(integer range <>) of std_logic_vector(35 downto 0);
  type AS_nentries_array is array(integer range <>) of std_logic_vector(7 downto 0);

  type FM_data_addr_array is array(integer range <>) of std_logic_vector(7 downto 0);
  type FM_data_array is array(integer range <>) of std_logic_vector(44 downto 0);
  type FM_nentries_array is array(integer range <>) of std_logic_vector(7 downto 0); 

  type bx_mc_array is array (3 downto 0) of std_logic_vector(2 downto 0);
  type bx_array is array (7 downto 0) of std_logic_vector(2 downto 0);
  type array8_4 is array (7 downto 0) of std_logic_vector(3 downto 0);
  type array8_7 is array (7 downto 0) of std_logic_vector(6 downto 0);
  type array8_8 is array (7 downto 0) of std_logic_vector(7 downto 0);
  type array8_14 is array (7 downto 0) of std_logic_vector(13 downto 0);
  type array8_21 is array (7 downto 0) of std_logic_vector(20 downto 0);
end package;
