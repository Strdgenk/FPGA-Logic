----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:47 03/11/2024 
-- Design Name: 
-- Module Name:    Y7_LED - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week2
-- Y7 LED OUT
-- 2학년 2반 2021041080 정승현

entity Y7_LED is
    Port ( y7 : out  STD_LOGIC);
end Y7_LED;

architecture Behavioral of Y7_LED is

begin

  Y7 <= '1' ;  --Y7 포트에 0의 신호를 넣는다.

end Behavioral;

