library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- 과제2

entity PJ_4 is
    Port ( rst, clk : in  STD_LOGIC;
           beep : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end PJ_4;

architecture Behavioral of PJ_4 is
	signal COUNT1 : std_logic_vector(2 downto 0);
begin
	upcount : process(clk, rst)
	begin
		if (rst = '0') then 
            COUNT1 <= "000"; 
        elsif (rising_edge(clk)) then 
            if COUNT1 = "100" then  -- COUNT1이 "100" (5진수 4)에 도달하면
                COUNT1 <= "000";  -- COUNT1을 "000"으로 초기화
            else
                COUNT1 <= COUNT1 + 1;  -- COUNT1 값을 1 증가시킴
            end if;
        end if;
    end process;
	 
	 q <= "1110";  -- 출력 q를 고정값 "1110"으로 설정
    seg <= "11111110" when (COUNT1 = "000") else  -- COUNT1이 "000"일 때 세그먼트 디스플레이 출력 설정
           "11111101" when (COUNT1 = "001") else  -- COUNT1이 "001"일 때 세그먼트 디스플레이 출력 설정
			  "11111011" when (COUNT1 = "010") else  -- COUNT1이 "010"일 때 세그먼트 디스플레이 출력 설정
           "11110111" when (COUNT1 = "011") else  -- COUNT1이 "011"일 때 세그먼트 디스플레이 출력 설정
           "11101111" when (COUNT1 = "100") else  -- COUNT1이 "100"일 때 세그먼트 디스플레이 출력 설정
           "11111111";  -- 그 외의 경우 세그먼트 디스플레이 모두 켜짐

    beep <= '0' when (COUNT1 = "100") else  -- COUNT1이 "100"일 때 beep 출력 '0'
            '1';  -- 그 외의 경우 beep 출력 '1'


end Behavioral;
