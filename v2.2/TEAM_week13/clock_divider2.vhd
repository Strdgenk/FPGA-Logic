library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- 클럭 분주
-- 실습 2

entity clock_divider2 is
		generic(count : integer range 0 to 50000000 := 4);
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end clock_divider2;

architecture Behavioral of clock_divider2 is
begin
	process (clk_in)
		variable tmp : integer range 0 to 50000000 := 0;
	begin
    if (clk_in'event and clk_in = '1') then
        if (tmp = count - 1) then
            tmp := 0;
            clk_out <= '1';
        else
            tmp := tmp + 1;
            clk_out <= '0';
        end if;
    end if;
end process;
end Behavioral;
