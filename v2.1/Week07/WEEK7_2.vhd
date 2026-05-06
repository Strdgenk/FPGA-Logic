library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 과제 1번
-- 2019041073 손대영
-- 2021041080 정승현
entity WEEK7_2 is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC);
end WEEK7_2;

architecture Behavioral of WEEK7_2 is

	SIGNAL S  : STD_LOGIC_VECTOR (3 downto 0);

begin

gate_process : process(x) -- x 입력 벡터 감지

BEGIN

if(x="000") then S<="0001";
elsif(x="001") then S<="0001";
elsif(x="010") then S<="0000";
elsif(x="011") then S<="1010";
elsif(x="100") then S<="1101";
elsif(x="101") then S<="1101";
elsif(x="110") then S<="0000";
else S<="1010";
end if;
end process;
y<= not S(3);




end Behavioral;
