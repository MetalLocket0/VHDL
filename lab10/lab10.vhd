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
  signal money             : std_logic_vector(6 downto 0); -- max 127 cents 
begin

  sync : process (clk, reset_n)
  begin
    if (reset = '0') then
      state <= wait1;
    elsif rising_edge(clk) then
      state <= next_state;
    end if;
  end process;

  comb : process (state,)
  begin
    case(state) is
      when wait1 =>
      if (state = wait1) then
        next_state <= wait1;
      elsif (quarter_in = '1') then
        next_state <= quarter;
      elsif (nickel_in = '1') then
        next_state <= nickel;
      elsif (dime_in = '1') then
        next_state <= dime;
      elsif (coin_return = '1') then
        next_state <= change;
      end if;

      when quarter =>
      if (money < "1001011") then -- 75 cents
        next_state <= wait1;
      elsif (money >= "1001011") then
        next_state <= enough;
      end if;

      when nickel =>
      if (money < "1001011") then -- 75 cents
        next_state <= wait1;
      elsif (money >= "1001011") then
        next_state <= enough;
      end if;

      when dime =>
      if (money < "1001011") then -- 75 cents
        next_state <= wait1;
      elsif (money >= "1001011") then
        next_state <= enough;
      end if;

      when change =>
      next_state <= wait1;

      when enough =>
      if (state = enough) then
        next_state <= enough;
      elsif (dispense = '1') then
        next_state <= vend;
      elsif (dime_in or nickel_in or quarter_in = '1') then
        next_state <= excess;
      elsif (coin_return = '1') then
        next_state <= change;
      end if;

      when excess =>
      if (state = excess) then
        next_state <= enough;
      elsif (dime_in or nickel_in or _quarter in = '1') then
        next_state <= excess;
      elsif (dispense = '1') then
        next_state <= vend;
      elsif (coin_return = '1') then
        next_state <= change;
      end if;

      when vend =>
      if (money > "0000000") then
        next_state <= change;
      elsif (state = vend) then
        next_state <= wait1;
      end if;

      when others =>
      next_state <= wait1;
    end case;
  end process;

  total : process (clk, state)
  begin

  end process;

end architecture;