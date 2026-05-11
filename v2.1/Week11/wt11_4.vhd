library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week11 연습문제 4
-- 2학년_2반_2021041080_정승현

entity wt11_4 is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC);
end wt11_4;

architecture Behavioral of wt11_4 is

	signal A, B, Y : STD_LOGIC;

begin

	A <= X(3); B <= X(0);
	state_process : process(X, A, B, Y)
	begin
		if(x(2) = '1') then Y <= A;
		elsif(x(2 downto 1) = "01") then Y <= B;
		else
			Y <= 'Z';
		end if;
	end process;
	
	O <= NOT Y;
	

end Behavioral;
