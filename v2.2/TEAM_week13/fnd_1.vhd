library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- CLOCK DIVIDER 사용
-- 실습 1

entity fnd_1 is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           fnd : out  STD_LOGIC_VECTOR (7 downto 0));
end fnd_1;

architecture Behavioral of fnd_1 is
	function fnd_disnum(cnt : integer range 0 to 16) return std_logic_vector is
		variable seg_decode : std_logic_vector(7 downto 0);
		begin
			case cnt is
				when 0 => seg_decode := "11000000";
				when 1 => seg_decode := "11111001";
				when 2 => seg_decode := "10100100";
				when 3 => seg_decode := "10110000";
				when 4 => seg_decode := "10011001";
				when 5 => seg_decode := "10010010";
				when 6 => seg_decode := "10000010";
				when 7 => seg_decode := "11111000";
				when 8 => seg_decode := "10000000";
				when 9 => seg_decode := "10010000";
				when 10 => seg_decode := "10001000";
				when 11 => seg_decode := "10000011";
				when 12 => seg_decode := "11000110";
				when 13 => seg_decode := "10100001";
				when 14 => seg_decode := "10000110";
				when 15 => seg_decode := "10001110";
				when others => seg_decode := "11111111";
			end case;
		return (seg_decode);
	end fnd_disnum;
	-- clock generator
	component clock_divider
		generic(count : integer range 0 to 50000000);
		port (clk_in : in std_logic;
				clk_out : out std_logic);
				end component;
				
				signal delay_clock : std_logic;
begin
	
	fnd_clk : clock_divider generic map(50000) port map (clk, delay_clock);
	
	process(delay_clock)
		variable temp : integer range 0 to 3 := 0;
			begin
				if rising_edge(delay_clock) then
					case temp is
						when 0 => temp := 1; fnd <= fnd_disnum(0); q <= "1110";
						when 1 => temp := 2; fnd <= fnd_disnum(1); q <= "1101";
						when 2 => temp := 3; fnd <= fnd_disnum(2); q <= "1011";
						when 3 => temp := 0; fnd <= fnd_disnum(3); q <= "0111";
						when others => fnd <= fnd_disnum(16); q <= "1111";
					end case;
				end if;
			end process;
end Behavioral;
