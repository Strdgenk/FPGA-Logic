library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2학년 2반 2021041064 이정일, 2학년 2021041080 정승현
--week5 t 동기식 플립플롭 

entity week5_t is
    Port ( t : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           t_q,t_qvar : BUFFER  STD_LOGIC);
end week5_t;

architecture Behavioral of week5_t is

begin
	process(clk)
    begin
        if rising_edge(clk) then
            case t is
                when '0' => t_q <= t_q; t_qvar <= t_qvar;
                when '1' => t_q <='0'; t_qvar <= '1';
                when others => t_q <= t_q; t_qvar <= t_qvar;
            end case;
			end if;
		end process;
end Behavioral;
