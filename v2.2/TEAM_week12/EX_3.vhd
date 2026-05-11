library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- LOAD기능 SHIFT REGISTER
-- 실습 3

entity EX_3 is
    Port ( clk, rst : in  STD_LOGIC;
           s_1 : in  STD_LOGIC;
           s_r : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : buffer  STD_LOGIC_VECTOR (3 downto 0));
end EX_3;

architecture Behavioral of EX_3 is

begin
process
	begin
	wait until (rising_edge(clk));
	
	if (rst = '0') then q <= "0000";
		else
			case mode is
				when "01" => q <= s_r & q(3 downto 1);
				when "10" => q <= q(2 downto 0) & s_1;	
				when "11" => q <= d;
				when others => null;
			end case;
		end if;
	end process;
end Behavioral;
