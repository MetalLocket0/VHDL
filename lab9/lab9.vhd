library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab9 is
  port (
    S_main, clk_main, reset_main                                     : in std_logic;
    HEX0_MAIN, HEX1_MAIN, HEX2_MAIN, HEX3_MAIN, HEX4_MAIN, HEX5_MAIN : out std_logic_vector(6 downto 0)
  );
end lab9;

architecture behavior of lab9 is
  signal s1 : std_logic_vector(27 downto 0);
  signal s2 : std_logic;

  component mux9
    port (
      S       : in std_logic;
      mux_out : out std_logic_vector(27 downto 0)
    );
  end component;

  component delay9
    port (
      max_value : in std_logic_vector(27 downto 0);
      clk       : in std_logic;
      reset_n   : in std_logic;
      flag      : out std_logic
    );
  end component;

  component shifter9
    port (
      clk    : in std_logic;
      rst    : in std_logic;
      enable : in std_logic;
      HEX0   : out std_logic_vector(6 downto 0);
      HEX1   : out std_logic_vector(6 downto 0);
      HEX2   : out std_logic_vector(6 downto 0);
      HEX3   : out std_logic_vector(6 downto 0);
      HEX4   : out std_logic_vector(6 downto 0);
      HEX5   : out std_logic_vector(6 downto 0)
    );
  end component;
begin
  U1 : mux9
  port map
  (
    S       => S_main,
    mux_out => s1
  );
  U2 : delay9
  port map
  (
    max_value => s1,
    clk       => clk_main,
    reset_n   => reset_main,
    flag      => s2
  );
  U3 : shifter9
  port map
  (
    clk    => clk_main,
    rst    => reset_main,
    enable => s2,
    HEX0   => HEX0_MAIN,
    HEX1   => HEX1_MAIN,
    HEX2   => HEX2_MAIN,
    HEX3   => HEX3_MAIN,
    HEX4   => HEX4_MAIN,
    HEX5   => HEX5_MAIN
  );
end architecture;
