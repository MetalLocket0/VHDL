library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter8 is
  port (
    clk, set_n, enable, reset_n : in std_logic;
    time_in                     : in std_logic_vector(9 downto 0);
    count_out                   : out std_logic_vector(9 downto 0));
end counter8;

architecture counting of counter8 is
  signal int_count : UNSIGNED(9 downto 0);
  constant MAX_VAL : UNSIGNED(9 downto 0) := "1111100111";
begin
  process (clk)
  begin
    if (clk = '1') then
      if (reset_n = '0') then
        int_count <= "0000000000";
      elsif (int_count = MAX_VAL) then
        int_count <= "0000000000";
      end if;
    end if;
  end if;
end process;
process (clk)
begin
  if (clk = '1') then
    if (reset_n = '0') then
      int_count <= "0000000000";
    elsif (enable = '1') then
      int_count <= int_count + "0000000001";
    elsif (set_n = '1') then
        int_count <= time_in;
    end if;
    end if;
  end process;
  count_out <= std_logic_vector(int_count);
end counting;