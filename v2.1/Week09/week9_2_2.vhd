library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 실습2 선택적 병행처리문
-- vector동작

entity week9_2_2 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end week9_2_2;

architecture Behavioral of week9_2_2 is

	SIGNAL S: STD_LOGIC_VECTOR(7 downto 4);

begin
			S <= "0011" WHEN (X="000") else
				"1010" WHEN (X="001") else
				"0010" WHEN (X="010") else
				"1110" WHEN (X="011") else
				"1010" WHEN (X="100") else
				"1010" WHEN (X="101") else
				"0010" WHEN (X="110") else
				"1000" ;
				
				Y <= NOT S;


end Behavioral;
