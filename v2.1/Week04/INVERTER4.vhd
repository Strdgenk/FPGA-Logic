library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK4
-- IN_OUT
-- 2학년_2반_2021041080_정승현

entity INVERTER4 is
    Port ( x7 : in  STD_LOGIC;
           y7 : out  STD_LOGIC);
end INVERTER4;

architecture Behavioral of INVERTER4 is

begin

  Y7 <= NOT X7 ; -- Y7 출력 신호에 입력 X7의 신호를 넣는다.

end Behavioral;
