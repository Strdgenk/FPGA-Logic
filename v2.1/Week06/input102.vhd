library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK6
-- 3입력 응용
-- 2학년_2반_2021041080_정승현

entity input102 is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0, Y1, Y2, Y3 : out  STD_LOGIC);
end input102;

architecture Behavioral of input102 is
	signal S1,S2,S3,S4,S5,S6,S7:std_logic; --내부 신호 정의
begin
	--내부신호 s4...s7
	S4<=NOT(X0 OR X2 OR X1);
	S5<=NOT(X0 AND X1 AND X2);
	S6<=X0 AND X1 AND (NOT X2);
	S7<=X0 OR ((NOT X1) AND X2);
	
	-- 출력 Y0...Y3
	
	Y0 <= NOT S4;
	Y1 <= NOT S5;
	Y2 <= NOT S6;
	Y3 <= NOT S7;


end Behavioral;
