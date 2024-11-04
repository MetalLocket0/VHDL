LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;  

ENTITY lab4 IS 
	PORT (w,x,y,z : IN STD_LOGIC;
				skibidi : OUT STD_LOGIC_VECTOR(6 downto 0);
				christopherlynde : OUT STD_LOGIC_VECTOR(6 downto 0));
				END lab4;
				
				
				
ARCHITECTURE hawktuah OF lab4 IS 

	SIGNAL inputs: STD_LOGIC_VECTOR(3 DOWNTO 0);
	CONSTANT zero : STD_LOGIC_VECTOR(6 downto 0) := "1000000";
	CONSTANT seven : STD_LOGIC_VECTOR(6 downto 0) := "1111000";
	CONSTANT dash : STD_LOGIC_VECTOR(6 downto 0) := "0111111";
	CONSTANT one : STD_LOGIC_VECTOR(6 downto 0) := "1111001";
	CONSTANT three : STD_LOGIC_VECTOR(6 downto 0) := "0110000";
	CONSTANT two : STD_LOGIC_VECTOR(6 downto 0) := "0100100";
	CONSTANT five : STD_LOGIC_VECTOR(6 downto 0) := "0010010";
	CONSTANT blank : STD_LOGIC_VECTOR(6 downto 0) := "1111111";
	begin
		inputs <= w & x & y & z;
		ex_or: PROCESS(inputs)
		BEGIN
		case( inputs ) is
		
			when "0000" => skibidi <= zero; 
			when "0001" => skibidi <= seven;
			when "0010" => skibidi <= dash;
			when "0011" => skibidi <= one;
			when "0100" => skibidi <= three; 
			when "0101" => skibidi <= dash; 
			when "0110" => skibidi <= two; 
			when "0111" => skibidi <= zero; 
			when "1000" => skibidi <= zero; 
			when "1001" => skibidi <= five; 
			
		
			when others => skibidi <= blank;
		end case ;
		end PROCESS;

			PROCESS(inputs)
				begin
					if inputs <= "0000" then
						christopherlynde <= zero;
						elsif inputs <= "0001" then
						christopherlynde <= seven;
						elsif inputs <= "0010" then
						christopherlynde <= dash;
						elsif inputs <= "0011" then
						christopherlynde <= one;
						elsif inputs <= "0100" then
						christopherlynde <= three;
						elsif inputs <= "0101" then
						christopherlynde <= dash;
						elsif inputs <= "0110" then
						christopherlynde <= two;
						elsif inputs <= "0111" then
						christopherlynde <= zero;
						elsif inputs <= "1000" then
						christopherlynde <= zero;
						elsif inputs <= "1001" then
							christopherlynde <= five;
							else
								christopherlynde <= blank;
						end if;
						end PROCESS;					
		END hawktuah;
