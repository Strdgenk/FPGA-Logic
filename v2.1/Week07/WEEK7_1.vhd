library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 과제 2번
-- 2019041073 손대영
-- 2021041080 정승현
entity WEEK7_1 is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end WEEK7_1;

architecture Behavioral of WEEK7_1 is
	SIGNAL d : STD_LOGIC_VECTOR(3 downto 0);

begin

gate_process : process(x) -- x 입력 벡터 감지

	begin
	
		if(x="0000") then d<="0011";
		elsif(x="0001") then d<="1101";
		elsif(x="0010") then d<="1101";
		elsif(x="0011") then d<="0010";
		elsif(x="0100") then d<="0001";
		elsif(x="0101") then d<="1111";
		elsif(x="0110") then d<="1111";
		elsif(x="0111") then d<="0000";
		elsif(x="1000") then d<="0011";
		elsif(x="1001") then d<="1101";
		elsif(x="1010") then d<="1101";
		elsif(x="1011") then d<="0010";
		elsif(x="1100") then d<="0000";
		elsif(x="1101") then d<="1110";
		elsif(x="1110") then d<="1110";
		else d<="0000";
		end if;

	end process;

	y<= not d;
end Behavioral;
