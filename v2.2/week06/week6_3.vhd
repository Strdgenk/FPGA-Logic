library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- 2학년 2반 2021041064 이정일
-- 2학년 2반 2021041080 정승현

entity week6_3 is
    Port ( RESET, CLK : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end week6_3;

architecture Behavioral of week6_3 is
signal COUNT : std_logic_vector(3 downto 0) := "0000";  -- 기본 초기화 상태 설정
begin

-- 첫번째 플립플롭 (CLK의 상승 에지에서 COUNT(0) 변경)
process (CLK, RESET)
begin
    if RESET = '0' then
        COUNT(0) <= '0';  -- 리셋 시 0으로 초기화
    elsif rising_edge(CLK) then
        COUNT(0) <= not COUNT(0);  -- CLK 상승 에지에서 반전
    end if;
end process;

-- 두번째 플립플롭 (COUNT(0)이 클럭으로 사용됨)
process (COUNT(0), RESET)
begin
    if RESET = '0' then
        COUNT(1) <= '0';  -- 리셋 시 0으로 초기화
    elsif rising_edge(COUNT(0)) then
        COUNT(1) <= not COUNT(1);  -- COUNT(0)의 상승 에지에서 반전
    end if;
end process;

-- 세번째 플립플롭 (COUNT(1)이 클럭으로 사용됨)
process (COUNT(1), RESET)
begin
    if RESET = '0' then
        COUNT(2) <= '0';  -- 리셋 시 0으로 초기화
    elsif rising_edge(COUNT(1)) then
        COUNT(2) <= not COUNT(2);  -- COUNT(1)의 상승 에지에서 반전
    end if;
end process;

-- 네번째 플립플롭 (COUNT(2)가 클럭으로 사용됨)
process (COUNT(2), RESET)
begin
    if RESET = '0' then
        COUNT(3) <= '0';  -- 리셋 시 0으로 초기화
    elsif rising_edge(COUNT(2)) then
        COUNT(3) <= not COUNT(3);  -- COUNT(2)의 상승 에지에서 반전
    end if;
end process;

-- 출력 신호 연결
Y <= COUNT;

end Behavioral;
