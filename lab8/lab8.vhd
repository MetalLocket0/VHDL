library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab8 is
  port (
    clk_main, S_main, reset_n_main,set_n_main  : in std_logic;
    time_in_main                    : in std_logic_vector(9 downto 0);
    HEX0_MAIN, HEX1_MAIN, HEX2_MAIN : out std_logic_vector(6 downto 0)
  );
end lab8;

architecture behavior of lab8 is
  signal s1 : STD_LOGIC_VECTOR(23 downto 0);
  signal s2 : STD_LOGIC;
  signal s3 : STD_LOGIC_VECTOR(9 downto 0);
  
  component mux8 is
    port (
      S    : in std_logic;
      max_out : out std_logic_vector(23 downto 0)
    );
  end component;

  component delay8 is
    port (
      max_value    : in std_logic_vector(23 downto 0);
      clk, reset_n : in std_logic;
      flag         : out std_logic
    );
  end component;

  component counter8 is
    port (
      clk, set_n, enable, reset_n : in std_logic;
      time_in                     : in std_logic_vector(9 downto 0);
      count_out                   : out std_logic_vector(9 downto 0)
    );
  end component;

  component binary2ssd8 is
    port (
      In_num : in std_logic_vector(9 downto 0);
      HEX2   : out std_logic_vector(6 downto 0);
      HEX1   : out std_logic_vector(6 downto 0);
      HEX0   : out std_logic_vector(6 downto 0)
    );
  end component;
begin
  U1 : mux8
  port map
  (
    S    => S_main,
    max_out => s1
  );

  U2 : delay8
   port map(
      max_value =>s1,
      clk => clk_main,
      reset_n => reset_n_main,
      flag => s2
  );

  U3 : counter8
   port map(
      clk => clk_main,
      set_n => set_n_main,
      enable => s2,
      reset_n => reset_n_main,
      time_in => time_in_main,
      count_out => s3
  );
  
  U4 : binary2ssd8
   port map(
      In_num => s3,
      HEX2 => HEX2_MAIN,
      HEX1 => HEX1_MAIN,
      HEX0 => HEX0_MAIN
  ); 
end architecture;