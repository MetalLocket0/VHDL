library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity lab10 is
  port (
    clk                                                   : in std_logic;
    reset                                                 : in std_logic;
    dime_in, nickel_in, quarter_in, coin_return, dispense : in std_logic;
    change_back, red_bull                                 : out std_logic;
    HEX0, HEX1                                            : out std_logic_vector(6 downto 0) -- max 99 cents visually
  );
end entity;

architecture technique of lab10 is
  type state_type is (wait1, dime, nickel, quarter, enough, excess, vend, change);
  signal state, next_state : state_type;
  signal money             : unsigned(6 downto 0); -- max 127 cents 
  signal tens_dig          : unsigned(6 downto 0);
  signal ones_dig          : unsigned(6 downto 0);
  constant ZERO            : std_logic_vector(6 downto 0) := "1000000";
  constant ONE             : std_logic_vector(6 downto 0) := "1111001";
  constant TWO             : std_logic_vector(6 downto 0) := "0100100";
  constant THREE           : std_logic_vector(6 downto 0) := "0110000";
  constant FOUR            : std_logic_vector(6 downto 0) := "0011001";
  constant FIVE            : std_logic_vector(6 downto 0) := "0010010";
  constant SIX             : std_logic_vector(6 downto 0) := "0000010";
  constant SEVEN           : std_logic_vector(6 downto 0) := "1111000";
  constant EIGHT           : std_logic_vector(6 downto 0) := "0000000";
  constant NINE            : std_logic_vector(6 downto 0) := "0011000";
  constant BLANK           : std_logic_vector(6 downto 0) := "1111111";
begin

  sync : process (clk, reset)
  begin
    if (reset = '0') then
      state <= wait1;
    elsif rising_edge(clk) then
      state <= next_state;
    end if;
  end process;

  comb : process (state, quarter_in, dime_in, nickel_in, money, coin_return, dispense)
  begin
    case(state) is
      when wait1 =>
      if (quarter_in = '1') then
        next_state <= quarter;
      elsif (nickel_in = '1') then
        next_state <= nickel;
      elsif (dime_in = '1') then
        next_state <= dime;
      elsif (coin_return = '1') then
        next_state <= change;
      else
        next_state <= wait1;
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
      if (dispense = '1') then
        next_state <= vend;
      elsif (dime_in = '1' or nickel_in = '1' or quarter_in = '1') then
        next_state <= excess;
      elsif (coin_return = '1') then
        next_state <= change;
      else
        next_state <= enough;
      end if;

      when excess =>
      if (dime_in = '1' or nickel_in = '1' or quarter_in = '1') then
        next_state <= excess;
      elsif (dispense = '1') then
        next_state <= vend;
      elsif (coin_return = '1') then
        next_state <= change;
      else
        next_state <= enough;
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

  total : process (clk, reset, state)
  begin

    if (reset = '0') then
      money <= "0000000";
    elsif (rising_edge(clk)) then
      case(state) is

        when wait1 =>
        money <= money;

        when dime =>
        money <= (money + "0001010"); -- 10

        when nickel =>
        money <= (money + "0000101"); -- 5

        when quarter =>
        money <= (money + "0001001"); -- 25

        when enough =>
        money <= money;

        when excess =>
        money <= money;

        when vend =>
        money <= (money - "1001011"); --75

        when change =>
        money <= "0000000";

        when others =>
        money <= money;
      end case;
    end if;
  end process;

  red_bull_out : process (state)
  begin
    if (state = vend) then
      red_bull <= '1';
    else
      red_bull <= '0';
    end if;
  end process;

  change_out : process (state)
  begin
    if (state = excess or state = change) then
      change_back <= '1';
    else
      change_back <= '0';
    end if;
  end process;

  tens_dig <= ((money rem 100) / 10);
  ones_dig <= (money rem 10);

  process (tens_dig, ones_dig)
  begin

    case tens_dig is
      when "0000000" => HEX1 <= ZERO;
      when "0000001" => HEX1 <= ONE;
      when "0000010" => HEX1 <= TWO;
      when "0000011" => HEX1 <= THREE;
      when "0000100" => HEX1 <= FOUR;
      when "0000101" => HEX1 <= FIVE;
      when "0000110" => HEX1 <= SIX;
      when "0000111" => HEX1 <= SEVEN;
      when "0001000" => HEX1 <= EIGHT;
      when "0001001" => HEX1 <= NINE;
      when others    => HEX1    <= BLANK;
    end case;

    case ones_dig is
      when "0000000" => HEX0 <= ZERO;
      when "0000001" => HEX0 <= ONE;
      when "0000010" => HEX0 <= TWO;
      when "0000011" => HEX0 <= THREE;
      when "0000100" => HEX0 <= FOUR;
      when "0000101" => HEX0 <= FIVE;
      when "0000110" => HEX0 <= SIX;
      when "0000111" => HEX0 <= SEVEN;
      when "0001000" => HEX0 <= EIGHT;
      when "0001001" => HEX0 <= NINE;
      when others    => HEX0    <= BLANK;
    end case;
  end process;
end architecture;