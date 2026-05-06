library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK6
-- 과제2 4입력 GATE 응용2
-- 2학년_2반_2021041080_정승현

entity week6_2_fpga is
    Port ( X0, X1, X2, X3 : in  STD_LOGIC;
           Y0, Y1, Y2, Y3 : out  STD_LOGIC);
end week6_2_fpga;

architecture Behavioral of week6_2_fpga is
	
	signal O0, O1, O2, O3: std_logic; --내부신호 선언

begin
	
	O3 <= (X0 AND (NOT X1)) OR ((NOT X0) AND X1);
	O2 <= (X0 NAND (X0 NAND X1)) NAND ((X1 NAND (X0 NAND X1)));
	O1 <= (X0 XOR X1) XNOR X2;
	O0 <= (X0 AND X1) NOR (X2 AND X3);
	

	Y3 <= NOT O3;
	Y2 <= NOT O2;
	Y1 <= NOT O1;
	Y0 <= NOT O0;

end Behavioral;
