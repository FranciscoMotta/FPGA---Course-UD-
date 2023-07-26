-- En el presente código se implementa una memoria RAM/ROM Dual

library ieee;

use ieee.std_logic_1164.all; -- Datos multinivel
use ieee.numeric_std.all; -- Op. Arith y Conv

-- Entidad

entity ram_rom_dual is
	
	-- Datos genéricos 
	
	generic(
		memory_data_witdh : integer := 8; -- Ancho de bus de datos 
		memory_addr_witdh : integer := 3 -- Ancho de bus de direcciones
	);
	
	-- Puertos de entrada y salida 
	
	port(
		
		-- GPIO GENERALES
		
		memory_dual_clock : in std_logic;
		
		-- PUERTO DE MEMORIA A
		
		amemory_wdata: in  std_logic_vector (memory_data_witdh - 1 downto 0);
		amemory_rdata: out std_logic_vector (memory_data_witdh - 1 downto 0);
		amemory_addrs: in  std_logic_vector (memory_addr_witdh - 1 downto 0);
		amemory_wr_re: in  std_logic;
		
		-- PUERTO DE MEMORIA B
		
		bmemory_wdata: in  std_logic_vector (memory_data_witdh - 1 downto 0);
		bmemory_rdata: out std_logic_vector (memory_data_witdh - 1 downto 0);
		bmemory_addrs: in  std_logic_vector (memory_addr_witdh - 1 downto 0);
		bmemory_wr_re: in  std_logic
		
	);
	
end entity ram_rom_dual;

-- Arquitectura

architecture func_ram_rom_dual of ram_rom_dual is

-- señales 

-- Tipos de datos 

type memory_t is array (0 to 2**memory_addr_witdh - 1) of std_logic_vector(memory_data_witdh - 1 downto 0);

-- Declaramos la memoria

signal my_memory_ram_rom : memory_t;

begin

-- Proceso de funcionamiento de la memoria

	memory_dual_process: process (memory_dual_clock)
	begin
		
		-- PUERTO DE MEMORIA "A"
		
		if (amemory_wr_re = '1') then
			
			-- Proceso de grabado de datos en la memoria puerto A
			my_memory_ram_rom(to_integer(unsigned(amemory_addrs))) <= amemory_wdata;
			
		end if;
			
		-- Proceso de lectura de datos de la memoria puerto A
		amemory_rdata <= my_memory_ram_rom(to_integer(unsigned(amemory_addrs)));
		
		-- PUERTO DE MEMORIA "B"
		
		if (bmemory_wr_re = '1') then
		
			-- Proceso de grabado de datos en la memoria puerto B
			my_memory_ram_rom(to_integer(unsigned(bmemory_addrs))) <= bmemory_wdata;
		
		end if;
		
		-- Proceso de lectura de datos de la memoria puerto B
		bmemory_rdata <= my_memory_ram_rom(to_integer(unsigned(bmemory_addrs)));
 		
	end process memory_dual_process;

end architecture func_ram_rom_dual;