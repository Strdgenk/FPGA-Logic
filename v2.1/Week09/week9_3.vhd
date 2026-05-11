library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 실습3 선택적 병행처리문
-- vector동작

entity week9_3 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end week9_3;

architecture Behavioral of week9_3 is

	signal F: std_logic_vector(3 downto 0);

begin
		with X select
		F<="0000" when "000",
			"1110" when "001",
			"0001" when "010",
			"1100" when "011",
			"0110" when "100",
			"0101" when "101",
			"0111" when "110",
			"1011" when others;
			
			Y<= NOT F;


end Behavioral;
