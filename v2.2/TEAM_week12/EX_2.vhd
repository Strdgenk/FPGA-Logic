library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- SHIFT 레지스터 설계
-- 엔티티 선언

entity EX_2 is
    Port ( d_in, clk, rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end EX_2;

architecture Behavioral of EX_2 is
	signal qb : std_logic_vector(3 downto 0);
	begin
		shift : process (clk)
			begin
				if (rising_edge(clk)) then 
					if (rst = '0') then qb <= "0000";
						else qb(0) <= d_in; qb(1) <= qb(0); qb(2) <= qb(1); qb(3) <= qb(2);
					end if;
				end if;
			end process;
			
				q <= qb;
end Behavioral;
