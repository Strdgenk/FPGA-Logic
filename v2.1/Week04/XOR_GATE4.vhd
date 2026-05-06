library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK4 2입력 XOR GATE

entity XOR_GATE4 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end XOR_GATE4;

architecture Behavioral of XOR_GATE4 is

begin

  Y <= A XOR B ; -- 2입력 XOR GATE

end Behavioral;
