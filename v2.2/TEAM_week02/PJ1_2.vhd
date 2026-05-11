library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- 4BIT 멀티플렉서_병행처리문 WHEN_ELSE

entity PJ1_2 is
    Port ( X0 : in  STD_LOGIC;
           X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           X4 : in  STD_LOGIC;
           X5 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC);
end PJ1_2;

architecture Behavioral of PJ1_2 is

	signal se1 : std_logic_vector(1 downto 0);

begin
	se1 <= X5 & X4;
	Y0 <= X0 when (se1 = "00") else
			X1 when (se1 = "01") else
			X2 when (se1 = "10") else
			X3;
end Behavioral;
