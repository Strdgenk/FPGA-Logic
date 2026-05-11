library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2학년 2반 2021041064 이정일, 2학년 2021041080 정승현
--week5 jk 비동기 플립플롭 
entity week5_jk_a is
    Port ( jk : in  STD_LOGIC_VECTOR (1 downto 0);
			  rst : in std_logic;
           jk_q: BUFFER  STD_LOGIC;
           clk : in  STD_LOGIC);
end week5_jk_a;

architecture Behavioral of week5_jk_a is

begin
    process(jk)
    begin
	 if (rst = '1') then jk_q <= '0';
		elsif (rising_edge(clk)) then
        -- JK 플립플롭 (비동기식 처리)
        case (jk) is
            when "00" => jk_q <= jk_q;
            when "01" => jk_q <= '0';
            when "10" => jk_q <= '1';
            when "11" => jk_q <= not jk_q;
            when others => jk_q <= jk_q;
        end case;
		  end if;
    end process;
end Behavioral;
