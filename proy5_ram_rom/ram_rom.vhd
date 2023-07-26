-- Codigo de implementación de memorias RAM y ROM

-- Librerías 

library ieee;

use ieee.std_logic_1164.all; -- Sistemas multinivel
use ieee.numeric_std.all; -- Tipos de datos numéricos

-- Entidad 

entity ram_rom is 

	-- Elementos genéricos 
	
	generic(
		Data_Width: integer := 16; -- Longitud del bus de datos a guardar
		Addr_Width: integer := 3 -- Longitud del bus de direcciones a guardar 
		
	);
	
	-- Puertos de entrada/salida
	
	port( 
		memory_clock : in  std_logic; -- Señal de reloj de la memoria
		memory_wdata : in  std_logic_vector (Data_Width - 1 downto 0); -- Bus de datos a escribir
		memory_rdata : out std_logic_vector (Data_Width - 1 downto 0); -- Bus de datos a leer
		memory_addrs : in  std_logic_vector (Addr_Width - 1 downto 0); -- Bus de direcciones
		memory_wri_re: in  std_logic -- Selector de modo de funcionamiento	  
	);

end entity ram_rom;

-- Arquitectura 

architecture func_ram_rom of ram_rom is 

-- Creamos tipos de datos 

type memory_data_t is array (0 to 2**Addr_Width - 1) of std_logic_vector (Data_Width - 1 downto 0);

-- Explicación: Creamos un arreglo de 2**direcciones - 1 x 2**direcciones - 1 cuyos elementos son de  
-- (Data_Width - 1 downto 0) bits

-- Señales 

signal my_memory_ram : memory_data_t; -- Declaramos la memoria RAM
 
begin

-- Procesos

	Memory_Ram_Process: process (memory_clock) -- Lista de sens.
	begin
		
		if (rising_edge(memory_clock)) then
		
			-- Nota: Los índices de los arreglos deben ser enteros positivos
		
			if (memory_wri_re = '1') then
				
				-- Guardamos el dato "memory_wdata" en la posición "memory_addrs"
				my_memory_ram(to_integer(unsigned(memory_addrs))) <= memory_wdata; 
			
			else 
				-- Leemos el dato guardado en la memoria con posición "memory_addrs"
				memory_rdata <= my_memory_ram(to_integer(unsigned(memory_addrs)));
			end if;
			
		end if;
		
	end process Memory_Ram_Process;

end architecture func_ram_rom;