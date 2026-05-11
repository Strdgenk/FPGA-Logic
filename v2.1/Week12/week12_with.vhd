library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity week12_with is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Sdo, Cbo : out  STD_LOGIC);
end week12_with;

architecture Behavioral of week12_with is

	signal sdcb : std_logic_vector (1 downto 0);

begin
	with X select
	sdcb<="00" when "000" | "100" | "111",
	"01"when "001" | "010" | "110",
	"10"when "011",
	"11"when others;

	sdo<=not sdcb(0); cbo<=not sdcb(1);

end Behavioral;
