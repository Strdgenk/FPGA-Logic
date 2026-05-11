library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week13 과제 SUB MODULE
-- team6 2학년 2반 2021041028 김호중, 2학년 2반 2021041080 정승현


entity clock_divider is
	 generic(count : integer range 0 to 50000000 := 4);
    Port ( CLK_IN : in  STD_LOGIC;
           CLK_OUT : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
begin
	process(CLK_IN)
		variable tmp : integer range 0 to 50000000 := 0;
	begin
		if(CLK_IN'event and CLK_IN = '1') then
			if(tmp = count-1) then
				tmp := 0;
				CLK_OUT <= '1';
			else
				tmp := tmp + 1;
				CLK_OUT <= '0';
			end if;
		end if;
	end process;
end Behavioral;
