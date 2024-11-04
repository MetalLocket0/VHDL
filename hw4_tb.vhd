library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY tb_hw4 IS
END tb_hw4;

ARCHITECTURE behavior OF tb_hw4 IS


    COMPONENT hw4
    PORT(
        ipt : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Z   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;
    

    signal ipt : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal Z   : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN


    uut: hw4 PORT MAP (
          ipt => ipt,
          Z => Z
        );


    stimulus : process
    begin

        for i in 0 to 15 loop
            ipt <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;  
        end loop;
        
        wait; 
    end process stimulus;

END behavior;
