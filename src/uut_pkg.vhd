library IEEE;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
              
package uut_pkg is
  type VMSME_nentries_array is array (7 downto 0) of std_logic_vector(4 downto 0);
  type VMSME_writeaddr_array is array (7 downto 0) of std_logic_vector(7 downto 0);
  type VMSME_readaddr_array is array (7 downto 0) of std_logic_vector(8 downto 0);
  type VMSME_data_array is array (7 downto 0) of std_logic_vector(13 downto 0);
  type VMPROJ_data_array is array (7 downto 0) of std_logic_vector(20 downto 0);
  type bx_array is array (7 downto 0) of std_logic_vector(2 downto 0);
  type array8_4 is array (7 downto 0) of std_logic_vector(3 downto 0);
  type array8_7 is array (7 downto 0) of std_logic_vector(6 downto 0);
  type array8_8 is array (7 downto 0) of std_logic_vector(7 downto 0);
  type array8_14 is array (7 downto 0) of std_logic_vector(13 downto 0);
  type array8_21 is array (7 downto 0) of std_logic_vector(20 downto 0);
end package;
