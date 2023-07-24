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

-- DATE "07/24/2023 18:31:39"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	serialiser IS
    PORT (
	serialiser_clock : IN std_logic;
	serialiser_reset : IN std_logic;
	serialiser_shfen : IN std_logic;
	serialiser_load : IN std_logic;
	serialiser_Data : IN std_logic_vector(3 DOWNTO 0);
	serialiser_dout : OUT std_logic
	);
END serialiser;

ARCHITECTURE structure OF serialiser IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_serialiser_clock : std_logic;
SIGNAL ww_serialiser_reset : std_logic;
SIGNAL ww_serialiser_shfen : std_logic;
SIGNAL ww_serialiser_load : std_logic;
SIGNAL ww_serialiser_Data : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_serialiser_dout : std_logic;
SIGNAL \serialiser_dout~output_o\ : std_logic;
SIGNAL \serialiser_clock~input_o\ : std_logic;
SIGNAL \serialiser_shfen~input_o\ : std_logic;
SIGNAL \serialiser_Data[3]~input_o\ : std_logic;
SIGNAL \data_register~3_combout\ : std_logic;
SIGNAL \serialiser_reset~input_o\ : std_logic;
SIGNAL \serialiser_load~input_o\ : std_logic;
SIGNAL \serialiser_Data[2]~input_o\ : std_logic;
SIGNAL \data_register~2_combout\ : std_logic;
SIGNAL \serialiser_Data[1]~input_o\ : std_logic;
SIGNAL \data_register~1_combout\ : std_logic;
SIGNAL \serialiser_Data[0]~input_o\ : std_logic;
SIGNAL \data_register~0_combout\ : std_logic;
SIGNAL data_register : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_serialiser_shfen~input_o\ : std_logic;
SIGNAL ALT_INV_data_register : std_logic_vector(3 DOWNTO 1);
SIGNAL \ALT_INV_serialiser_Data[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_serialiser_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_serialiser_Data[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_serialiser_Data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_serialiser_Data[3]~input_o\ : std_logic;

BEGIN

ww_serialiser_clock <= serialiser_clock;
ww_serialiser_reset <= serialiser_reset;
ww_serialiser_shfen <= serialiser_shfen;
ww_serialiser_load <= serialiser_load;
ww_serialiser_Data <= serialiser_Data;
serialiser_dout <= ww_serialiser_dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_serialiser_shfen~input_o\ <= NOT \serialiser_shfen~input_o\;
ALT_INV_data_register(3) <= NOT data_register(3);
ALT_INV_data_register(2) <= NOT data_register(2);
ALT_INV_data_register(1) <= NOT data_register(1);
\ALT_INV_serialiser_Data[0]~input_o\ <= NOT \serialiser_Data[0]~input_o\;
\ALT_INV_serialiser_reset~input_o\ <= NOT \serialiser_reset~input_o\;
\ALT_INV_serialiser_Data[1]~input_o\ <= NOT \serialiser_Data[1]~input_o\;
\ALT_INV_serialiser_Data[2]~input_o\ <= NOT \serialiser_Data[2]~input_o\;
\ALT_INV_serialiser_Data[3]~input_o\ <= NOT \serialiser_Data[3]~input_o\;

\serialiser_dout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => data_register(0),
	devoe => ww_devoe,
	o => \serialiser_dout~output_o\);

\serialiser_clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_clock,
	o => \serialiser_clock~input_o\);

\serialiser_shfen~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_shfen,
	o => \serialiser_shfen~input_o\);

\serialiser_Data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_Data(3),
	o => \serialiser_Data[3]~input_o\);

\data_register~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_register~3_combout\ = (!\serialiser_shfen~input_o\ & \serialiser_Data[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_serialiser_shfen~input_o\,
	datab => \ALT_INV_serialiser_Data[3]~input_o\,
	combout => \data_register~3_combout\);

\serialiser_reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_reset,
	o => \serialiser_reset~input_o\);

\serialiser_load~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_load,
	o => \serialiser_load~input_o\);

\data_register[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \serialiser_clock~input_o\,
	d => \data_register~3_combout\,
	clrn => \ALT_INV_serialiser_reset~input_o\,
	ena => \serialiser_load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_register(3));

\serialiser_Data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_Data(2),
	o => \serialiser_Data[2]~input_o\);

\data_register~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_register~2_combout\ = (!\serialiser_shfen~input_o\ & ((\serialiser_Data[2]~input_o\))) # (\serialiser_shfen~input_o\ & (data_register(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_serialiser_shfen~input_o\,
	datab => ALT_INV_data_register(3),
	datac => \ALT_INV_serialiser_Data[2]~input_o\,
	combout => \data_register~2_combout\);

\data_register[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \serialiser_clock~input_o\,
	d => \data_register~2_combout\,
	clrn => \ALT_INV_serialiser_reset~input_o\,
	ena => \serialiser_load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_register(2));

\serialiser_Data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_Data(1),
	o => \serialiser_Data[1]~input_o\);

\data_register~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_register~1_combout\ = (!\serialiser_shfen~input_o\ & ((\serialiser_Data[1]~input_o\))) # (\serialiser_shfen~input_o\ & (data_register(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_serialiser_shfen~input_o\,
	datab => ALT_INV_data_register(2),
	datac => \ALT_INV_serialiser_Data[1]~input_o\,
	combout => \data_register~1_combout\);

\data_register[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \serialiser_clock~input_o\,
	d => \data_register~1_combout\,
	clrn => \ALT_INV_serialiser_reset~input_o\,
	ena => \serialiser_load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_register(1));

\serialiser_Data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serialiser_Data(0),
	o => \serialiser_Data[0]~input_o\);

\data_register~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \data_register~0_combout\ = (!\serialiser_shfen~input_o\ & ((\serialiser_Data[0]~input_o\))) # (\serialiser_shfen~input_o\ & (data_register(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_data_register(1),
	datab => \ALT_INV_serialiser_shfen~input_o\,
	datac => \ALT_INV_serialiser_Data[0]~input_o\,
	combout => \data_register~0_combout\);

\data_register[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \serialiser_clock~input_o\,
	d => \data_register~0_combout\,
	clrn => \ALT_INV_serialiser_reset~input_o\,
	ena => \serialiser_load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_register(0));

ww_serialiser_dout <= \serialiser_dout~output_o\;
END structure;


