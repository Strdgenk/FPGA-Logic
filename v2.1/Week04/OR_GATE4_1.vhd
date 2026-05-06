library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK4 2입력 OR GATE

entity OR_GATE4_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end OR_GATE4_1;

architecture Behavioral of OR_GATE4_1 is

begin

  Y <= A OR B ; -- 2입력 OR GATE

end Behavioral;
