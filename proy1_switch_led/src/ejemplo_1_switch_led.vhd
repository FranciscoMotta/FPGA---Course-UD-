-- Librerias 

library ieee;

use ieee.std_logic_1164.all;

-- Entidad

entity ejemplo_1_switch_led is 
port
	(
		button_in: in std_logic;
		led_out: out std_logic
	);
end entity ejemplo_1_switch_led;

-- Arquitectura

architecture func_led of ejemplo_1_switch_led is 
begin
	led_out <= button_in;
end architecture func_led;