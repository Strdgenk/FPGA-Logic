library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- 2학년 2반 2021041064 이정일 2021041080 정승현
-- counter load
-- synchronous reset

entity week6_4_1 is
    Port ( reset, clk : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0);
           beep : out  STD_LOGIC;
           load : in  STD_LOGIC);
end week6_4_1;

architecture Behavioral of week6_4_1 is
    signal count : std_logic_vector(3 downto 0) := "0000";
    signal beep_x : std_logic := '1';
begin

process (clk, reset, load)
begin
--비동기
    if reset = '0' then
        count <= "1111";  
        beep_x <= '1';   
    elsif load = '0' then
        count <= "0000";  
        beep_x <= '0';  
--동기		  
    elsif rising_edge(clk) then
        if (reset = '1' and load = '1') then
            count <= count + 1;  -- 클럭 상승 엣지에서 카운트 증가
        end if;
    end if;
end process;

beep <= beep_x;
y <= count;
end Behavioral;
