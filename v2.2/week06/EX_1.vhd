library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


-- 2학년 2반 2021041080 정승현
-- COUNTER
-- Synchronous_RESET

entity EX_1 is
    Port ( RESET, CLK : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end EX_1;

architecture Behavioral of EX_1 is
	signal count : std_logic_vector(3 downto 0) := "0000";
	
begin
process (CLK,RESET)
	begin
		if(CLK'event and CLK = '1') then
			if(RESET = '0') then count <= "0000";
				else count <= count + 1;
			end if;
		end if;
	end process;
Y <= count;
end Behavioral;
