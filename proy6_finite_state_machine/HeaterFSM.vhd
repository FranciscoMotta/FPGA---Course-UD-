-- Implementación de una maquina de estado finita para el control de un calentador 

library ieee;

use ieee.std_logic_1164.all; -- Librería multinivel

-- Entidad 

entity HeaterFSM is 
	port(
		fsm_clock : in std_logic;
		fsm_reset : in std_logic;
		fsm_switch: in std_logic;
		fsm_tempe : in std_logic;
		fsm_heater: out std_logic;
		fsm_r_led : out std_logic;
		fsm_g_led : out std_logic
	);
end entity HeaterFSM;

-- Arquitectura 

architecture Func_HeaterFSM of HeaterFSM is

-- Tipos de datos

type FSM_State_Type is (IDLE, HEATING, READY);

-- Señales 

signal FSM_state : FSM_State_Type;

begin
	
	-- Proceso de funcionamiento de la maquina de estados
	fsm_state_machine: process (fsm_clock, fsm_reset)
	begin
		
		if (fsm_reset = '1') then 
		
			-- Reiniciamos la FSM y las salidas de la misma
			fsm_g_led  <= '0';
			fsm_r_led  <= '0';
			fsm_heater <= '0';
			FSM_state  <= IDLE;
		
		elsif (rising_edge(fsm_clock)) then 
		
			case fsm_state is
				
				when IDLE => -- Estado de espera de la FSM
				
					fsm_g_led <= '0';
					fsm_r_led <= '0';
					fsm_heater <= '0';
					
					if (fsm_switch <= '1') then
						
						-- Pasamos al siguiente estado de la FSM
						FSM_State <= HEATING;
						
					end if;
				
				when HEATING => -- Estado de inicio de calefaccion
					
					fsm_g_led <= '0';
					fsm_r_led <= '1';
					fsm_heater <= '1';
					
					if (fsm_switch <= '1') then
						
						-- Pasamos al siguiente estado de la FSM
						FSM_State <= READY;
					else 
						-- Regresamos al estado anterior
						FSM_state <= IDLE;
					end if;
					
				when READY => -- Estado de calefaccion completada
				
					fsm_g_led <= '1';
					fsm_r_led <= '0';
					fsm_heater <= '0';
					
					if (fsm_switch <= '0') then
						-- Si dejamos de presionar el sw se regresa al estado de espera
						FSM_state <= IDLE;
					
					end if;
				
				WHEN others => FSM_state <= IDLE;
			
			end case;
		
		end if;
		
	end process fsm_state_machine;
	
end architecture Func_HeaterFSM;