library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- WEEK1 AND GATE

entity PROJECT_1 is
    Port ( A, B : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end PROJECT_1;

architecture Behavioral of PROJECT_1 is

begin

	Z <= A AND B;

end Behavioral;
