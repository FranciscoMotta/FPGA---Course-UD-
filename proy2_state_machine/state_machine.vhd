-- Librerias 

library ieee;

use ieee.std_logic_1164.all;

-- Entidad

entity state_machine is 
port
	(
	-- Entradas 
		state_mach_clock: in std_logic;
		STAte_mach_areset: in std_logic;
		state_mach_switchs: in std_logic_vector(3 downto 1);
	-- Salidas     
		state_mach_outs: out std_logic_vector (3 downto 1)
	);
end entity state_machine;

-- Arquitectura

architecture func_state_machine of state_machine is 

type state_mach_data_type is (STATE1, STATE2, STATE3);
signal state_mach_var : STAte_mach_data_type;
signal state_mach_25mhz_clock : std_logic;
-- Componentes

component PLL is
	port
	(
		areset		: in std_logic  := '0';
		inclk0		: in std_logic  := '0';
		c0		      : out std_logic 
	);
end component PLL;

begin

	-- COMPONENTE

	PLL1: PLL
	port map
	(
		areset	=> not(state_mach_areset),
		inclk0	=> state_mach_clock,
		c0		   => state_mach_25mhz_clock
	);

	-- PROCESOS

	state_machine_process: process (state_mach_25mhz_clock, state_mach_areset)
	begin
		if state_mach_areset = '0' then
			state_mach_var <= STATE1;
			state_mach_outs <= "110";
		elsif rising_edge (state_mach_25mhz_clock) then
			case state_mach_var is 
				when STATE1 => -- primer estado
					state_mach_outs <= "110"; -- led1 on
					if state_mach_switchs(1) = '0' then
						state_mach_var <= STATE2;
					end if;
				when STATE2 => -- segundo estado
					state_mach_outs <= "101"; -- led2 on
					if state_mach_switchs(2) = '0' then
						state_mach_var <= STATE3;
					end if;
				when STATE3 => -- tercer estado
					state_mach_outs <= "011"; -- led3 on
					if state_mach_switchs(3) = '0' then
						state_mach_var <= STATE1;
					end if;
				when others => -- estado default
					state_mach_var <= STATE1;
			end case;
		end if;
	end process state_machine_process;
end architecture func_state_machine;