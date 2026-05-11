library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- 과제 1

entity PJ_3 is
    Port ( rst, clk : in  STD_LOGIC;
           beep : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end PJ_3;

architecture Behavioral of PJ_3 is
	signal COUNT1 : std_logic_vector(2 downto 0);
	begin
	upcount : process(clk, rst)
		begin
			if (rst = '0') then  -- 리셋 신호가 '0'일 때 (비동기 리셋)
            COUNT1 <= "000";  -- COUNT1을 "000"으로 초기화
        elsif (rising_edge(clk)) then  -- 클럭 신호의 상승 에지에서
            COUNT1 <= COUNT1 + 1;  -- COUNT1 값을 1 증가시킴
        end if;
    end process;
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
