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

-- DATE "11/14/2019 12:49:57"

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

ENTITY 	HAD_DECODER_PARALLEL IS
    PORT (
	code : IN std_logic_vector(7 DOWNTO 0);
	m : BUFFER std_logic_vector(3 DOWNTO 0);
	valid : BUFFER std_logic
	);
END HAD_DECODER_PARALLEL;

-- Design Ports Information
-- m[0]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[1]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[2]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- m[3]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valid	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[7]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[3]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[6]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[5]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[1]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[4]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code[0]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF HAD_DECODER_PARALLEL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_code : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_m : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_valid : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \code[6]~input_o\ : std_logic;
SIGNAL \code[2]~input_o\ : std_logic;
SIGNAL \xora|y~combout\ : std_logic;
SIGNAL \code[7]~input_o\ : std_logic;
SIGNAL \code[3]~input_o\ : std_logic;
SIGNAL \code[5]~input_o\ : std_logic;
SIGNAL \code[1]~input_o\ : std_logic;
SIGNAL \xorb|y~combout\ : std_logic;
SIGNAL \code[0]~input_o\ : std_logic;
SIGNAL \code[4]~input_o\ : std_logic;
SIGNAL \xorc|y~combout\ : std_logic;
SIGNAL \s_z|y~combout\ : std_logic;
SIGNAL \xor7|y~combout\ : std_logic;
SIGNAL \xor8|y~combout\ : std_logic;
SIGNAL \xor6|y~combout\ : std_logic;
SIGNAL \s_y|y~combout\ : std_logic;
SIGNAL \xor1|y~combout\ : std_logic;
SIGNAL \xor4|y~combout\ : std_logic;
SIGNAL \xor2|y~combout\ : std_logic;
SIGNAL \m3_and|y~0_combout\ : std_logic;
SIGNAL \m3_xor2|y~combout\ : std_logic;
SIGNAL \val_m2|or3|y~0_combout\ : std_logic;
SIGNAL \val_m1|or3|y~0_combout\ : std_logic;
SIGNAL \val_m0|or3|y~0_combout\ : std_logic;
SIGNAL \val_m1|or5|y~0_combout\ : std_logic;
SIGNAL \val_m0|or5|y~0_combout\ : std_logic;
SIGNAL \val_m2|or5|y~0_combout\ : std_logic;
SIGNAL \and1|y~combout\ : std_logic;
SIGNAL \ALT_INV_code[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[7]~input_o\ : std_logic;
SIGNAL \val_m2|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \val_m1|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \val_m0|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \m3_and|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \xor1|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor4|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor2|ALT_INV_y~combout\ : std_logic;
SIGNAL \s_y|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor8|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor7|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor6|ALT_INV_y~combout\ : std_logic;
SIGNAL \s_z|ALT_INV_y~combout\ : std_logic;
SIGNAL \xorc|ALT_INV_y~combout\ : std_logic;
SIGNAL \xorb|ALT_INV_y~combout\ : std_logic;
SIGNAL \xora|ALT_INV_y~combout\ : std_logic;

BEGIN

ww_code <= code;
m <= ww_m;
valid <= ww_valid;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_code[0]~input_o\ <= NOT \code[0]~input_o\;
\ALT_INV_code[4]~input_o\ <= NOT \code[4]~input_o\;
\ALT_INV_code[1]~input_o\ <= NOT \code[1]~input_o\;
\ALT_INV_code[5]~input_o\ <= NOT \code[5]~input_o\;
\ALT_INV_code[6]~input_o\ <= NOT \code[6]~input_o\;
\ALT_INV_code[2]~input_o\ <= NOT \code[2]~input_o\;
\ALT_INV_code[3]~input_o\ <= NOT \code[3]~input_o\;
\ALT_INV_code[7]~input_o\ <= NOT \code[7]~input_o\;
\val_m2|or5|ALT_INV_y~0_combout\ <= NOT \val_m2|or5|y~0_combout\;
\val_m1|or5|ALT_INV_y~0_combout\ <= NOT \val_m1|or5|y~0_combout\;
\val_m0|or5|ALT_INV_y~0_combout\ <= NOT \val_m0|or5|y~0_combout\;
\m3_and|ALT_INV_y~0_combout\ <= NOT \m3_and|y~0_combout\;
\xor1|ALT_INV_y~combout\ <= NOT \xor1|y~combout\;
\xor4|ALT_INV_y~combout\ <= NOT \xor4|y~combout\;
\xor2|ALT_INV_y~combout\ <= NOT \xor2|y~combout\;
\s_y|ALT_INV_y~combout\ <= NOT \s_y|y~combout\;
\xor8|ALT_INV_y~combout\ <= NOT \xor8|y~combout\;
\xor7|ALT_INV_y~combout\ <= NOT \xor7|y~combout\;
\xor6|ALT_INV_y~combout\ <= NOT \xor6|y~combout\;
\s_z|ALT_INV_y~combout\ <= NOT \s_z|y~combout\;
\xorc|ALT_INV_y~combout\ <= NOT \xorc|y~combout\;
\xorb|ALT_INV_y~combout\ <= NOT \xorb|y~combout\;
\xora|ALT_INV_y~combout\ <= NOT \xora|y~combout\;

-- Location: IOOBUF_X89_Y38_N5
\m[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \m3_xor2|y~combout\,
	devoe => ww_devoe,
	o => ww_m(0));

-- Location: IOOBUF_X89_Y37_N39
\m[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \val_m2|or3|y~0_combout\,
	devoe => ww_devoe,
	o => ww_m(1));

-- Location: IOOBUF_X89_Y38_N56
\m[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \val_m1|or3|y~0_combout\,
	devoe => ww_devoe,
	o => ww_m(2));

-- Location: IOOBUF_X89_Y37_N22
\m[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \val_m0|or3|y~0_combout\,
	devoe => ww_devoe,
	o => ww_m(3));

-- Location: IOOBUF_X89_Y37_N5
\valid~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \and1|y~combout\,
	devoe => ww_devoe,
	o => ww_valid);

-- Location: IOIBUF_X89_Y36_N55
\code[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(6),
	o => \code[6]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\code[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(2),
	o => \code[2]~input_o\);

-- Location: LABCELL_X88_Y37_N30
\xora|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xora|y~combout\ = ( \code[2]~input_o\ & ( !\code[6]~input_o\ ) ) # ( !\code[2]~input_o\ & ( \code[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[6]~input_o\,
	dataf => \ALT_INV_code[2]~input_o\,
	combout => \xora|y~combout\);

-- Location: IOIBUF_X89_Y36_N21
\code[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(7),
	o => \code[7]~input_o\);

-- Location: IOIBUF_X89_Y35_N95
\code[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(3),
	o => \code[3]~input_o\);

-- Location: IOIBUF_X89_Y35_N61
\code[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(5),
	o => \code[5]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\code[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(1),
	o => \code[1]~input_o\);

-- Location: LABCELL_X88_Y37_N9
\xorb|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xorb|y~combout\ = ( \code[1]~input_o\ & ( !\code[5]~input_o\ ) ) # ( !\code[1]~input_o\ & ( \code[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_code[5]~input_o\,
	dataf => \ALT_INV_code[1]~input_o\,
	combout => \xorb|y~combout\);

-- Location: IOIBUF_X89_Y35_N44
\code[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(0),
	o => \code[0]~input_o\);

-- Location: IOIBUF_X89_Y37_N55
\code[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(4),
	o => \code[4]~input_o\);

-- Location: LABCELL_X88_Y37_N12
\xorc|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xorc|y~combout\ = !\code[0]~input_o\ $ (!\code[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011110000111100001111000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_code[0]~input_o\,
	datac => \ALT_INV_code[4]~input_o\,
	combout => \xorc|y~combout\);

-- Location: LABCELL_X88_Y37_N18
\s_z|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_z|y~combout\ = ( \xorc|y~combout\ & ( (!\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) # (\xora|y~combout\ & ((!\code[7]~input_o\ $ (\code[3]~input_o\)) # (\xorb|y~combout\))) ) ) # ( !\xorc|y~combout\ & ( 
-- (!\xora|y~combout\ & (((!\xorb|y~combout\)))) # (\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001000001101010100100000101000001110101110100000111010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xora|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \ALT_INV_code[3]~input_o\,
	datad => \xorb|ALT_INV_y~combout\,
	dataf => \xorc|ALT_INV_y~combout\,
	combout => \s_z|y~combout\);

-- Location: LABCELL_X88_Y37_N27
\xor7|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor7|y~combout\ = ( \code[1]~input_o\ & ( !\code[3]~input_o\ ) ) # ( !\code[1]~input_o\ & ( \code[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_code[3]~input_o\,
	dataf => \ALT_INV_code[1]~input_o\,
	combout => \xor7|y~combout\);

-- Location: LABCELL_X88_Y37_N15
\xor8|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor8|y~combout\ = ( \code[2]~input_o\ & ( !\code[0]~input_o\ ) ) # ( !\code[2]~input_o\ & ( \code[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_code[0]~input_o\,
	dataf => \ALT_INV_code[2]~input_o\,
	combout => \xor8|y~combout\);

-- Location: LABCELL_X88_Y37_N33
\xor6|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor6|y~combout\ = !\code[6]~input_o\ $ (!\code[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101001010101101010100101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[6]~input_o\,
	datad => \ALT_INV_code[4]~input_o\,
	combout => \xor6|y~combout\);

-- Location: LABCELL_X88_Y37_N0
\s_y|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_y|y~combout\ = ( \xor6|y~combout\ & ( (!\xor7|y~combout\ & (\xor8|y~combout\ & (!\code[7]~input_o\ $ (\code[5]~input_o\)))) # (\xor7|y~combout\ & ((!\code[7]~input_o\ $ (\code[5]~input_o\)) # (\xor8|y~combout\))) ) ) # ( !\xor6|y~combout\ & ( 
-- (!\xor7|y~combout\ & (((!\xor8|y~combout\)))) # (\xor7|y~combout\ & (\xor8|y~combout\ & (!\code[7]~input_o\ $ (\code[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101001000001101010100100000101000001110101110100000111010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor7|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \ALT_INV_code[5]~input_o\,
	datad => \xor8|ALT_INV_y~combout\,
	dataf => \xor6|ALT_INV_y~combout\,
	combout => \s_y|y~combout\);

-- Location: LABCELL_X88_Y37_N51
\xor1|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor1|y~combout\ = ( \code[6]~input_o\ & ( !\code[7]~input_o\ ) ) # ( !\code[6]~input_o\ & ( \code[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_code[7]~input_o\,
	dataf => \ALT_INV_code[6]~input_o\,
	combout => \xor1|y~combout\);

-- Location: LABCELL_X88_Y37_N42
\xor4|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor4|y~combout\ = !\code[1]~input_o\ $ (!\code[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_code[1]~input_o\,
	datad => \ALT_INV_code[0]~input_o\,
	combout => \xor4|y~combout\);

-- Location: LABCELL_X88_Y37_N39
\xor2|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor2|y~combout\ = ( \code[5]~input_o\ & ( !\code[4]~input_o\ ) ) # ( !\code[5]~input_o\ & ( \code[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_code[4]~input_o\,
	dataf => \ALT_INV_code[5]~input_o\,
	combout => \xor2|y~combout\);

-- Location: LABCELL_X88_Y37_N54
\m3_and|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \m3_and|y~0_combout\ = ( \code[2]~input_o\ & ( (!\xor1|y~combout\ & (\xor4|y~combout\ & (!\code[3]~input_o\ & \xor2|y~combout\))) # (\xor1|y~combout\ & (!\xor4|y~combout\ & (\code[3]~input_o\ & !\xor2|y~combout\))) ) ) # ( !\code[2]~input_o\ & ( 
-- (!\xor1|y~combout\ & (\xor4|y~combout\ & (\code[3]~input_o\ & \xor2|y~combout\))) # (\xor1|y~combout\ & (!\xor4|y~combout\ & (!\code[3]~input_o\ & !\xor2|y~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000010010000000000001000000100001000000000010000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor1|ALT_INV_y~combout\,
	datab => \xor4|ALT_INV_y~combout\,
	datac => \ALT_INV_code[3]~input_o\,
	datad => \xor2|ALT_INV_y~combout\,
	dataf => \ALT_INV_code[2]~input_o\,
	combout => \m3_and|y~0_combout\);

-- Location: LABCELL_X88_Y37_N36
\m3_xor2|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \m3_xor2|y~combout\ = !\code[7]~input_o\ $ (((!\s_z|y~combout\) # ((!\s_y|y~combout\) # (!\m3_and|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110110001100110011011000110011001101100011001100110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \s_z|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \s_y|ALT_INV_y~combout\,
	datad => \m3_and|ALT_INV_y~0_combout\,
	combout => \m3_xor2|y~combout\);

-- Location: LABCELL_X88_Y37_N21
\val_m2|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m2|or3|y~0_combout\ = ( \xorc|y~combout\ & ( (!\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) # (\xora|y~combout\ & ((!\code[7]~input_o\ $ (!\code[3]~input_o\)) # (\xorb|y~combout\))) ) ) # ( !\xorc|y~combout\ & 
-- ( (\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000100000000010000010000010111010011010001011101001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xora|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \xorb|ALT_INV_y~combout\,
	datad => \ALT_INV_code[3]~input_o\,
	dataf => \xorc|ALT_INV_y~combout\,
	combout => \val_m2|or3|y~0_combout\);

-- Location: LABCELL_X88_Y37_N24
\val_m1|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m1|or3|y~0_combout\ = ( \code[5]~input_o\ & ( (!\xor6|y~combout\ & (\xor8|y~combout\ & (\xor7|y~combout\ & !\code[7]~input_o\))) # (\xor6|y~combout\ & ((!\xor8|y~combout\ & (\xor7|y~combout\ & !\code[7]~input_o\)) # (\xor8|y~combout\ & 
-- ((!\code[7]~input_o\) # (\xor7|y~combout\))))) ) ) # ( !\code[5]~input_o\ & ( (!\xor6|y~combout\ & (\xor8|y~combout\ & (\xor7|y~combout\ & \code[7]~input_o\))) # (\xor6|y~combout\ & ((!\xor8|y~combout\ & (\xor7|y~combout\ & \code[7]~input_o\)) # 
-- (\xor8|y~combout\ & ((\code[7]~input_o\) # (\xor7|y~combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010111000000010001011100010111000000010001011100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor6|ALT_INV_y~combout\,
	datab => \xor8|ALT_INV_y~combout\,
	datac => \xor7|ALT_INV_y~combout\,
	datad => \ALT_INV_code[7]~input_o\,
	dataf => \ALT_INV_code[5]~input_o\,
	combout => \val_m1|or3|y~0_combout\);

-- Location: LABCELL_X88_Y37_N48
\val_m0|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m0|or3|y~0_combout\ = ( \code[2]~input_o\ & ( (!\code[3]~input_o\ & ((!\xor4|y~combout\ & (\xor1|y~combout\ & \xor2|y~combout\)) # (\xor4|y~combout\ & ((\xor2|y~combout\) # (\xor1|y~combout\))))) # (\code[3]~input_o\ & (\xor4|y~combout\ & 
-- (\xor1|y~combout\ & \xor2|y~combout\))) ) ) # ( !\code[2]~input_o\ & ( (!\code[3]~input_o\ & (\xor4|y~combout\ & (\xor1|y~combout\ & \xor2|y~combout\))) # (\code[3]~input_o\ & ((!\xor4|y~combout\ & (\xor1|y~combout\ & \xor2|y~combout\)) # 
-- (\xor4|y~combout\ & ((\xor2|y~combout\) # (\xor1|y~combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010111000000010001011100000010001010110000001000101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[3]~input_o\,
	datab => \xor4|ALT_INV_y~combout\,
	datac => \xor1|ALT_INV_y~combout\,
	datad => \xor2|ALT_INV_y~combout\,
	dataf => \ALT_INV_code[2]~input_o\,
	combout => \val_m0|or3|y~0_combout\);

-- Location: LABCELL_X88_Y37_N3
\val_m1|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m1|or5|y~0_combout\ = ( \code[5]~input_o\ & ( (!\xor7|y~combout\ & ((!\code[7]~input_o\ & (!\xor8|y~combout\ $ (!\xor6|y~combout\))) # (\code[7]~input_o\ & (\xor8|y~combout\ & \xor6|y~combout\)))) # (\xor7|y~combout\ & ((!\code[7]~input_o\ & 
-- (!\xor8|y~combout\ & !\xor6|y~combout\)) # (\code[7]~input_o\ & (!\xor8|y~combout\ $ (!\xor6|y~combout\))))) ) ) # ( !\code[5]~input_o\ & ( (!\xor7|y~combout\ & ((!\code[7]~input_o\ & (\xor8|y~combout\ & \xor6|y~combout\)) # (\code[7]~input_o\ & 
-- (!\xor8|y~combout\ $ (!\xor6|y~combout\))))) # (\xor7|y~combout\ & ((!\code[7]~input_o\ & (!\xor8|y~combout\ $ (!\xor6|y~combout\))) # (\code[7]~input_o\ & (!\xor8|y~combout\ & !\xor6|y~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011001101000000101100110100001001001100100100100100110010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor7|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \xor8|ALT_INV_y~combout\,
	datad => \xor6|ALT_INV_y~combout\,
	dataf => \ALT_INV_code[5]~input_o\,
	combout => \val_m1|or5|y~0_combout\);

-- Location: LABCELL_X88_Y37_N57
\val_m0|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m0|or5|y~0_combout\ = ( \code[2]~input_o\ & ( (!\xor1|y~combout\ & ((!\xor4|y~combout\ & (\xor2|y~combout\ & !\code[3]~input_o\)) # (\xor4|y~combout\ & (!\xor2|y~combout\ $ (\code[3]~input_o\))))) # (\xor1|y~combout\ & ((!\xor4|y~combout\ & 
-- (!\xor2|y~combout\ $ (\code[3]~input_o\))) # (\xor4|y~combout\ & (!\xor2|y~combout\ & \code[3]~input_o\)))) ) ) # ( !\code[2]~input_o\ & ( (!\xor1|y~combout\ & ((!\xor4|y~combout\ & (\xor2|y~combout\ & \code[3]~input_o\)) # (\xor4|y~combout\ & 
-- (!\xor2|y~combout\ $ (!\code[3]~input_o\))))) # (\xor1|y~combout\ & ((!\xor4|y~combout\ & (!\xor2|y~combout\ $ (!\code[3]~input_o\))) # (\xor4|y~combout\ & (!\xor2|y~combout\ & !\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011001101000000101100110100001101000000101100110100000010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor1|ALT_INV_y~combout\,
	datab => \xor4|ALT_INV_y~combout\,
	datac => \xor2|ALT_INV_y~combout\,
	datad => \ALT_INV_code[3]~input_o\,
	dataf => \ALT_INV_code[2]~input_o\,
	combout => \val_m0|or5|y~0_combout\);

-- Location: LABCELL_X88_Y37_N6
\val_m2|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m2|or5|y~0_combout\ = ( \xorc|y~combout\ & ( (!\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\xora|y~combout\ $ (\code[3]~input_o\)))) # (\xorb|y~combout\ & (!\xora|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) ) ) # ( !\xorc|y~combout\ & ( 
-- (!\xorb|y~combout\ & (\xora|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) # (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\xora|y~combout\ $ (\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011001001001000101100100100101101000100100100110100010010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xorb|ALT_INV_y~combout\,
	datab => \ALT_INV_code[7]~input_o\,
	datac => \xora|ALT_INV_y~combout\,
	datad => \ALT_INV_code[3]~input_o\,
	dataf => \xorc|ALT_INV_y~combout\,
	combout => \val_m2|or5|y~0_combout\);

-- Location: LABCELL_X88_Y37_N45
\and1|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \and1|y~combout\ = (!\val_m1|or5|y~0_combout\ & (!\val_m0|or5|y~0_combout\ & !\val_m2|or5|y~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \val_m1|or5|ALT_INV_y~0_combout\,
	datab => \val_m0|or5|ALT_INV_y~0_combout\,
	datac => \val_m2|or5|ALT_INV_y~0_combout\,
	combout => \and1|y~combout\);

-- Location: LABCELL_X40_Y76_N3
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


