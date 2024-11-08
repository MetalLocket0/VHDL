LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;  

entity binary2ssd8 is
    Port (
        In_num : in std_logic_vector(9 downto 0);   
        HEX2 : out std_logic_vector(6 downto 0);   
        HEX1 : out std_logic_vector(6 downto 0); 
        HEX0 : out std_logic_vector(6 downto 0)  
    );
end binary2ssd8;

architecture Behavioral of binary2ssd8 is
    signal abs_val : unsigned(9 downto 0);
    signal hundreds_dig : unsigned(9 downto 0);
    signal tens_dig : unsigned(9 downto 0);
    signal ones_dig : unsigned(9 downto 0);
    CONSTANT ZERO : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000000";  
	 CONSTANT ONE  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
	 CONSTANT TWO  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100";
	 CONSTANT THREE: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110000";
	 CONSTANT FOUR : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011001";
	 CONSTANT FIVE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
	 CONSTANT SIX  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000010";
	 CONSTANT SEVEN: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111000";
	 CONSTANT EIGHT: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
	 CONSTANT NINE : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011000";
     CONSTANT BLANK: STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
begin

		  abs_val <= unsigned(In_num);
        hundreds_dig <= (abs_val / 100);
        tens_dig <= ((abs_val rem 100) / 10);
        ones_dig <= (abs_val rem 10);

    process(hundreds_dig)
    begin
        case hundreds_dig is
            WHEN "0000000000" => HEX2 <= ZERO;
            WHEN "0000000001" => HEX2 <= ONE;
            WHEN "0000000010" => HEX2 <= TWO;
            WHEN "0000000011" => HEX2 <= THREE;
            WHEN "0000000100" => HEX2 <= FOUR;
            WHEN "0000000101" => HEX2 <= FIVE;
            WHEN "0000000110" => HEX2 <= SIX;
            WHEN "0000000111" => HEX2 <= SEVEN;
            WHEN "0000001000" => HEX2 <= EIGHT;
            WHEN "0000001001" => HEX2 <= NINE;
            WHEN others => HEX2 <= BLANK;
        end case;
    end process;

    process(tens_dig, ones_dig)
    begin

        case tens_dig is
    WHEN "0000000000" => HEX1 <= ZERO;
	WHEN "0000000001" => HEX1 <= ONE;
	WHEN "0000000010" => HEX1 <= TWO;
	WHEN "0000000011" => HEX1<= THREE;
	WHEN "0000000100" => HEX1 <= FOUR;
	WHEN "0000000101" => HEX1 <= FIVE;
    WHEN "0000000110" => HEX1 <= SIX;
	WHEN "0000000111" => HEX1 <= SEVEN;
	WHEN "0000001000" => HEX1 <= EIGHT;
	WHEN "0000001001" => HEX1 <= NINE;
    WHEN others => HEX1 <= BLANK;
        end case;
        
        case ones_dig is
    WHEN "0000000000" => HEX0 <= ZERO;
	WHEN "0000000001" => HEX0 <= ONE;
	WHEN "0000000010" => HEX0 <= TWO;
	WHEN "0000000011" => HEX0 <= THREE;
	WHEN "0000000100" => HEX0 <= FOUR;
	WHEN "0000000101" => HEX0 <= FIVE;
    WHEN "0000000110" => HEX0 <= SIX;
	WHEN "0000000111" => HEX0 <= SEVEN;
	WHEN "0000001000" => HEX0 <= EIGHT;
	WHEN "0000001001" => HEX0 <= NINE;
    WHEN others => HEX0 <= BLANK;
        end case;
    end process;

end Behavioral;