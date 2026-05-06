library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK
-- 2입력 응용
-- 2학년_2반_2021041080_정승현

entity input102_1 is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : out  STD_LOGIC);
end input102_1;

architecture Behavioral of input102_1 is

	signal d0,d1,d2,d3,d4,d5,d6,d7 : std_logic; --내부 신호 선언
	

begin

	--BUFFER
	D0 <= X0; Y0 <= NOT D0;
	--내부신호 D0에 X0입력, Y0에 내부신호 입력
	--INVERTER
	D1 <= NOT X0; Y1 <= NOT D1;
	--AND
	D2 <= X1 AND X2; Y2 <= NOT D2;
	--NAND
	D3 <= X1 NAND X2; Y3 <= NOT D3;
	--OR
	D4 <= X1 OR X2; Y4 <= NOT D4;
	--NOR
	D5 <= X1 NOR X2; Y5 <= NOT D5;
	--XOR
	D6 <= X1 XOR X2; Y6 <= NOT D6;
	--XNOR 
	D7 <= X1 XNOR X2; Y7 <= NOT D7;


end Behavioral;
