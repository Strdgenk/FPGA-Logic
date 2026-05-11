library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK14 Cascading 과제 2

entity week14_2 is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0);
			FND : out  STD_LOGIC_VECTOR (7 downto 0);
				Q : out  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (5 downto 0);
			  Cascading : in  STD_LOGIC_VECTOR (2 downto 0));
end week14_2;

architecture Behavioral of week14_2 is

	signal out_Y: STD_LOGIC_VECTOR (5 downto 0);

begin
Q <= "1110";

FND <="00000011" WHEN A="0000" ELSE
			"10011111" WHEN A="0001" ELSE 
			"00100101" WHEN A="0010" ELSE 
			"00001101" WHEN A="0011" ELSE 
			"10011001" WHEN A="0100" ELSE 
			"01001001" WHEN A="0101" ELSE 
			"01000001" WHEN A="0110" ELSE 
			"00011111" WHEN A="0111" ELSE 
			"00000001" WHEN A="1000" ELSE 
			"00001001" WHEN A="1001" ELSE
			"00010001" WHEN A="1010" ELSE
			"11000001" WHEN A="1011" ELSE
			"01100011" WHEN A="1100" ELSE
			"10000101" WHEN A="1101" ELSE
			"01100001" WHEN A="1110" ELSE
			"01110001" WHEN A="1111" ELSE
			"11111111";
			
process(A, B, Cascading)
		begin
		case Cascading is
		when "100"=>
					if (A=B) then out_Y(0) <= '1'; else out_Y(0) <= '0'; end if;
					if (A/=B) then out_Y(1) <= '1'; else out_Y(1) <= '0'; end if;
					if (A>B) then out_Y(2) <= '1'; else out_Y(2) <= '0'; end if;
					if (A<B) then out_Y(3) <= '1'; else out_Y(3) <= '0'; end if;
					if (A>=B) then out_Y(4) <= '1'; else out_Y(4) <= '0'; end if;
					if (A<=B) then out_Y(5) <= '1'; else out_Y(5) <= '0'; end if;
						when "001" => out_Y <= "001000";
						when "010"=>  out_Y <= "000100";	
						when others=> out_Y <= "000000";
				end case;
			end process;
	Y <= NOT out_Y;
 

end Behavioral;
