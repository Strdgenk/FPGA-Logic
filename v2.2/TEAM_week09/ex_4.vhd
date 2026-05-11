library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중
-- 2학년 2반 2021041080 정승현
-- RING COUNTER 응용

entity ex_4 is
    Port ( rst, clk : in  STD_LOGIC;
				load : in std_logic;
				beep : out std_logic;
           dq : out  STD_LOGIC_VECTOR (3 downto 0));
end ex_4;

architecture Behavioral of ex_4 is
	signal COUNT_IN : std_logic_vector (3 downto 0):= "1010";
	signal BEEP_X : std_logic := '1';

begin
	PROCESS(RST, CLK)
    BEGIN
        IF(RST = '0') THEN
            COUNT_IN <= "0000";
            beep_x <= '1';
        ELSIF(RISING_EDGE(CLK)) THEN
            IF (load = '1') THEN
                beep_x <= '1';
            ELSE 
                beep_x <= '0';
				END IF;
                IF (COUNT_IN = "0000") THEN
                    COUNT_IN <= "1010";  -- 초기 값 설정
                ELSE
                    COUNT_IN(3) <= COUNT_IN(2);
                    COUNT_IN(2) <= COUNT_IN(1);
                    COUNT_IN(1) <= COUNT_IN(0);
                    COUNT_IN(0) <= COUNT_IN(3);
                END IF;
      
        END IF;
    END PROCESS;

    DQ <= COUNT_IN;
    beep <= beep_x;
end Behavioral;
