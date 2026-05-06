library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK4 3입력 NAND GATE

entity NAND_GATE4 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end NAND_GATE4;

architecture Behavioral of NAND_GATE4 is

begin

  Y <= (A NAND B) NAND C ; -- 3입력 NAND GATE

end Behavioral;
