library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- week13 실습 2 EV
-- 2학년_2반_2021041080_정승현

entity week13_encoder_1 is
    Port ( X : in  STD_LOGIC_VECTOR (7 downto 0);
           EV : in  STD_LOGIC_VECTOR (3 downto 0);
           FND : out  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (2 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end week13_encoder_1;

architecture Behavioral of week13_encoder_1 is

	signal Z :STD_LOGIC_VECTOR (2 downto 0);

begin

	PROCESS(EV)
	BEGIN
		IF(EV(0)='0') THEN Q <= "0111";
		ELSIF(EV(1) ='0') THEN Q <= "1011";
		ELSIF(EV(2) ='0') THEN Q <= "1101";
		ELSIF(EV(3) ='0') THEN Q <= "1110";
		ELSE Q <="1111";
		END IF;
		END PROCESS;
		
		PROCESS(X) --입력신호 스위치 X 감지
BEGIN
IF X(7)='1' THEN Z<="111"; FND<="00011111"; --LED->7, FND->7
ELSIF X(6)='1' THEN Z<="110"; FND<="01000001"; --LED->6, FND->6
ELSIF X(5)='1' THEN Z<="101"; FND<="01001001"; --LED->5, FND->5
ELSIF X(4)='1' THEN Z<="100"; FND<="10011001"; --LED->4, FND->4
ELSIF X(3)='1' THEN Z<="011"; FND<="00001101"; --LED->3, FND->3
ELSIF X(2)='1' THEN Z<="010"; FND<="00100101"; --LED->2, FND->2
ELSIF X(1)='1' THEN Z<="001"; FND<="10011111"; --LED->1, FND->1
ELSIF X(0)='1' THEN Z<="000"; FND<="00000011"; --LED->0, FND->0
ELSE Z<="ZZZ"; FND<="11111111";--LED->OFF, FND->OFF
END IF;
END PROCESS;
Y<= NOT Z;
		


end Behavioral;
