library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- team6 2학년 2반 2021041028 김호중, 2021041080 정승현
-- 과제 1

entity week14_F is
    Port ( clk : in  STD_LOGIC;
           row : in  STD_LOGIC_VECTOR (3 downto 0);
           col : inout  STD_LOGIC_VECTOR (3 downto 0);
           fnd : out  STD_LOGIC_VECTOR (7 downto 0);
           fnd_digit : out  STD_LOGIC_VECTOR (3 downto 0);
           beep : out  STD_LOGIC;
           dir : inout  STD_LOGIC;
           motor_en : out  STD_LOGIC;
           pwm_out : out  STD_LOGIC_VECTOR (2 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           addr : in  STD_LOGIC_VECTOR (2 downto 0);
           we : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (3 downto 0));
end week14_F;

architecture Behavioral of week14_F is
	-- Clock divider 컴포넌트 선언
    component clock_divider
        generic (count : integer range 0 to 50000000); -- 분주비 설정
        port (
            clk_in : in std_logic;   -- 입력 클럭 신호
            clk_out : out std_logic  -- 출력 분주 클럭 신호
        );
    end component;

    -- 내부 신호 정의
	 type reg_type is array (natural range <>) of std_logic_vector(3 downto 0); -- 4비트 레지스터 배열
    signal reg : reg_type(7 downto 0) := (others => (others => '0')); -- 초기값을 1로 설정
    signal fnd_clk : STD_LOGIC;          								-- FND 제어클럭
    signal key_clk : STD_LOGIC;          								-- 키 매트릭스 클럭
    signal pwm_clk : STD_LOGIC;          								-- PWM 제어클럭
    signal led_clk : STD_LOGIC;          								-- LED 제어클럭
    signal current_col : integer range 0 to 3 := 0; 				-- 열 활성화
    signal col_internal : STD_LOGIC_VECTOR(3 downto 0) := "1111";
    signal key_value : STD_LOGIC_VECTOR(3 downto 0) := "1111"; -- 입력 키 값
    signal key_valid : STD_LOGIC := '0';                      -- 키 입력 여부
    signal beep_signal : STD_LOGIC := '1';                   -- 내부 BEEP 신호
    signal motor_dir_signal : STD_LOGIC := '0';              -- DC 모터 방향
    signal motor_en_signal : STD_LOGIC := '0';               -- DC 모터 활성화
    signal pwm_signal : STD_LOGIC_VECTOR(2 downto 0) := "111"; -- PWM 값
    signal pwm_counter : integer range 0 to 7 := 0;           -- PWM 증가 카운터
	 signal current_color : integer range 0 to 3 := 0; 		 -- pwm 현재 색상
    signal led_state : integer range 0 to 7   := 0;             -- LED 카운터
    signal led_output : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); -- LED 출력 값

    -- FND 자리 제어용 변수
    signal fnd_digit_counter : integer range 0 to 3 := 0; -- FND의 현재 위치
    signal fnd_digit_internal : STD_LOGIC_VECTOR(3 downto 0) := "1111"; -- FND 초기 비활성 상태

    -- 키 매핑 테이블
    type key_map_type is array (0 to 3, 0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
    constant key_map : key_map_type := (
        ("1100", "1101", "1110", "1111"),  -- ROW 0: COL 0~3 (0, 1, 2, 3)
        ("1000", "1001", "1010", "1011"),  -- ROW 1: COL 0~3 (4, 5, 6, 7)
        ("0100", "0101", "0110", "0111"),  -- ROW 2: COL 0~1 (8, 9, 출력 없음, 출력 없음)
        ("0000", "0001", "0010", "0011")   -- ROW 3: 미사용
    );

    -- FND 디코딩 함수
    function fnd_decode(input : STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
    begin
        case input is
            when "0000" => return "11000000"; -- 0
            when "0001" => return "11111001"; -- 1
            when "0010" => return "10100100"; -- 2
            when "0011" => return "10110000"; -- 3
            when "0100" => return "10011001"; -- 4
            when "0101" => return "10010010"; -- 5
            when "0110" => return "10000010"; -- 6
            when "0111" => return "11111000"; -- 7
            when "1000" => return "10000000"; -- 8
            when "1001" => return "10010000"; -- 9
				when "1010" => return "10001001"; -- H
				when "1011" => return "11000000"; -- O
				when "1100" => return "10111111"; -- -
				when "1101" => return "11110001"; -- J
				when "1110" => return "11000001"; -- U
				when "1111" => return "10010001"; -- Y
            when others => return "11111111"; -- 모든 세그먼트 끔
        end case;
    end fnd_decode;

begin

    -- Clock divider 인스턴스 생성
    fnd_clock_divider : clock_divider
        generic map (count => 5000000) -- FND 제어 주파수 분주비
        port map (clk_in => clk, clk_out => fnd_clk);

    key_clock_divider : clock_divider
        generic map (count => 200000) -- 키 매트릭스 스캔 주파수 분주비
        port map (clk_in => clk, clk_out => key_clk);

    pwm_clock_divider : clock_divider
        generic map (count => 500000) -- PWM 주파수 분주비
        port map (clk_in => clk, clk_out => pwm_clk);

    led_clock_divider : clock_divider
        generic map (count => 5000000) -- LED 점등 제어용 분주비
        port map (clk_in => clk, clk_out => led_clk);

    -- FND 자리 제어 신호 생성
    process(fnd_clk)
    begin
        if rising_edge(fnd_clk) then
            if key_valid = '1' then
                case fnd_digit_counter is
                    when 0 =>
                        fnd_digit_internal <= "1110"; -- 첫 번째 자리 활성화
                        fnd_digit_counter <= 1;
                    when 1 =>
                        fnd_digit_internal <= "1101"; -- 두 번째 자리 활성화
                        fnd_digit_counter <= 2;
                    when 2 =>
                        fnd_digit_internal <= "1011"; -- 세 번째 자리 활성화
                        fnd_digit_counter <= 3;
                    when 3 =>
                        fnd_digit_internal <= "0111"; -- 네 번째 자리 활성화
                        fnd_digit_counter <= 0;
                    when others =>
                        fnd_digit_internal <= "1111"; -- 기본 상태 (비활성화)
                        fnd_digit_counter <= 0;
                end case;
            else
                fnd_digit_internal <= "1111"; -- 초기 상태에서는 모든 자리 비활성화
            end if;
        end if;
    end process;
	
	 process (clk)
    begin
        if rising_edge(clk) then
            if we = '0' then
                reg(conv_integer(addr)) <= d; -- address에 해당하는 입력값을 저장
            end if;
            q <= reg(conv_integer(addr)); -- address에 해당되는 출력값을 저장
        end if;
    end process;

    -- 자리 제어 신호 출력
    fnd_digit <= fnd_digit_internal;

   -- 키 매트릭스 스캔 및 입력 감지
process(key_clk)
begin
    if rising_edge(key_clk) then  -- 키 매트릭스 클럭 상승 에지에서 실행
        current_col <= (current_col + 1) mod 4;  -- 현재 활성화된 열을 순환 (0~3 범위)
        col_internal <= "1111";  -- 모든 열 비활성화
        col_internal(current_col) <= '0';  -- 현재 열만 활성화

        if row /= "1111" then  -- 한 행이라도 눌린 상태인지 확인
            case row is
                when "1110" => key_value <= key_map(0, current_col);  -- 첫 번째 행에서 눌린 키 매핑
                when "1101" => key_value <= key_map(1, current_col);  -- 두 번째 행에서 눌린 키 매핑
                when "1011" => key_value <= key_map(2, current_col);  -- 세 번째 행에서 눌린 키 매핑
                when "0111" => key_value <= key_map(3, current_col);  -- 네 번째 행에서 눌린 키 매핑
                when others => key_value <= "1111";  -- 기본값, 키가 눌리지 않았음을 나타냄
            end case;
            key_valid <= '1';  -- 유효한 키 입력이 감지되었음을 표시
        else
            key_valid <= '0';  -- 키 입력이 없음을 표시
        end if;

        -- BEEP 신호 제어
        if key_valid = '1' and key_value = "1010" then  -- 키 값이 "1010" (BEEP 활성화 조건)인지 확인
            beep_signal <= '0';  -- BEEP 활성화
        else
            beep_signal <= '1';  -- BEEP 비활성화
        end if;

        -- DC 모터 제어
        if key_value = "1000" then  -- 키 값이 "1000"인 경우 (모터 정방향 회전)
            motor_en_signal <= '1';  -- 모터 활성화
            motor_dir_signal <= '0';  -- 모터 방향 설정 (정방향)
        elsif key_value = "1001" then  -- 키 값이 "1001"인 경우 (모터 역방향 회전)
            motor_en_signal <= '1';  -- 모터 활성화
            motor_dir_signal <= '1';  -- 모터 방향 설정 (역방향)
        else
            motor_en_signal <= '0';  -- 모터 비활성화
            motor_dir_signal <= '0';  -- 방향 초기화
        end if;				
    end if;
end process;


    -- LED 점등 제어
process(led_clk)
begin
    if rising_edge(led_clk) then  -- LED 제어 클럭의 상승 에지에서 실행
        if key_value = "0110" then  -- 입력 키 값이 "0110"인 경우 (순차 점등)
            led_state <= (led_state + 1) mod 8;  -- LED 상태를 순차적으로 증가 (0~7 순환)
            led_output <= (others => '1');  -- 모든 LED를 기본적으로 꺼진 상태로 초기화
            led_output(led_state) <= '0';  -- 현재 상태에 해당하는 LED를 켜기
        elsif key_value = "0111" then  -- 입력 키 값이 "0111"인 경우 (역순 점등)
            led_state <= (led_state - 1) mod 8;  -- LED 상태를 역순으로 감소 (0~7 순환)
            led_output <= (others => '1');  -- 모든 LED를 기본적으로 꺼진 상태로 초기화
            led_output(led_state) <= '0';  -- 현재 상태에 해당하는 LED를 켜기
        else
            led_output <= (others => '0');  -- 다른 키 값이 입력되면 모든 LED를 끔
        end if;
    end if;
end process;

	
	 -- PWM 색상 점등 제어
-- PWM 제어 프로세스
process(pwm_clk)
begin
    if rising_edge(pwm_clk) then  -- PWM 제어 클럭의 상승 에지에서 실행
        if key_value = "0101" then  -- 입력 키 값이 "0101"인 경우 (PWM 색상 점등 제어 활성화)
            -- PWM 카운터 증가
            pwm_counter <= (pwm_counter + 1) mod 256;  -- PWM 카운터를 0~255 범위에서 증가

            -- 색상 전환 제어
            if pwm_counter = 0 then  -- PWM 카운터가 0이 될 때마다 색상 전환
                case current_color is
                    when 0 =>  -- 빨강 색상 활성화
                        pwm_signal <= "110";  -- 빨강 채널만 켜짐
                        current_color <= 1;  -- 다음 색상으로 전환
                    when 1 =>  -- 파랑 색상 활성화
                        pwm_signal <= "101";  -- 파랑 채널만 켜짐
                        current_color <= 2;  -- 다음 색상으로 전환
                    when 2 =>  -- 초록 색상 활성화
                        pwm_signal <= "011";  -- 초록 채널만 켜짐
                        current_color <= 3;  -- 다음 색상으로 전환
                    when 3 =>  -- 흰색 활성화 (모든 색상 켜짐)
                        pwm_signal <= "000";  -- 모든 채널 켜짐
                        current_color <= 0;  -- 빨강 색상으로 다시 전환
                    when others =>  -- 예외 처리
                        pwm_signal <= "111";  -- 모든 색상 끔
                        current_color <= 0;  -- 빨강 색상으로 초기화
                end case;
            end if;
        end if;
    end if;
end process;


    -- 출력 신호 연결
	col <= col_internal;  -- 내부 열 활성화 신호를 외부로 연결
	fnd <= fnd_decode(key_value);  -- 키 입력 값을 7세그먼트 디코딩 함수를 통해 FND로 출력
	beep <= beep_signal;  -- 내부 BEEP 신호를 외부 BEEP 출력으로 연결
	dir <= motor_dir_signal;  -- DC 모터 방향 신호를 외부 방향 출력으로 연결
	motor_en <= motor_en_signal;  -- DC 모터 활성화 신호를 외부 활성화 출력으로 연결
	pwm_out <= pwm_signal;  -- PWM 제어 신호를 외부 PWM 출력으로 연결
	led <= led_output;  -- LED 제어 신호를 외부 LED 출력으로 연결


end Behavioral;
