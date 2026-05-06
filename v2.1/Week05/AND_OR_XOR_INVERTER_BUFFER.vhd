library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- WEEK5
-- AND, OR, XOR, INVERTER, BUFFER
-- 2학년_2반_2021041080_정승현

entity AND_OR_XOR_INVERTER_BUFFER is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0, Y1, Y2, Y3, Y4 : out  STD_LOGIC);
end AND_OR_XOR_INVERTER_BUFFER;

architecture Behavioral of AND_OR_XOR_INVERTER_BUFFER is

begin

  Y0 <= X0 AND X1 AND X2;
  Y1 <= X0 OR X1 OR X2;
  Y2 <= X0 XOR X1 XOR X2;
  Y3 <= NOT X0 ;
  Y4 <= X0;

end Behavioral;
