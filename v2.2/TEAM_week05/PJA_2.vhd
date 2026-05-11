library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 과제 1 비동기식 RS FLIP FLOP
-- 2학년 2반 2021041080 정승현, 2학년 2반 2021041064 이정일

entity PJA_2 is
    Port ( CLK, RST, R, S : in  STD_LOGIC;
           Q : BUFFER STD_LOGIC);
end PJA_2;

architecture Behavioral of PJA_2 is
begin
	process (RST, CLK)
    begin
        if (RST = '1') then
            Q <= '0';                  -- Reset이 활성화되면 Q를 0으로 설정
        elsif rising_edge(CLK) then
            if (S = '1' and R = '0') then
                Q <= '1';              -- Set 조건 만족 시 Q를 1로 설정
            elsif (S = '0' and R = '1') then
                Q <= '0';              -- Reset 조건 만족 시 Q를 0으로 설정
            elsif (S = '1' and R = '1') then
                Q <= 'Z';              -- S와 R이 모두 1이면 비정의 상태
            end if;
        end if;
    end process;
end Behavioral;
