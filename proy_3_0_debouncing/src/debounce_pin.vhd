-- Librerías 

library ieee;

use ieee.std_logic_1164.all; -- op logicas y multinivel
use ieee.std_logic_arith.all; -- op arith


-- Entidad 

entity debounce_pin is 
port
	(
		debounce_gpio_in	: 	in std_logic; -- Entrada del pulsador
		debounce_gpio_ck	: 	in std_logic; -- Entrada de reloj de la FPGA 50MHZ
		debounce_gpio_ou	: 	out std_logic -- Salida sin rebote
	);
end entity debounce_pin;

-- Arquitectura

architecture func_debounce of debounce_pin is
signal contador_debo : integer range 0 to 10000 := 0;
signal salida_debo : std_logic;
begin

	-- Parte secuencial

	contador_debounce: process (debounce_gpio_ck, debounce_gpio_in)
	begin
		if rising_edge (debounce_gpio_ck) then
			if debounce_gpio_in = '0' then -- boton pulsado
				if contador_debo > 9000 then -- realizamos 5000 cuentas
					salida_debo <= '1';
					contador_debo <= 0;		
				else 
					contador_debo <= contador_debo + 1;	-- Mientras no llegue a los 5k cuenta
				end if;
			else 
				salida_debo <= '0';
				contador_debo <= 0;
			end if;
		end if;
	end process contador_debounce;
	
	-- Parte concurrente
	
	debounce_gpio_ou <= salida_debo; -- Optenemos la salida del debouncer 
	
end architecture func_debounce;