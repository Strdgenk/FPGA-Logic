library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- 2학년 2반 2021041080 정승현 2학년 2반 2021041064 이정일
-- COUNTER LOAD
-- Synchronous_RESET

entity PJC_1 is
    Port ( RESET, CLK : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           BEEP : out  STD_LOGIC;
           EV0, EV1, EV2 : in  STD_LOGIC);
end PJC_1;

architecture Behavioral of PJC_1 is
    signal COUNT : std_logic_vector(3 downto 0) := "0000";  -- 내부 카운트 신호 설정
    signal BEEP_X : std_logic := '1';  -- BEEP 신호 초기값 설정 (1이면 꺼진 상태)
begin
    
    process (CLK, RESET)
    begin
        if (RESET = '0') then  -- RESET이 들어오면
            COUNT <= "1111";   -- RESET 시 Y0~Y3 모두 꺼짐
            BEEP_X <= '0';     -- BEEP 신호 꺼짐 (초기화)
        elsif (CLK'event and CLK = '1') then  -- 클럭 동기화 처리
            if (EV0 = '1') then
                COUNT <= "0011";  -- Y0, Y1 켜짐
            elsif (EV1 = '1') then
                COUNT <= "1100";  -- Y2, Y3 켜짐
            elsif (EV2 = '1') then
                BEEP_X <= '1';    -- BEEP 신호 켜짐 (EV2가 눌린 경우)
            else
                COUNT <= COUNT;  -- 아무 신호가 없으면 카운터 유지
                BEEP_X <= '0';   -- EV2가 눌리지 않으면 BEEP 신호 꺼짐
            end if;
        end if;
    end process;

    BEEP <= BEEP_X;  -- BEEP 신호 출력
    Y <= COUNT;      -- 카운트 값 (Y0~Y3) 출력
end Behavioral;
