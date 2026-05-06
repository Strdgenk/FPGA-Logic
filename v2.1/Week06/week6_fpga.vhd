library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK6
-- 과제1 2입력 GATE 응용
-- 2학년_2반_2021041080 정승현

entity week6_fpga is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC);
end week6_fpga;

architecture Behavioral of week6_fpga is

	signal S4: std_logic;
	
begin
	
	S4 <= (X0 AND X1) OR ((NOT X1) AND X2); --내부 신호(S4)에 X0, 1, 2을 입력
	Y0 <= NOT S4; -- Y0에 내부신호(S4) 입력

end Behavioral;
