library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--2학년 2반 2021041064 이정일, 2학년 2021041080 정승현
--week4 jk,t 플립플롭 순차처리문

entity week4_2 is
    Port ( jk : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				t, clk : in  STD_LOGIC;
           t_q, t_qvar : BUFFER  STD_LOGIC;
           jk_q, jk_qvar : BUFFER  STD_LOGIC);
end week4_2;

architecture Behavioral of week4_2 is
begin
    process(clk)
    begin
        if rising_edge(clk) then
		  --T플립플롭
            case t is
                when '0' => t_q <= t_q; t_qvar <= t_qvar;
                when '1' => t_q <='0'; t_qvar <= '1';
                when others => t_q <= t_q; t_qvar <= t_qvar;
            end case;
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
