library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delay9 is
  port (
    max_value    : in std_logic_vector(23 downto 0);
    clk, reset_n : in std_logic;
    flag         : out std_logic
  );
end delay9;

architecture delays of delay8 is
  signal count            : unsigned(23 downto 0);
  signal max_count : unsigned(23 downto 0);
  begin
  max_count <= unsigned(max_value);
  process (clk, reset_n) is
  begin
    if (reset_n = '0') then
      count <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (count = max_count) then
        count <= (others => '0');
      else
        count <= count + 1;
      end if;
    end if;
  end process;
  process (clk, reset_n) is
  begin
    if (reset_n = '0') then
      flag <= '0';

    elsif (clk'event and clk = '1') then
      if (count = max_count) then
        flag <= '1';
      else
        flag <= '0';
      end if;
    end if;
  end process;
end delays;