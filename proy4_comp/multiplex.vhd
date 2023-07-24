-- Multiplex

-- Librerias

library ieee;

-- Paquetes

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Entidad

entity multiplex is 
port
	(
		entradas: in std_logic_vector (3 downto 0);
		selector: in std_logic_vector(1 downto 0);
		clock_in: in std_logic;
		reset_in: in std_logic;
		salida_mul: out std_logic
	);
end entity multiplex;

-- Arquitecture

architecture fn_multiplex of multiplex is

signal sal_prev : std_logic := '0';
signal sal_ffd	 : std_logic := '0';
begin
	-- Procesos: Selector
	mi_proceso: process (entradas, selector)
	begin
		if selector = "00" then
			sal_prev <= entradas(0);
		elsif selector = "01" then
			sal_prev <= entradas(1);
		elsif selector <= "10" then 
			sal_prev <= entradas(2);
		else
			sal_prev <= entradas(3);
		end if;
	end process mi_proceso;
	
	-- Proceso: FF tipo D
	
	ff_tipoD: process(clock_in, reset_in)
	begin
		if reset_in = '1' then
			sal_ffd <= sal_prev and '0';
		else 
			if rising_edge(clock_in) then
				sal_ffd <= sal_prev;
			end if;
		end if;
	end process ff_tipoD;
	
	-- Concurrentes
	
	salida_mul <= sal_ffd;
	
end architecture fn_multiplex;