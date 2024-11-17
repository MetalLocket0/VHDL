library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity lab10 is
  port (
    clk                                                   : in std_logic;
    reset                                                 : in std_logic;
    dime_in, nickel_in, quarter_in, coin_return, dispense : in std_logic;
    change_back, red_bull                                 : out std_logic;
    HEX0, HEX1                                            : out std_logic_vector(6 downto 0);
  );
end entity;

architecture technique of lab10 is
  type state_type is (wait1, dime, nickel, quarter, enough, excess, vend, change);
  signal state, next_state : state_type;
begin

  sync : process (clk, reset_n)
  begin
    if (reset = '0') then
      state <= wait1;
    elsif rising_edge(clk) then
      state <= next_state;
    end if;
  end process;

  comb : process (state, )
  begin
    
  end process;

end architecture;