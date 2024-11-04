LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

entity lab5 IS 
Port (A  : in  std_logic_vector(3 downto 0); 
    B  : in  std_logic_vector(3 downto 0); 
    OP : in  std_logic_vector(1 downto 0); 
    R  : out std_logic_vector(7 downto 0));
    END lab5;

    architecture sigma of lab5 is
        signal A_signed : signed(3 downto 0); 
        signal B_signed : signed(3 downto 0); 
    begin
		A_signed <= SIGNED(A);
		B_signed <= SIGNED(B); 

        process(A_signed, B_signed, OP)
    begin
        case OP is
		  when "00" =>
          R <= STD_LOGIC_VECTOR((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) + 
          (B_signed(3) & B_signed(3) & B_signed(3) & B_signed(3) & B_signed));

          when "01" =>

          R <= STD_LOGIC_VECTOR((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) -
                      (B_signed(3) & B_signed(3) & B_signed(3) & B_signed(3) & B_signed));


      when "10" =>
          R <= STD_LOGIC_VECTOR((A_signed) * (B_signed));


      when "11" =>
              R <= STD_LOGIC_VECTOR((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) / (B_signed(3) & B_signed(3) & B_signed(3) & B_signed(3) & B_signed));
          when others =>
          R <= (others => '0');
          end case;
          end process;


end sigma;