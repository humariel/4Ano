-- Copyright (C) 2019  Intel Corporation. All rights reserved.
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
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "11/16/2019 02:06:00"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	HAD_ENCODER_PARALLEL IS
    PORT (
	m : IN std_logic_vector(3 DOWNTO 0);
	code : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END HAD_ENCODER_PARALLEL;

-- Design Ports Information
-- code[0]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[1]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[2]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[3]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[4]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[5]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[6]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[7]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[1]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[0]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[3]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF HAD_ENCODER_PARALLEL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_m : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_code : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \m[1]~input_o\ : std_logic;
SIGNAL \m[2]~input_o\ : std_logic;
SIGNAL \m[0]~input_o\ : std_logic;
SIGNAL \m[3]~input_o\ : std_logic;
SIGNAL \code7|y~combout\ : std_logic;
SIGNAL \code6|y~combout\ : std_logic;
SIGNAL \code5|y~0_combout\ : std_logic;
SIGNAL \code4|y~combout\ : std_logic;
SIGNAL \code3|y~combout\ : std_logic;
SIGNAL \m1m3|y~combout\ : std_logic;
SIGNAL \m0m3|y~combout\ : std_logic;
SIGNAL \ALT_INV_m[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_m[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_m[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_m[2]~input_o\ : std_logic;

BEGIN

ww_m <= m;
code <= ww_code;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_m[3]~input_o\ <= NOT \m[3]~input_o\;
\ALT_INV_m[0]~input_o\ <= NOT \m[0]~input_o\;
\ALT_INV_m[1]~input_o\ <= NOT \m[1]~input_o\;
\ALT_INV_m[2]~input_o\ <= NOT \m[2]~input_o\;

-- Location: IOOBUF_X89_Y35_N45
\code[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code7|y~combout\,
	devoe => ww_devoe,
	o => ww_code(0));

-- Location: IOOBUF_X89_Y36_N56
\code[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code6|y~combout\,
	devoe => ww_devoe,
	o => ww_code(1));

-- Location: IOOBUF_X89_Y38_N56
\code[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code5|y~0_combout\,
	devoe => ww_devoe,
	o => ww_code(2));

-- Location: IOOBUF_X89_Y37_N56
\code[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code4|y~combout\,
	devoe => ww_devoe,
	o => ww_code(3));

-- Location: IOOBUF_X89_Y36_N22
\code[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \code3|y~combout\,
	devoe => ww_devoe,
	o => ww_code(4));

-- Location: IOOBUF_X89_Y37_N22
\code[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \m1m3|y~combout\,
	devoe => ww_devoe,
	o => ww_code(5));

-- Location: IOOBUF_X89_Y35_N96
\code[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \m0m3|y~combout\,
	devoe => ww_devoe,
	o => ww_code(6));

-- Location: IOOBUF_X89_Y35_N79
\code[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \m[0]~input_o\,
	devoe => ww_devoe,
	o => ww_code(7));

-- Location: IOIBUF_X89_Y36_N38
\m[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_m(1),
	o => \m[1]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\m[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_m(2),
	o => \m[2]~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\m[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_m(0),
	o => \m[0]~input_o\);

-- Location: IOIBUF_X89_Y37_N38
\m[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_m(3),
	o => \m[3]~input_o\);

-- Location: LABCELL_X88_Y36_N0
\code7|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \code7|y~combout\ = ( \m[0]~input_o\ & ( \m[3]~input_o\ & ( !\m[1]~input_o\ $ (!\m[2]~input_o\) ) ) ) # ( !\m[0]~input_o\ & ( \m[3]~input_o\ & ( !\m[1]~input_o\ $ (\m[2]~input_o\) ) ) ) # ( \m[0]~input_o\ & ( !\m[3]~input_o\ & ( !\m[1]~input_o\ $ 
-- (\m[2]~input_o\) ) ) ) # ( !\m[0]~input_o\ & ( !\m[3]~input_o\ & ( !\m[1]~input_o\ $ (!\m[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010110100101101001010101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_m[1]~input_o\,
	datac => \ALT_INV_m[2]~input_o\,
	datae => \ALT_INV_m[0]~input_o\,
	dataf => \ALT_INV_m[3]~input_o\,
	combout => \code7|y~combout\);

-- Location: LABCELL_X88_Y36_N9
\code6|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \code6|y~combout\ = ( \m[0]~input_o\ & ( !\m[2]~input_o\ $ (\m[1]~input_o\) ) ) # ( !\m[0]~input_o\ & ( !\m[2]~input_o\ $ (!\m[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010101010100101010101010101101010101010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_m[2]~input_o\,
	datad => \ALT_INV_m[1]~input_o\,
	datae => \ALT_INV_m[0]~input_o\,
	combout => \code6|y~combout\);

-- Location: LABCELL_X88_Y36_N15
\code5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \code5|y~0_combout\ = ( \m[0]~input_o\ & ( \m[3]~input_o\ & ( \m[1]~input_o\ ) ) ) # ( !\m[0]~input_o\ & ( \m[3]~input_o\ & ( !\m[1]~input_o\ ) ) ) # ( \m[0]~input_o\ & ( !\m[3]~input_o\ & ( !\m[1]~input_o\ ) ) ) # ( !\m[0]~input_o\ & ( !\m[3]~input_o\ & 
-- ( \m[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101101010101010101010101010101010100101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_m[1]~input_o\,
	datae => \ALT_INV_m[0]~input_o\,
	dataf => \ALT_INV_m[3]~input_o\,
	combout => \code5|y~0_combout\);

-- Location: LABCELL_X88_Y36_N18
\code4|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \code4|y~combout\ = ( \m[0]~input_o\ & ( !\m[1]~input_o\ ) ) # ( !\m[0]~input_o\ & ( \m[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_m[1]~input_o\,
	datae => \ALT_INV_m[0]~input_o\,
	combout => \code4|y~combout\);

-- Location: LABCELL_X88_Y36_N24
\code3|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \code3|y~combout\ = ( \m[0]~input_o\ & ( \m[3]~input_o\ & ( \m[2]~input_o\ ) ) ) # ( !\m[0]~input_o\ & ( \m[3]~input_o\ & ( !\m[2]~input_o\ ) ) ) # ( \m[0]~input_o\ & ( !\m[3]~input_o\ & ( !\m[2]~input_o\ ) ) ) # ( !\m[0]~input_o\ & ( !\m[3]~input_o\ & ( 
-- \m[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_m[2]~input_o\,
	datae => \ALT_INV_m[0]~input_o\,
	dataf => \ALT_INV_m[3]~input_o\,
	combout => \code3|y~combout\);

-- Location: LABCELL_X88_Y36_N33
\m1m3|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \m1m3|y~combout\ = ( !\m[0]~input_o\ & ( \m[2]~input_o\ ) ) # ( \m[0]~input_o\ & ( !\m[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_m[0]~input_o\,
	dataf => \ALT_INV_m[2]~input_o\,
	combout => \m1m3|y~combout\);

-- Location: LABCELL_X88_Y35_N0
\m0m3|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \m0m3|y~combout\ = ( \m[3]~input_o\ & ( !\m[0]~input_o\ ) ) # ( !\m[3]~input_o\ & ( \m[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_m[0]~input_o\,
	dataf => \ALT_INV_m[3]~input_o\,
	combout => \m0m3|y~combout\);

-- Location: LABCELL_X70_Y42_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


