-- Librerias 

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Entidad 

entity servo_pwm is 
	port
	(
		ser_pwm_clock_in	: 	in std_logic;								-- entrada de señal de reloj 50Mhz
		ser_pwm_selec_an	: 	in std_logic_vector (1 downto 0); 	-- 1 for up and 0 for down
		ser_pwm_disp_seg	: 	out std_logic_vector (6 downto 0);	-- Salida para los displays de 7 segmentos
		ser_pwm_disp_ena	:	out std_logic_vector (2 downto 0); 	-- Salida para los enables del displays
		ser_pwm_servo_out	: 	out std_logic								-- Salida de la señal PWM para el servo
	);
end entity servo_pwm;

-- Arquitectura 

architecture func_servo_pwm of servo_pwm is 

-- Constantes 

constant cuentas_1khz : integer := 50_000;

-- Señales

signal ang_sum_debounce		: 	std_logic;
signal ang_res_debounce		: 	std_logic;
signal contador_2_bits		: 	std_logic_vector(1 downto 0) := "00";
signal contador_1khz			: 	integer range 0 to 50_000 := 0;
signal clock_1khz				: 	std_logic;
signal value_to_inc_dec		:	integer range 0 to 180 := 140;
signal salida_multiplex		:  std_logic_vector (3 downto 0);

-- Desarrollo

begin

	-- Componentes
	
	unidad_1: entity work.debounce_pin(func_debounce) -- Antirrebote del primer boton
				port map 
				(
					debounce_gpio_in	=> ser_pwm_selec_an(ser_pwm_selec_an'left), -- Primer boton arr(1)
 					debounce_gpio_ck	=>	ser_pwm_clock_in, -- entrada de reloj
					debounce_gpio_ou	=> ang_sum_debounce
				);
				
	unidad_2: entity work.debounce_pin(func_debounce) -- Antirrebote del segundo boton
				port map 
				(
					debounce_gpio_in	=> ser_pwm_selec_an(ser_pwm_selec_an'right), -- segundo boton arr(0)
					debounce_gpio_ck	=>	ser_pwm_clock_in, -- entrada de reloj
					debounce_gpio_ou	=> ang_res_debounce
				);

	-- Divisor de frecuencia a 1000khz
	-- F_cpu = 50_000_000 hz - F_des = 1_000 hz
	-- Cuentas = 50_000 
	
	div_freq_1khz: process (ser_pwm_clock_in)
	begin
		if rising_edge (ser_pwm_clock_in) then
			if contador_1khz = (cuentas_1khz - 1) then 
				contador_1khz <= 0;
				clock_1khz <= '1';
			else
				contador_1khz <= contador_1khz + 1;
				clock_1khz <= '0';
			end if;
		end if;
	end process div_freq_1khz;
	
	-- Con este contador de 1khz haremos la conmutación de los enables
	
	conmuta_enables: process (clock_1khz)
	begin
		if rising_edge (clock_1khz) then
			if contador_2_bits = "11" then
				contador_2_bits <= (others => '0');
			else
				contador_2_bits <= contador_2_bits + 1;
			end if;
		end if;
	end process conmuta_enables;
				
	-- Primero presentamos los valores fijos para ver si funciona
	
	show_data: process (contador_2_bits) 
	begin
		case (contador_2_bits) is
			when "00" =>
				ser_pwm_disp_ena <= "110"; -- Unidades
				salida_multiplex <= "0001";
			when "01" =>
				ser_pwm_disp_ena <= "101"; -- Decenas
				salida_multiplex <= "0010";
			when "10" =>
				ser_pwm_disp_ena <= "011";	-- Centenas
				salida_multiplex <= "0011";
			when others =>
				ser_pwm_disp_ena <= "111"; -- Ninguno prende
		end case;
	end process show_data;
	
	
	with salida_multiplex select ser_pwm_disp_seg <=	"0000001" when "0000", -- 0
																		"1001111" when "0001", -- 1
																		"0010010" when "0010", -- 2
																		"0000110" when "0011", -- 3
																		"1001100" when "0100", -- 4
																		"0100100" when "0101", -- 5
																		"0100000" when "0110", -- 6
																		"0001111" when "0111", -- 7
																		"0000000" when "1000", -- 8
																		"0000100" when others; -- 9
	
	-- Incrementador y decrementador de angulo, esto se hará cada pulsacion del boton o cada 500ms si se mantiene
	
	ser_pwm_servo_out <= '0';
	
end architecture func_servo_pwm;