library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter9 is
  port (
    clk                          : in std_logic;
    rst                          : in std_logic;
    enable                       : in std_logic;
    HEX0, HEX1, HEX2, HEX3, HEX4 : out std_logic_vector(6 downto 0));
end shifter9;

architecture basis of shifter9 is
  signal shift   : std_logic_vector();
  constant I     : std_logic_vector(6 downto 0) := "1001111";
  constant C     : std_logic_vector(6 downto 0) := "1000110";
  constant E     : std_logic_vector(6 downto 0) := "1000110";
  constant L     : std_logic_vector(6 downto 0) := "1000111";
  constant d     : std_logic_vector(6 downto 0) := "1100001";
  constant A     : std_logic_vector(6 downto 0) := "0001000";
  constant S     : std_logic_vector(6 downto 0) := "0010010";
  constant O     : std_logic_vector(6 downto 0) := "1000000";
  constant H     : std_logic_vector(6 downto 0) := "0001001";
  constant r     : std_logic_vector(6 downto 0) := "0101111";
  constant BLANK : std_logic_vector(6 downto 0) := "1111111";
  type ssd_array_type is array (0 to 9) of std_logic_vector(6 downto 0); (0 to 23)
  constant ssd_array_c : ssd_array_type := (I, C, E

begin
  if (rst = '0') then
    shift <= (others => '0');
  elsif (rising_edge(clk)) then
    if (enable = '1') then
      shift <= ;
    else

    end if;