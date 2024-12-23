library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux9 is
  port (
    S       : in std_logic;
    mux_out : out STD_LOGIC_VECTOR(27 downto 0)
  );
end mux9;

architecture behavioral of mux9 is
  constant SECOND  : std_logic_vector(27 downto 0) := x"2FAF080";
  constant NANOSEC : std_logic_vector(27 downto 0) := x"0000004";
  signal insignal  : std_logic_vector(27 downto 0);

begin
  sel_mux : process (S)
  begin
    case S is
      when '0'    => insignal    <= NANOSEC;
      when others => insignal <= SECOND;
    end case;
  end process;
  mux_out <= insignal;
end behavioral;