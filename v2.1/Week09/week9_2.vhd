library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 실습2 선택적 병행처리문
-- vector동작

entity week9_2 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end week9_2;

architecture Behavioral of week9_2 is

	SIGNAL S: STD_LOGIC_VECTOR(7 downto 4 );
	
begin
		WITH X SELECT
		S<="0011" WHEN "000",
			"1010" WHEN "001",
			"0010" WHEN "010",
			"1110" WHEN "011",
			"1010" WHEN "100",
			"1010" WHEN "101",
			"0010" WHEN "110",
			"1000" WHEN OTHERS;
			
			Y<= NOT S;

end Behavioral;
