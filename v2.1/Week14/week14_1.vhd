library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년_2반_2021041080_정승현
-- WEEK14 4BIT 과제 1

entity week14_1 is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (5 downto 0));
end week14_1;

architecture Behavioral of week14_1 is

	signal out_Y: STD_LOGIC_VECTOR (5 downto 0);

begin
	process(A, B)
		begin
		if (A=B) then out_Y(0) <= '1'; else out_Y(0) <= '0'; end if;
		if (A/=B) then out_Y(1) <= '1'; else out_Y(1) <= '0'; end if;
		if (A>B) then out_Y(2) <= '1'; else out_Y(2) <= '0'; end if;
		if (A<B) then out_Y(3) <= '1'; else out_Y(3) <= '0'; end if;
		if (A>=B) then out_Y(4) <= '1'; else out_Y(4) <= '0'; end if;
		if (A<=B) then out_Y(5) <= '1'; else out_Y(5) <= '0'; end if;
		
	end process;
	
  Y <= NOT out_Y;


end Behavioral;
