-- Librerias 

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- Entidad 

entity pwm_generation is 
port
 (
	pwm_clock_in	: 	in std_logic; -- Entrada de reloj del pwm
	pwm_output		: 	out std_logic -- Salida de la señal pwm
 );
end entity pwm_generation;

-- Arquitectura 

architecture func_pwm of pwm_generation is 

-- Signals

signal contador_pwm : integer range 0 to 50000000;

begin
	counter_pwm: process (pwm_clock_in) -- Proceso del contador
	begin
		if rising_edge (pwm_clock_in) then
			
			-- Contador 
			
			if contador_pwm > 49999999 then
				contador_pwm  <= 0;
			else 
				contador_pwm <= contador_pwm + 1;
			end if;
			
			-- Salida PWM
			
			if contador_pwm > 25000000 then
				pwm_output <= '1';
			else
				pwm_output <= '0';
			end if;
			
		end if;
	end process counter_pwm;
end architecture func_pwm;