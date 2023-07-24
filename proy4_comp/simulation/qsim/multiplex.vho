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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "04/11/2023 02:41:09"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	multiplex IS
    PORT (
	entradas : IN std_logic_vector(3 DOWNTO 0);
	selector : IN std_logic_vector(1 DOWNTO 0);
	salida_mul : OUT std_logic
	);
END multiplex;

ARCHITECTURE structure OF multiplex IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_entradas : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_selector : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_salida_mul : std_logic;
SIGNAL \salida_mul~output_o\ : std_logic;
SIGNAL \entradas[3]~input_o\ : std_logic;
SIGNAL \entradas[1]~input_o\ : std_logic;
SIGNAL \selector[0]~input_o\ : std_logic;
SIGNAL \selector[1]~input_o\ : std_logic;
SIGNAL \entradas[2]~input_o\ : std_logic;
SIGNAL \entradas[0]~input_o\ : std_logic;
SIGNAL \salida_mul~0_combout\ : std_logic;
SIGNAL \salida_mul~1_combout\ : std_logic;

BEGIN

ww_entradas <= entradas;
ww_selector <= selector;
salida_mul <= ww_salida_mul;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\salida_mul~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \salida_mul~1_combout\,
	devoe => ww_devoe,
	o => \salida_mul~output_o\);

\entradas[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradas(3),
	o => \entradas[3]~input_o\);

\entradas[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradas(1),
	o => \entradas[1]~input_o\);

\selector[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_selector(0),
	o => \selector[0]~input_o\);

\selector[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_selector(1),
	o => \selector[1]~input_o\);

\entradas[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradas(2),
	o => \entradas[2]~input_o\);

\entradas[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entradas(0),
	o => \entradas[0]~input_o\);

\salida_mul~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \salida_mul~0_combout\ = (\selector[0]~input_o\ & (\selector[1]~input_o\)) # (!\selector[0]~input_o\ & ((\selector[1]~input_o\ & (\entradas[2]~input_o\)) # (!\selector[1]~input_o\ & ((\entradas[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selector[0]~input_o\,
	datab => \selector[1]~input_o\,
	datac => \entradas[2]~input_o\,
	datad => \entradas[0]~input_o\,
	combout => \salida_mul~0_combout\);

\salida_mul~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \salida_mul~1_combout\ = (\selector[0]~input_o\ & ((\salida_mul~0_combout\ & (\entradas[3]~input_o\)) # (!\salida_mul~0_combout\ & ((\entradas[1]~input_o\))))) # (!\selector[0]~input_o\ & (((\salida_mul~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entradas[3]~input_o\,
	datab => \entradas[1]~input_o\,
	datac => \selector[0]~input_o\,
	datad => \salida_mul~0_combout\,
	combout => \salida_mul~1_combout\);

ww_salida_mul <= \salida_mul~output_o\;
END structure;


