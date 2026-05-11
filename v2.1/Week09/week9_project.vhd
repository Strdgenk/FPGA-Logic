library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK9 PROJECT 선택적 병행처리문
-- vector 동작

entity week9_project is
    Port ( X : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC_VECTOR (5 downto 0));
end week9_project;

architecture Behavioral of week9_project is

	signal D: std_logic_vector(5 downto 0);

begin

		with X select
		D<="010011" when "00",
			"101001" when "01",
			"101001" when "10",
			"011100" when others;
			
Y <= NOT D;

end Behavioral;
