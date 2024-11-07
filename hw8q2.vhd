library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity hw8q2 is
  port (
    clk, reset_n, load : in std_logic;
    serial_in          : in std_logic;
    serial_out         : out std_logic;
    parallel_in        : in std_logic_vector(15 downto 0);
    parallel_out       : out std_logic_vector(15 downto 0);
    r                  : in std_logic
  );
end hw8q2;

architecture rtl of hw8q2 is
  signal shift : std_logic_vector(15 downto 0);
begin

  shifter : process (clk, reset_n)
  begin
    if (reset_n = '0') then
      shift <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (load = '0') then
        shift <= parallel_in;
      else
        if (r = '1') then
          serial_out         <= shift(15);
          shift(15 downto 1) <= shift(14 downto 0); --shift to the right
          shift(0)           <= serial_in;

        else
          serial_out         <= shift(0);
          shift(14 downto 0) <= shift(15 downto 1); --shift to the left
          shift(15)          <= serial_in;
        end if;
      end if;
    end if;
  end if;

end process;
parallel_out <= shift;

if (r = '1') then
  serial_out <= shift(15);
else
  serial_out <= shift(0);
end if;
end architecture;