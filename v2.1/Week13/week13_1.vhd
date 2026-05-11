library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week13 실습 1
-- DECODER8X3_FND
-- 2학년_2반_2021041080_정승현;

entity week13_1 is
    Port ( X0 : in  STD_LOGIC_VECTOR (3 downto 0);
           X1 : in  STD_LOGIC_VECTOR (7 downto 4);
           FND : out  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end week13_1;

architecture Behavioral of week13_1 is

begin

	PROCESS(X1)
	BEGIN
	IF X1(4) = '0' THEN Q <= "0111";
	ELSIF X1(5) = '0' THEN Q <= "1011";
	ELSIF X1(6) = '0' THEN Q <= "1101";
	ELSIF X1(7) ='0' THEN Q <= "1110";
	ELSE Q <= "1111";
	
	END IF;
	END PROCESS;
	
	FND <="00000011" WHEN X0="0000" ELSE
			"10011111" WHEN X0="0001" ELSE 
			"00100101" WHEN X0="0010" ELSE 
			"00001101" WHEN X0="0011" ELSE 
			"10011001" WHEN X0="0100" ELSE 
			"01001001" WHEN X0="0101" ELSE 
			"01000001" WHEN X0="0110" ELSE 
			"00011111" WHEN X0="0111" ELSE 
			"00000001" WHEN X0="1000" ELSE 
			"00001001" WHEN X0="1001" ELSE 
			"11111111";


end Behavioral;
