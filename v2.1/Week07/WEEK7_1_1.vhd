library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2019041073 손대영, 2학년 2반 2021041080 정승현

entity WEEK7_1_1 is
    Port ( X0, X1, X2 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC);
end WEEK7_1_1;

architecture Behavioral of WEEK7_1_1 is

	signal s1,s2,s3,s4:std_logic; --내부신호 선언
	
begin

all_proc:process(X2,X1,X0) 
begin

	if(X2='0' and X1='0' and X0='0')then s1<='1'; s2<='0'; s3<='0'; s4<='0';
		elsif(X2='0' and X1='0' and X0='1')then s1<='1';s2<='0';s3<='0';s4<='0';
		elsif(X2='0' and X1='1' and X0='0')then s1<='0';s2<='0';s3<='0';s4<='0';
		elsif(X2='0' and X1='1' and X0='1')then s1<='0';s2<='1';s3<='0';s4<='1';
		elsif(X2='1' and X1='0' and X0='0')then s1<='1';s2<='0';s3<='1';s4<='1';
		elsif(X2='1' and X1='0' and X0='1')then s1<='1';s2<='0';s3<='1';s4<='1';
		elsif(X2='1' and X1='1' and X0='0')then s1<='0';s2<='0';s3<='0';s4<='0';
		else s1<='0';s2<='1';s3<='0';s4<='1';
		end if;
end process;

Y0<=NOT s4;

end Behavioral;
