library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2019041073 손대영, 2학년 2반 2021041080 정승현

entity WEEK7_1_3 is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0, Y1, Y2, Y3 : out  STD_LOGIC);
end WEEK7_1_3;

architecture Behavioral of WEEK7_1_3 is
	
	signal S1,S2,S3,S4,S5,S6,S7:std_logic; --내부신호 선언

begin

all_proc:process(X2,X1,X0)
begin
	if(X2='0' and X1='0' and X0='0')then S1<='1'; S2<='1'; S3<='0'; S4<='1'; S5<='1'; S6<='1'; S7<='0';
	elsif(X2='0' and X1='0' and X0='1')then S1<='1'; S2<='1'; S3<='0'; S4<='0'; S5<='1'; S6<='1'; S7<='1';
	elsif(X2='0' and X1='1' and X0='0')then S1<='1'; S2<='0'; S3<='0'; S4<='0'; S5<='1'; S6<='1'; S7<='0';
	elsif(X2='0' and X1='1' and X0='1')then S1<='1'; S2<='0'; S3<='0'; S4<='0'; S5<='1'; S6<='0'; S7<='1';
	elsif(X2='1' and X1='0' and X0='0')then S1<='0'; S2<='1'; S3<='1'; S4<='0'; S5<='1'; S6<='1'; S7<='1';
	elsif(X2='1' and X1='0' and X0='1')then S1<='0'; S2<='1'; S3<='1'; S4<='0'; S5<='1'; S6<='1'; S7<='1';
	elsif(X2='1' and X1='1' and X0='0')then S1<='0'; S2<='0'; S3<='0'; S4<='0'; S5<='1'; S6<='1'; S7<='0';
	else S1<='0'; S2<='0'; S3<='0'; S4<='0'; S5<='0'; S6<='1'; S7<='1';
	end if;
end process;

Y3 <= NOT S7; Y2 <= NOT S6; Y1 <= NOT S5; Y0 <= NOT S4;

end Behavioral;
