library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 실습 1 선택적 병행처리문
-- vector동작

entity week9_1 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end week9_1;

architecture Behavioral of week9_1 is
	
	signal D: std_logic_vector(7 downto 0);

begin

	with X select
	D<="10101010" when "000",
		"10101001" when "001",
		"01011010" when "010",
		"01011001" when "011",
		"01011010" when "100",	
		"01011001" when "101",
		"10010110" when "110",
		"10010101" when others;
Y <= NOT D;

end Behavioral;
