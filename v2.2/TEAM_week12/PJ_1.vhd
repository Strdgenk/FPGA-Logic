library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- 2학년 2반 2021041080 정승현
-- 8x8 레지스터 설계
-- 과제1

entity PJ_1 is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           addr : in  STD_LOGIC_VECTOR (2 downto 0);
           we, clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end PJ_1;

architecture Behavioral of PJ_1 is
	type reg_type is array (natural range <>) of std_logic_vector(7 downto 0);
	signal reg : reg_type (7 downto 0);
	
	begin
		process (clk)
			begin
				if rising_edge(clk) then 
				if we = '0' then reg(conv_integer(addr)) <= D; -- address에 해당하는 입력값을 저장
				end if;
				Q <= reg(conv_integer(addr)); -- address에 해당되는 출력값을 저장
			end if;
		end process;
end Behavioral;
