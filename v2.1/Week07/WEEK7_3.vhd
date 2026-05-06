library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 과제 3번
-- 2019041073 손대영
-- 2021041080 정승현
 

entity WEEK7_3 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end WEEK7_3;

architecture Behavioral of WEEK7_3 is

		signal d : STD_LOGIC_VECTOR (3 downto 0);

begin


gate_process : process(x) -- x 입력 벡터 감지begin
	BEGIN
	
		if(x="000") then d<="0111";
		elsif(x="001") then d<="1110";
		elsif(x="010") then d<="0110";
		elsif(x="011") then d<="1010";
		elsif(x="100") then d<="1110";
		elsif(x="101") then d<="1110";
		elsif(x="110") then d<="0110";
		else d<="1100";
		end if;
	end process;
	y<= not d;
end Behavioral;
