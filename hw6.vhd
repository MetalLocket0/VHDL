LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

entity hw6 is
    port (skibidi,clk, reset_n : in std_logic;
    talktuah : out std_logic);
    end hw6;

    architecture hawktuah of hw6 is 
    begin 
    process(clk, reset_n)
    begin
        if (reset_n= '0') then 
        talktuah <='0'; 
            elsif (rising_edge(clk)) then
                talktuah <= skibidi; 
        end if;
    end process; 

end hawktuah; 
