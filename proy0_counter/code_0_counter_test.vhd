-- Se desarrollará un código de descripción de hardware de 
-- un contador ascendente de 4 bits

-- Librerias 

library ieee;

use ieee.std_logic_1164.all; -- Datos multinivel
use ieee.std_logic_arith.all; -- Operaciones aritmeticas
use ieee.std_logic_unsigned.all; -- Operaciones sin signo


-- Entidad 
entity code_0_counter_test is
port
	(
		-- Entradas 
		
		counter_clock: in std_logic;
		counter_reset: in std_logic;
		
		-- Salidas
		
		counter_outs: out std_logic_vector(3 downto 0);
		counter_cout: out std_logic
	);
end entity code_0_counter_test;

-- Arquitectura

architecture func_counter of code_0_counter_test is
signal signal_1_counter: std_logic_vector(3 downto 0) := (others => '0');
begin 
	contador: process(counter_clock, counter_reset)
	begin
		if rising_edge (counter_clock) then
			if (signal_1_counter = "1111") or (counter_reset = '1') then
				signal_1_counter <= (others => '0');
			else
				signal_1_counter <= signal_1_counter + 1;
			end if;
		end if;
	end process contador;
	
	-- Asignación de la señal de contador
	
	counter_outs <= signal_1_counter;
	
	-- Asignación de la señal del reloj de salidas
	
	counter_cout <= signal_1_counter(signal_1_counter'left);
	
end architecture func_counter;