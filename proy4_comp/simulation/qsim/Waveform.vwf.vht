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
-- Generated on "04/11/2023 02:41:08"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          multiplex
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY multiplex_vhd_vec_tst IS
END multiplex_vhd_vec_tst;
ARCHITECTURE multiplex_arch OF multiplex_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL entradas : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL salida_mul : STD_LOGIC;
SIGNAL selector : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT multiplex
	PORT (
	entradas : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	salida_mul : OUT STD_LOGIC;
	selector : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : multiplex
	PORT MAP (
-- list connections between master ports and signals
	entradas => entradas,
	salida_mul => salida_mul,
	selector => selector
	);
-- entradas[3]
t_prcs_entradas_3: PROCESS
BEGIN
	entradas(3) <= '1';
	WAIT FOR 80000 ps;
	entradas(3) <= '0';
	WAIT FOR 80000 ps;
	entradas(3) <= '1';
	WAIT FOR 80000 ps;
	entradas(3) <= '0';
	WAIT FOR 160000 ps;
	entradas(3) <= '1';
	WAIT FOR 80000 ps;
	entradas(3) <= '0';
	WAIT FOR 320000 ps;
	entradas(3) <= '1';
	WAIT FOR 80000 ps;
	entradas(3) <= '0';
WAIT;
END PROCESS t_prcs_entradas_3;
-- entradas[2]
t_prcs_entradas_2: PROCESS
BEGIN
	entradas(2) <= '1';
	WAIT FOR 80000 ps;
	entradas(2) <= '0';
	WAIT FOR 240000 ps;
	entradas(2) <= '1';
	WAIT FOR 160000 ps;
	entradas(2) <= '0';
	WAIT FOR 240000 ps;
	entradas(2) <= '1';
	WAIT FOR 160000 ps;
	entradas(2) <= '0';
WAIT;
END PROCESS t_prcs_entradas_2;
-- entradas[1]
t_prcs_entradas_1: PROCESS
BEGIN
	entradas(1) <= '1';
	WAIT FOR 240000 ps;
	entradas(1) <= '0';
	WAIT FOR 160000 ps;
	entradas(1) <= '1';
	WAIT FOR 80000 ps;
	entradas(1) <= '0';
	WAIT FOR 80000 ps;
	entradas(1) <= '1';
	WAIT FOR 80000 ps;
	entradas(1) <= '0';
	WAIT FOR 80000 ps;
	entradas(1) <= '1';
	WAIT FOR 80000 ps;
	entradas(1) <= '0';
	WAIT FOR 80000 ps;
	entradas(1) <= '1';
WAIT;
END PROCESS t_prcs_entradas_1;
-- entradas[0]
t_prcs_entradas_0: PROCESS
BEGIN
	entradas(0) <= '1';
	WAIT FOR 240000 ps;
	entradas(0) <= '0';
	WAIT FOR 160000 ps;
	entradas(0) <= '1';
	WAIT FOR 80000 ps;
	entradas(0) <= '0';
	WAIT FOR 80000 ps;
	entradas(0) <= '1';
	WAIT FOR 160000 ps;
	entradas(0) <= '0';
	WAIT FOR 80000 ps;
	entradas(0) <= '1';
WAIT;
END PROCESS t_prcs_entradas_0;
-- selector[1]
t_prcs_selector_1: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		selector(1) <= '0';
		WAIT FOR 160000 ps;
		selector(1) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	selector(1) <= '0';
WAIT;
END PROCESS t_prcs_selector_1;
-- selector[0]
t_prcs_selector_0: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		selector(0) <= '0';
		WAIT FOR 80000 ps;
		selector(0) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	selector(0) <= '0';
WAIT;
END PROCESS t_prcs_selector_0;
END multiplex_arch;
