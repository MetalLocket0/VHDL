library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8 is
  port (
    S    : in std_logic;
    flag : out std_logic_vector(23 downto 0));
end mux8;

architecture behavioral of mux8 is
  constant MILISEC : std_logic_vector(23 downto 0) := x"4C4B3F";
  constant NANOSEC : std_logic_vector(7 downto 0)  := "00000100";
  signal insignal  : std_logic_vector(23 downto 0);

begin
  sel_mux : process (S)
  begin
    case S is
      when '0'     => insignal     <= NANOSEC(7 downto 0);
      when (others => insignal <= MILISEC(7 downto 0));
    end case;
  end process;
end behavioral;
