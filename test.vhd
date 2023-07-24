-- Comparadores 

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Entidad

entity test_com is 
port
(
	entradas: in std_logic_vector(3 downto 0);
	salidas: out std_logic_vector(3 downto 0)
);
end entity test_com;

-- Salidas 

architecture fn_comp of test_com is 
-- Señales 
	signal A : integer range 0 to 255 := 0;
	signal B : integer range 0 to 255 := 0;
	signal sl_comp : std_logic;
begin
	-- Procesos
	
	mi_comparador: process (A, B)
	begin 
		if A > B then 
			sl_comp <= '1';
		else 
			sl_comp <= '0';
		end if;
	end process mi_comparador;
end architecture fn_comp;