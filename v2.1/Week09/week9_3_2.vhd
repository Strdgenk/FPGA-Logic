library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 실습3 조건적 병행처리문
-- vector동작

entity week9_3_2 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end week9_3_2;

architecture Behavioral of week9_3_2 is

	signal F: std_logic_vector(3 downto 0);

begin

		F<="0000" when (x="000") else
			"1110" when (x="001") else
			"0001" when (x="010") else
			"1100" when (x="011") else
			"0110" when (x="100") else
			"0101" when (x="101") else
			"0111" when (x="110") else
			"1011" ;
			
			Y <= NOT F;


end Behavioral;
