library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week2 
-- Y0Y7 LED OUT
-- 2학년 2반 2021041080 정승현

entity Y0Y7_LED is
    Port ( Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC;
           Y4 : out  STD_LOGIC;
           Y5 : out  STD_LOGIC;
           Y6 : out  STD_LOGIC;
           Y7 : out  STD_LOGIC);
end Y0Y7_LED;

architecture Behavioral of Y0Y7_LED is

begin

  Y0 <= '0' ;
  Y1 <= '0' ;
  Y2 <= '0' ;
  Y3 <= '0' ;
  Y4 <= '0' ;
  Y5 <= '0' ;
  Y6 <= '0' ;
  Y7 <= '0' ;

end Behavioral;
