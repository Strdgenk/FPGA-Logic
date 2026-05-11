library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all; -- 덧셈연산

-- week10 과제3(실습1 로드기능 응용)
-- 2학년 2반 2021041028 김호중, 2021041080 정승현

entity week10_practice1 is
    Port ( RST, CLK, LOAD : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           SEG : out  STD_LOGIC_VECTOR (7 downto 0);
			  PWM : out  STD_LOGIC_VECTOR (2 downto 0));
end week10_practice1;

architecture Behavioral of week10_practice1 is
	 signal COUNT1 : std_logic_vector (3 downto 0);
begin
	upcount : process(clk, rst, LOAD)
    begin
		if (LOAD = '1') then
		  PWM <= "111";
        if (rising_edge(clk)) then
            if (rst='0') then count1 <= "0000";
            else count1 <= count1 + 1;
            end if;
        end if;
	   elsif (LOAD = '0') then
		  PWM <= "000";
		  if (rising_edge(clk)) then
            if (rst='0') then count1 <= "0000";
            else count1 <= count1 + 1;
            end if;
        end if;
		end if;
    end process;

    Q <= "1110"; -- Q0 on
    SEG <= "01000000" when (count1 = "0000") else -- 0
           "01111001" when (count1 = "0001") else -- 1
           "00100100" when (count1 = "0010") else -- 2
           "00110000" when (count1 = "0011") else -- 3
           "00011001" when (count1 = "0100") else -- 4
           "00010010" when (count1 = "0101") else -- 5
           "00000010" when (count1 = "0110") else -- 6
           "01111000" when (count1 = "0111") else -- 7
           "00000000" when (count1 = "1000") else -- 8
           "00010000" when (count1 = "1001") else -- 9
           "00001000" when (count1 = "1010") else -- A
           "00000011" when (count1 = "1011") else -- B
           "01000110" when (count1 = "1100") else -- C
           "00100001" when (count1 = "1101") else -- D
           "00000110" when (count1 = "1110") else -- E
           "00001110" when (count1 = "1111") else -- F
           "01111111" ; 
end Behavioral;
