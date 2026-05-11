library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--2학년 2반 2021041064 이정일, 2학년 2021041080 정승현
--week5 t 비동기식 플립플롭 


entity week5_jk_t_a is
    Port ( t : in  STD_LOGIC;
           clk,rst : in  STD_LOGIC;
           q : BUFFER  STD_LOGIC);
end week5_jk_t_a;

architecture Behavioral of week5_jk_t_a is

begin
	process(t)
	begin
			if(rst = '0') then q<= '0';
					elsif(rising_edge(clk)) then
		case t is
			when '0' => q <= q;
			when '1' => q <= not q;
			when others => q <= q;
		end case;
			end if;
	end process;

end Behavioral;
