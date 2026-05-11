library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중
-- 2학년 2반 2021041080 정승현
-- JOHNSON COUNTER + RESET

entity ex_3 is
    Port ( rst, clk : in  STD_LOGIC;
           dq : out  STD_LOGIC_VECTOR (3 downto 0));
end ex_3;

architecture Behavioral of ex_3 is
	SIGNAL COUNT_IN : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
	PROCESS(RST, CLK)
   BEGIN
		IF(RST = '0') THEN
            COUNT_IN <= "0000";
        ELSIF(RISING_EDGE(CLK)) THEN
            COUNT_IN(0) <= NOT COUNT_IN(3);
            COUNT_IN(1) <= COUNT_IN(0);
            COUNT_IN(2) <= COUNT_IN(1);
            COUNT_IN(3) <= COUNT_IN(2);
        END IF;
    END PROCESS;
	 dq <= COUNT_IN;
end Behavioral;
