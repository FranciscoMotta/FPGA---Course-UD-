-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "07/24/2023 18:31:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          serialiser
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY serialiser_vhd_vec_tst IS
END serialiser_vhd_vec_tst;
ARCHITECTURE serialiser_arch OF serialiser_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL serialiser_clock : STD_LOGIC;
SIGNAL serialiser_Data : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL serialiser_dout : STD_LOGIC;
SIGNAL serialiser_load : STD_LOGIC;
SIGNAL serialiser_reset : STD_LOGIC;
SIGNAL serialiser_shfen : STD_LOGIC;
COMPONENT serialiser
	PORT (
	serialiser_clock : IN STD_LOGIC;
	serialiser_Data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	serialiser_dout : OUT STD_LOGIC;
	serialiser_load : IN STD_LOGIC;
	serialiser_reset : IN STD_LOGIC;
	serialiser_shfen : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : serialiser
	PORT MAP (
-- list connections between master ports and signals
	serialiser_clock => serialiser_clock,
	serialiser_Data => serialiser_Data,
	serialiser_dout => serialiser_dout,
	serialiser_load => serialiser_load,
	serialiser_reset => serialiser_reset,
	serialiser_shfen => serialiser_shfen
	);

-- serialiser_clock
t_prcs_serialiser_clock: PROCESS
BEGIN
LOOP
	serialiser_clock <= '0';
	WAIT FOR 10000 ps;
	serialiser_clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_serialiser_clock;
-- serialiser_Data[3]
t_prcs_serialiser_Data_3: PROCESS
BEGIN
	serialiser_Data(3) <= '1';
	WAIT FOR 110000 ps;
	serialiser_Data(3) <= '0';
WAIT;
END PROCESS t_prcs_serialiser_Data_3;
-- serialiser_Data[2]
t_prcs_serialiser_Data_2: PROCESS
BEGIN
	serialiser_Data(2) <= '0';
WAIT;
END PROCESS t_prcs_serialiser_Data_2;
-- serialiser_Data[1]
t_prcs_serialiser_Data_1: PROCESS
BEGIN
	serialiser_Data(1) <= '1';
	WAIT FOR 110000 ps;
	serialiser_Data(1) <= '0';
WAIT;
END PROCESS t_prcs_serialiser_Data_1;
-- serialiser_Data[0]
t_prcs_serialiser_Data_0: PROCESS
BEGIN
	serialiser_Data(0) <= '0';
WAIT;
END PROCESS t_prcs_serialiser_Data_0;

-- serialiser_load
t_prcs_serialiser_load: PROCESS
BEGIN
	serialiser_load <= '0';
	WAIT FOR 50000 ps;
	serialiser_load <= '1';
	WAIT FOR 90000 ps;
	serialiser_load <= '0';
WAIT;
END PROCESS t_prcs_serialiser_load;

-- serialiser_reset
t_prcs_serialiser_reset: PROCESS
BEGIN
	serialiser_reset <= '1';
	WAIT FOR 50000 ps;
	serialiser_reset <= '0';
WAIT;
END PROCESS t_prcs_serialiser_reset;

-- serialiser_shfen
t_prcs_serialiser_shfen: PROCESS
BEGIN
	serialiser_shfen <= '0';
	WAIT FOR 150000 ps;
	serialiser_shfen <= '1';
WAIT;
END PROCESS t_prcs_serialiser_shfen;
END serialiser_arch;
