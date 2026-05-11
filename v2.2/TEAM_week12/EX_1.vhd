library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- 2학년 2반 2021041080 정승현
-- 4x4 레지스터 설계
-- 엔티티 선언

entity EX_1 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           we, clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end EX_1;

architecture Behavioral of EX_1 is
	type reg_type is array (natural range <>) of std_logic_vector(3 downto 0);
	signal reg : reg_type (3 downto 0);
begin
	process (clk)
		begin
			if rising_edge(clk) then if we = '0' then reg(conv_integer(addr)) <= D;
				end if;
				Q <= reg(conv_integer(addr));
			end if;
		end process;
end Behavioral;
