library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab7 is
  port (
    ain, bin                           : in std_logic_vector(3 downto 0);
    opin                               : in std_logic_vector(1 downto 0);
    hexout0, hexout1, hexout2, hexout3 : out std_logic_vector(6 downto 0));
end lab7;

architecture Behavioral of lab7 is

  component lab6 is
    port (
      In_num : in std_logic_vector(7 downto 0);
      HEX3   : out std_logic_vector(6 downto 0);
      HEX2   : out std_logic_vector(6 downto 0);
      HEX1   : out std_logic_vector(6 downto 0);
      HEX0   : out std_logic_vector(6 downto 0)
    );
  end component;

  component lab5 is
    port (
      A  : in std_logic_vector(3 downto 0);
      B  : in std_logic_vector(3 downto 0);
      OP : in std_logic_vector(1 downto 0);
      R  : out std_logic_vector(7 downto 0)

    );
  end component;
  signal rin : std_logic_vector(7 downto 0);
begin
  U1 : lab5
  port map
    (A => ain, B => bin, OP => opin, R => rin);

  U2 : lab6
  port map
  (In_num => rin, HEX3 => hexout3, HEX2 => hexout2, HEX1 => hexout1, HEX0 => hexout0); 
  end Behavioral;