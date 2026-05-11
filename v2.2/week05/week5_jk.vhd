library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2학년 2반 2021041064 이정일, 2학년 2021041080 정승현
--week5 jk 동기식 플립플롭

entity week5_jk is
    Port ( jk : in  STD_LOGIC_VECTOR (1 downto 0);
           jk_q,jk_qvar : BUFFER  STD_LOGIC;
           clk : in  STD_LOGIC);
end week5_jk;

architecture Behavioral of week5_jk is

begin
process(clk)
    begin
        if rising_edge(clk) then
				--JK플립플롭
            case (jk) is
                when "00" => jk_q <= jk_q; jk_qvar <= jk_qvar;
                when "01" => jk_q <= '0'; jk_qvar <= '1';
                when "10" => jk_q <= '1'; jk_qvar <= '0';
                when "11" => jk_q <= not jk_q; jk_qvar <= not jk_qvar;
                when others => jk_q <= jk_q; jk_qvar <= jk_qvar;
            end case;
				

        end if;
    end process;
end Behavioral;
