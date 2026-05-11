library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041080 정승현
-- RS, D FIP-Flop

entity EX1 is
    Port ( S, R, D, CLK : in  STD_LOGIC;
           D_Q, D_QVAR : out  STD_LOGIC;
           RS_Q, RS_QVAR : BUFFER  STD_LOGIC);
end EX1;

architecture Behavioral of EX1 is

begin
	process(CLK,S,R,D)
		begin	
			if rising_edge(CLK) then
			
			if( D='0') then D_Q <= '0'; D_QVAR <='1';
				else D_Q <= '1'; D_QVAR <='0';
			end if;
			
			if(S='0' and R ='0') then RS_Q <= RS_Q; RS_QVAR <= RS_QVAR;
				elsif(S='0' and R='1') then RS_Q <='0'; RS_QVAR <='1';
				elsif(S='1' and R='0') then RS_Q <='1'; RS_QVAR <='0';
				elsif(S='1' and R='1') then RS_Q <='Z'; RS_QVAR <='Z';
			end if;
		end if;
		end process;

end Behavioral;
