library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- Synchronous reset, counter8
-- 응용
-- 과제4

entity PJ_2 is
    Port ( rst, clk : in  STD_LOGIC;
				load : in STD_LOGIC;
				PWM : out STD_LOGIC_VECTOR (2 downto 0);
           beep : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end PJ_2;

architecture Behavioral of PJ_2 is
	signal COUNT1 : std_logic_vector(2 downto 0);
begin
	upcount : process(clk, rst)
	begin
        if(rising_edge(clk)) then
			if(rst='0') then COUNT1 <= "000";
				else COUNT1 <= COUNT1 + 1;
			end if;
		end if;
	end process;
	
	-- PWM 출력 조건 설정
    PWM(0) <= '1' when (load = '1' ) else '0'; 
    PWM(1) <= '1' when (load = '1' ) else '0'; 
    PWM(2) <= '1' when (load = '1' ) else '0'; 
	
	q <= "1110";
	seg <= "11111110" when (COUNT1 = "000") else
			"11111101" when (COUNT1 = "001") else
			"11111011" when (COUNT1 = "010") else
			"11110111" when (COUNT1 = "011") else
			"11101111" when (COUNT1 = "100") else
			"11011111" when (COUNT1 = "101") else
			"10111111" when (COUNT1 = "110") else
			"11111111";
			
	beep <= '0' when (COUNT1 = "111") else
				'1';

end Behavioral;
