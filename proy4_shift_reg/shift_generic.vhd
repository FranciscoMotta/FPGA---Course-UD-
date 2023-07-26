-- Librerias 

library ieee;

use ieee.std_logic_1164.all;


-- Entidad

entity shift_generic is 

	-- Datos genericos
	
	generic (
		Long_Chain : integer := 4
	);
	
	-- Puertos de entrada o salida
	
	port (
		clock_sig: in std_logic; -- Entrada de reloj
		reset_sig: in std_logic; -- Entrada de reset_sig
		shift_ena: in std_logic; -- Entrada de enable del shift reg
		data_inpt: in std_logic; -- Entrada de datos 
		data_outp: buffer std_logic_vector (Long_Chain - 1 downto 0) -- Salida paralela
	);
	
end entity shift_generic;

-- Arquitectura 

architecture Func_Shift_Reg_Chain of shift_generic is 

begin 
	
	-- Procesos
	
	shift_process: process (clock_sig, reset_sig, shift_ena)
	
	begin
		
		-- Estamentos if
		
		if(reset_sig = '1') then
		
			data_outp <= (others => '0');
		
		else 
		
			if ((rising_edge(clock_sig)) and (reset_sig = '0')) then
			
				if (shift_ena = '1') then
				
					data_outp <= data_inpt & data_outp(data_outp'left downto 1);
					
				else 
					
					data_outp <= (others => '0');
				
				end if;
			
			end if;
		
		end if;
		
	end process shift_process;
	
end architecture Func_Shift_Reg_Chain;