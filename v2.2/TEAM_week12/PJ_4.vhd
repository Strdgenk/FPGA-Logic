library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- 8BIT SHIFT REGISTER
-- 과제 2

entity PJ_4 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           si : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end PJ_4;

architecture Behavioral of PJ_4 is
	signal QB : std_logic_vector(7 downto 0) := "11111111";
begin
	process (reset, clk)
	begin
		if (reset = '0') then QB <= "11111111";
		elsif( clk'event and clk = '1') then QB (6 downto 0) <= QB(7 downto 1);
		QB(7) <= SI;
	end if;
end process;
	q <= QB;
end Behavioral;
