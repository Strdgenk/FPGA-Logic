library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 다중 입력 게이트
-- 2반 2021041080 정승현

entity PROJECT_2 is
    Port ( X0 : in  STD_LOGIC;
           X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC);
end PROJECT_2;

architecture Behavioral of PROJECT_2 is
	signal SIGNAL1 : STD_LOGIC;
	signal SIGNAL2 : STD_LOGIC;
	signal SIGNAL3 : STD_LOGIC;

begin

	Y0 <= (X0 NOR X1) NOR X2;
	Y1 <= (X0 NAND X1) NAND X2;
	SIGNAL3 <= NOT X1;
	SIGNAL1 <= NOT X2;
	Y2 <= X0 AND X1 AND SIGNAL1;
	SIGNAL2 <= SIGNAL3 AND X2;
	Y3 <= X0 OR SIGNAL2;

end Behavioral;
