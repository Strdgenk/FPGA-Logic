library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2학년 2반 2021041028 김호중, 2021041080 정승현
-- 7세그먼트 디스플레이 동적제어
-- 실습 2

entity fnd_2 is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           fnd : out  STD_LOGIC_VECTOR (7 downto 0));
end fnd_2;

architecture Behavioral of fnd_2 is
	function fnd_disnum(cnt : integer range 0 to 12) return std_logic_vector is
		variable seg_decode : std_logic_vector(7 downto 0);
		begin
			case cnt is
            when 0 => seg_decode := "11111110";
            when 1 => seg_decode := "11111110";
            when 2 => seg_decode := "11111110";
            when 3 => seg_decode := "11111110";
            when 4 => seg_decode := "11011111";
            when 5 => seg_decode := "11101111";
            when 6 => seg_decode := "11110111";
            when 7 => seg_decode := "11110111";
            when 8 => seg_decode := "11110111";
            when 9 => seg_decode := "11110111";
            when 10 => seg_decode := "11111011";
            when 11 => seg_decode := "11111101";
            when others => seg_decode := "11111111";
        end case;
        return (seg_decode);
    end fnd_disnum;
	 
	 -- Clock generator
    component clock_divider2
        generic (count : integer range 0 to 50000000);
        port (
            clk_in : in std_logic;
            clk_out : out std_logic
        );
    end component;

    signal temp : integer range 0 to 12 := 0;
    signal delay_clock : std_logic;
begin
    
    fnd_out : clock_divider2 generic map(5000000) port map(CLK, delay_clock);

    process (delay_clock)
    begin
        if rising_edge(delay_clock) then
            case temp is
                when 0 => temp <= 1; FND <= fnd_disnum(0); Q <= "1110";
                when 1 => temp <= 2; FND <= fnd_disnum(1); Q <= "1101";
                when 2 => temp <= 3; FND <= fnd_disnum(2); Q <= "1011";
                when 3 => temp <= 4; FND <= fnd_disnum(3); Q <= "0111";
                when 4 => temp <= 5; FND <= fnd_disnum(4); Q <= "0111";
                when 5 => temp <= 6; FND <= fnd_disnum(5); Q <= "0111"; 
                when 6 => temp <= 7; FND <= fnd_disnum(6); Q <= "0111"; 
                when 7 => temp <= 8; FND <= fnd_disnum(7); Q <= "1011"; 
                when 8 => temp <= 9; FND <= fnd_disnum(8); Q <= "1101"; 
                when 9 => temp <= 10; FND <= fnd_disnum(9); Q <= "1110"; 
                when 10 => temp <= 11; FND <= fnd_disnum(10); Q <= "1110"; 
                when 11 => temp <= 0; FND <= fnd_disnum(11); Q <= "1110"; 
                when others => FND <= fnd_disnum(12); Q <= "1111"; 
            end case;
        end if;
    end process;
end Behavioral;
