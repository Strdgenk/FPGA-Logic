library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중
-- 2학년 2반 2021041080 정승현
-- RIPPLE COUNTER 응용

entity ex_5 is
    Port ( clk, rst : in  STD_LOGIC;
           jq : out  STD_LOGIC_VECTOR (3 downto 0);
           beep : out  STD_LOGIC;
           load : in  STD_LOGIC);
end ex_5;

architecture Behavioral of ex_5 is
	signal cq0 : std_logic := '0';
	signal cq1 : std_logic := '0';
	signal cq2 : std_logic := '0';
	signal cq3 : std_logic := '0';
	
	signal BEEP_X : std_logic := '0'; -- 내부 부저 제어 신호
begin
    -- 카운터 출력 설정 (cq3, cq2, cq1, cq0 순서로 출력)
    jq <= cq3 & cq2 & cq1 & cq0;

    -- 첫 번째 플립플롭 (cq0), clk의 상승 에지에서 토글
    A_FF : process(rst, clk)
    begin
        if (rst = '0') then 
            cq0 <= '0'; -- 리셋이 활성화되면 cq0 초기화
        elsif (rising_edge(clk)) then
            cq0 <= not cq0; -- clk의 상승 에지에서 cq0 토글
        end if;
    end process;

    -- 두 번째 플립플롭 (cq1), cq0의 상승 에지에서 토글
    B_FF : process(rst, cq0)
    begin
        if (rst = '0') then 
            cq1 <= '0'; -- 리셋이 활성화되면 cq1 초기화
        elsif (rising_edge(cq0)) then
            cq1 <= not cq1; -- cq0의 상승 에지에서 cq1 토글
        end if;
    end process;

    -- 세 번째 플립플롭 (cq2), cq1의 상승 에지에서 토글
    C_FF : process(rst, cq1)
    begin
        if (rst = '0') then 
            cq2 <= '0'; -- 리셋이 활성화되면 cq2 초기화
        elsif (rising_edge(cq1)) then
            cq2 <= not cq2; -- cq1의 상승 에지에서 cq2 토글
        end if;
    end process;

    -- 네 번째 플립플롭 (cq3), cq2의 상승 에지에서 토글
    D_FF : process(rst, cq2)
    begin
        if (rst = '0') then 
            cq3 <= '0'; -- 리셋이 활성화되면 cq3 초기화
        elsif (rising_edge(cq2)) then
            cq3 <= not cq3; -- cq2의 상승 에지에서 cq3 토글
        end if;
    end process;

    -- load 신호에 따라 부저 출력 제어
    process(load)
    begin
        if (load = '1') then
            BEEP_X <= '1'; -- load가 1일 때 BEEP_X 활성화
        else
            BEEP_X <= '0'; -- load가 0일 때 BEEP_X 비활성화
        end if;
    end process;

    beep <= BEEP_X; -- 내부 신호 BEEP_X를 부저 출력에 연결


end Behavioral;
