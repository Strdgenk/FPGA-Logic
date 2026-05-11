library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2학년 2반 2021041080 정승현
--4BIT 멀티플렉서_순차처리문 IF_ELSLF

entity EX1 is
    Port ( X0 : in  STD_LOGIC;
           X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           X4 : in  STD_LOGIC;
           X5 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC);
end EX1;

architecture Behavioral of EX1 is

	signal se1 : std_logic_vector(1 downto 0);

begin
	se1 <= X5 & X4;
	process (se1, X0, X1, X2, X3)
	begin
		if(se1 = "00") then
			Y0 <= X0;
		elsif(se1 = "01") then
			Y0 <= X1;
		elsif(se1 = "10") then
			Y0 <= X2;
		elsif(se1 = "11") then
			Y0 <= X3;
		else
			Y0 <= '1';
		end if;
		
	end process;


end Behavioral;
