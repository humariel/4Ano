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

-- DATE "11/17/2019 20:10:51"

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
SIGNAL \m[0]~output_o\ : std_logic;
SIGNAL \m[1]~output_o\ : std_logic;
SIGNAL \m[2]~output_o\ : std_logic;
SIGNAL \m[3]~output_o\ : std_logic;
SIGNAL \valid~output_o\ : std_logic;
SIGNAL \code[7]~input_o\ : std_logic;
SIGNAL \code[3]~input_o\ : std_logic;
SIGNAL \code[2]~input_o\ : std_logic;
SIGNAL \code[6]~input_o\ : std_logic;
SIGNAL \xora|y~combout\ : std_logic;
SIGNAL \code[5]~input_o\ : std_logic;
SIGNAL \code[1]~input_o\ : std_logic;
SIGNAL \xorb|y~combout\ : std_logic;
SIGNAL \code[4]~input_o\ : std_logic;
SIGNAL \code[0]~input_o\ : std_logic;
SIGNAL \xorc|y~combout\ : std_logic;
SIGNAL \s_z|y~combout\ : std_logic;
SIGNAL \xor6|y~combout\ : std_logic;
SIGNAL \xor7|y~combout\ : std_logic;
SIGNAL \xor8|y~combout\ : std_logic;
SIGNAL \s_y|y~combout\ : std_logic;
SIGNAL \xor2|y~combout\ : std_logic;
SIGNAL \xor4|y~combout\ : std_logic;
SIGNAL \xor1|y~combout\ : std_logic;
SIGNAL \m3_and|y~0_combout\ : std_logic;
SIGNAL \m3_xor2|y~combout\ : std_logic;
SIGNAL \val_m2|or3|y~0_combout\ : std_logic;
SIGNAL \val_m1|or3|y~0_combout\ : std_logic;
SIGNAL \val_m0|or3|y~0_combout\ : std_logic;
SIGNAL \val_m0|or5|y~0_combout\ : std_logic;
SIGNAL \val_m1|or5|y~0_combout\ : std_logic;
SIGNAL \val_m2|or5|y~0_combout\ : std_logic;
SIGNAL \and1|y~combout\ : std_logic;
SIGNAL \s_y|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor8|ALT_INV_y~combout\ : std_logic;
SIGNAL \ALT_INV_code[0]~input_o\ : std_logic;
SIGNAL \xor7|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor6|ALT_INV_y~combout\ : std_logic;
SIGNAL \s_z|ALT_INV_y~combout\ : std_logic;
SIGNAL \xorc|ALT_INV_y~combout\ : std_logic;
SIGNAL \ALT_INV_code[4]~input_o\ : std_logic;
SIGNAL \xorb|ALT_INV_y~combout\ : std_logic;
SIGNAL \xora|ALT_INV_y~combout\ : std_logic;
SIGNAL \ALT_INV_code[1]~input_o\ : std_logic;
SIGNAL \xor2|ALT_INV_y~combout\ : std_logic;
SIGNAL \xor4|ALT_INV_y~combout\ : std_logic;
SIGNAL \val_m2|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \val_m1|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \ALT_INV_code[6]~input_o\ : std_logic;
SIGNAL \val_m0|or5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \ALT_INV_code[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_code[5]~input_o\ : std_logic;
SIGNAL \m3_and|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \xor1|ALT_INV_y~combout\ : std_logic;

BEGIN

ww_code <= code;
m <= ww_m;
valid <= ww_valid;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\s_y|ALT_INV_y~combout\ <= NOT \s_y|y~combout\;
\xor8|ALT_INV_y~combout\ <= NOT \xor8|y~combout\;
\ALT_INV_code[0]~input_o\ <= NOT \code[0]~input_o\;
\xor7|ALT_INV_y~combout\ <= NOT \xor7|y~combout\;
\xor6|ALT_INV_y~combout\ <= NOT \xor6|y~combout\;
\s_z|ALT_INV_y~combout\ <= NOT \s_z|y~combout\;
\xorc|ALT_INV_y~combout\ <= NOT \xorc|y~combout\;
\ALT_INV_code[4]~input_o\ <= NOT \code[4]~input_o\;
\xorb|ALT_INV_y~combout\ <= NOT \xorb|y~combout\;
\xora|ALT_INV_y~combout\ <= NOT \xora|y~combout\;
\ALT_INV_code[1]~input_o\ <= NOT \code[1]~input_o\;
\xor2|ALT_INV_y~combout\ <= NOT \xor2|y~combout\;
\xor4|ALT_INV_y~combout\ <= NOT \xor4|y~combout\;
\val_m2|or5|ALT_INV_y~0_combout\ <= NOT \val_m2|or5|y~0_combout\;
\val_m1|or5|ALT_INV_y~0_combout\ <= NOT \val_m1|or5|y~0_combout\;
\ALT_INV_code[6]~input_o\ <= NOT \code[6]~input_o\;
\val_m0|or5|ALT_INV_y~0_combout\ <= NOT \val_m0|or5|y~0_combout\;
\ALT_INV_code[2]~input_o\ <= NOT \code[2]~input_o\;
\ALT_INV_code[3]~input_o\ <= NOT \code[3]~input_o\;
\ALT_INV_code[7]~input_o\ <= NOT \code[7]~input_o\;
\ALT_INV_code[5]~input_o\ <= NOT \code[5]~input_o\;
\m3_and|ALT_INV_y~0_combout\ <= NOT \m3_and|y~0_combout\;
\xor1|ALT_INV_y~combout\ <= NOT \xor1|y~combout\;

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
	o => \m[0]~output_o\);

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
	o => \m[1]~output_o\);

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
	o => \m[2]~output_o\);

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
	o => \m[3]~output_o\);

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
	o => \valid~output_o\);

\code[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(7),
	o => \code[7]~input_o\);

\code[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(3),
	o => \code[3]~input_o\);

\code[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(2),
	o => \code[2]~input_o\);

\code[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(6),
	o => \code[6]~input_o\);

\xora|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xora|y~combout\ = !\code[2]~input_o\ $ (!\code[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[2]~input_o\,
	datab => \ALT_INV_code[6]~input_o\,
	combout => \xora|y~combout\);

\code[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(5),
	o => \code[5]~input_o\);

\code[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(1),
	o => \code[1]~input_o\);

\xorb|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xorb|y~combout\ = !\code[5]~input_o\ $ (!\code[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[5]~input_o\,
	datab => \ALT_INV_code[1]~input_o\,
	combout => \xorb|y~combout\);

\code[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(4),
	o => \code[4]~input_o\);

\code[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_code(0),
	o => \code[0]~input_o\);

\xorc|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xorc|y~combout\ = !\code[4]~input_o\ $ (!\code[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[4]~input_o\,
	datab => \ALT_INV_code[0]~input_o\,
	combout => \xorc|y~combout\);

\s_z|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_z|y~combout\ = ( \xorc|y~combout\ & ( (!\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) # (\xora|y~combout\ & ((!\code[7]~input_o\ $ (\code[3]~input_o\)) # (\xorb|y~combout\))) ) ) # ( !\xorc|y~combout\ & ( 
-- (!\xora|y~combout\ & (((!\xorb|y~combout\)))) # (\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001001000010011001111111110000000010010000100110011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[3]~input_o\,
	datac => \xora|ALT_INV_y~combout\,
	datad => \xorb|ALT_INV_y~combout\,
	datae => \xorc|ALT_INV_y~combout\,
	combout => \s_z|y~combout\);

\xor6|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor6|y~combout\ = !\code[4]~input_o\ $ (!\code[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[4]~input_o\,
	datab => \ALT_INV_code[6]~input_o\,
	combout => \xor6|y~combout\);

\xor7|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor7|y~combout\ = !\code[3]~input_o\ $ (!\code[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[3]~input_o\,
	datab => \ALT_INV_code[1]~input_o\,
	combout => \xor7|y~combout\);

\xor8|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor8|y~combout\ = !\code[2]~input_o\ $ (!\code[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[2]~input_o\,
	datab => \ALT_INV_code[0]~input_o\,
	combout => \xor8|y~combout\);

\s_y|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \s_y|y~combout\ = ( \xor8|y~combout\ & ( (!\xor6|y~combout\ & (\xor7|y~combout\ & (!\code[7]~input_o\ $ (\code[5]~input_o\)))) # (\xor6|y~combout\ & ((!\code[7]~input_o\ $ (\code[5]~input_o\)) # (\xor7|y~combout\))) ) ) # ( !\xor8|y~combout\ & ( 
-- (!\xor6|y~combout\ & (((!\xor7|y~combout\)))) # (\xor6|y~combout\ & (\xor7|y~combout\ & (!\code[7]~input_o\ $ (\code[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000001001000010011001111111110000000010010000100110011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[5]~input_o\,
	datac => \xor6|ALT_INV_y~combout\,
	datad => \xor7|ALT_INV_y~combout\,
	datae => \xor8|ALT_INV_y~combout\,
	combout => \s_y|y~combout\);

\xor2|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor2|y~combout\ = !\code[4]~input_o\ $ (!\code[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[4]~input_o\,
	datab => \ALT_INV_code[5]~input_o\,
	combout => \xor2|y~combout\);

\xor4|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor4|y~combout\ = !\code[0]~input_o\ $ (!\code[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[0]~input_o\,
	datab => \ALT_INV_code[1]~input_o\,
	combout => \xor4|y~combout\);

\xor1|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \xor1|y~combout\ = !\code[7]~input_o\ $ (!\code[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[6]~input_o\,
	combout => \xor1|y~combout\);

\m3_and|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \m3_and|y~0_combout\ = ( \xor1|y~combout\ & ( (!\xor2|y~combout\ & (!\xor4|y~combout\ & (!\code[2]~input_o\ $ (\code[3]~input_o\)))) ) ) # ( !\xor1|y~combout\ & ( (\xor2|y~combout\ & (\xor4|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010100100000100000000000000000000101001000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor2|ALT_INV_y~combout\,
	datab => \ALT_INV_code[2]~input_o\,
	datac => \ALT_INV_code[3]~input_o\,
	datad => \xor4|ALT_INV_y~combout\,
	datae => \xor1|ALT_INV_y~combout\,
	combout => \m3_and|y~0_combout\);

\m3_xor2|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \m3_xor2|y~combout\ = !\code[7]~input_o\ $ (((!\s_z|y~combout\) # ((!\s_y|y~combout\) # (!\m3_and|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101010101011001010101010101100101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \s_z|ALT_INV_y~combout\,
	datac => \s_y|ALT_INV_y~combout\,
	datad => \m3_and|ALT_INV_y~0_combout\,
	combout => \m3_xor2|y~combout\);

\val_m2|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m2|or3|y~0_combout\ = ( \xorc|y~combout\ & ( (!\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) # (\xora|y~combout\ & ((!\code[7]~input_o\ $ (!\code[3]~input_o\)) # (\xorb|y~combout\))) ) ) # ( !\xorc|y~combout\ & 
-- ( (\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000001100110111100000000000001100000011001101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[3]~input_o\,
	datac => \xora|ALT_INV_y~combout\,
	datad => \xorb|ALT_INV_y~combout\,
	datae => \xorc|ALT_INV_y~combout\,
	combout => \val_m2|or3|y~0_combout\);

\val_m1|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m1|or3|y~0_combout\ = ( \xor8|y~combout\ & ( (!\xor6|y~combout\ & (\xor7|y~combout\ & (!\code[7]~input_o\ $ (!\code[5]~input_o\)))) # (\xor6|y~combout\ & ((!\code[7]~input_o\ $ (!\code[5]~input_o\)) # (\xor7|y~combout\))) ) ) # ( !\xor8|y~combout\ & 
-- ( (\xor6|y~combout\ & (\xor7|y~combout\ & (!\code[7]~input_o\ $ (!\code[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000110000001100110111100000000000001100000011001101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[5]~input_o\,
	datac => \xor6|ALT_INV_y~combout\,
	datad => \xor7|ALT_INV_y~combout\,
	datae => \xor8|ALT_INV_y~combout\,
	combout => \val_m1|or3|y~0_combout\);

\val_m0|or3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m0|or3|y~0_combout\ = ( \xor1|y~combout\ & ( (!\xor2|y~combout\ & (\xor4|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\)))) # (\xor2|y~combout\ & ((!\code[2]~input_o\ $ (!\code[3]~input_o\)) # (\xor4|y~combout\))) ) ) # ( !\xor1|y~combout\ & 
-- ( (\xor2|y~combout\ & (\xor4|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010100000101000111110100000000000101000001010001111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor2|ALT_INV_y~combout\,
	datab => \ALT_INV_code[2]~input_o\,
	datac => \ALT_INV_code[3]~input_o\,
	datad => \xor4|ALT_INV_y~combout\,
	datae => \xor1|ALT_INV_y~combout\,
	combout => \val_m0|or3|y~0_combout\);

\val_m0|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m0|or5|y~0_combout\ = ( \xor1|y~combout\ & ( (!\xor2|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\ $ (\xor4|y~combout\)))) # (\xor2|y~combout\ & (!\xor4|y~combout\ & (!\code[2]~input_o\ $ (\code[3]~input_o\)))) ) ) # ( !\xor1|y~combout\ & ( 
-- (!\xor2|y~combout\ & (\xor4|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\)))) # (\xor2|y~combout\ & (!\code[2]~input_o\ $ (!\code[3]~input_o\ $ (\xor4|y~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010001101001011010011000001000010100011010010110100110000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \xor2|ALT_INV_y~combout\,
	datab => \ALT_INV_code[2]~input_o\,
	datac => \ALT_INV_code[3]~input_o\,
	datad => \xor4|ALT_INV_y~combout\,
	datae => \xor1|ALT_INV_y~combout\,
	combout => \val_m0|or5|y~0_combout\);

\val_m1|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m1|or5|y~0_combout\ = ( \xor8|y~combout\ & ( (!\xor6|y~combout\ & (!\code[7]~input_o\ $ (!\code[5]~input_o\ $ (\xor7|y~combout\)))) # (\xor6|y~combout\ & (!\xor7|y~combout\ & (!\code[7]~input_o\ $ (\code[5]~input_o\)))) ) ) # ( !\xor8|y~combout\ & ( 
-- (!\xor6|y~combout\ & (\xor7|y~combout\ & (!\code[7]~input_o\ $ (!\code[5]~input_o\)))) # (\xor6|y~combout\ & (!\code[7]~input_o\ $ (!\code[5]~input_o\ $ (\xor7|y~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011001101001011010011001000000000110011010010110100110010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[5]~input_o\,
	datac => \xor6|ALT_INV_y~combout\,
	datad => \xor7|ALT_INV_y~combout\,
	datae => \xor8|ALT_INV_y~combout\,
	combout => \val_m1|or5|y~0_combout\);

\val_m2|or5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \val_m2|or5|y~0_combout\ = ( \xorc|y~combout\ & ( (!\xora|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\ $ (\xorb|y~combout\)))) # (\xora|y~combout\ & (!\xorb|y~combout\ & (!\code[7]~input_o\ $ (\code[3]~input_o\)))) ) ) # ( !\xorc|y~combout\ & ( 
-- (!\xora|y~combout\ & (\xorb|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\)))) # (\xora|y~combout\ & (!\code[7]~input_o\ $ (!\code[3]~input_o\ $ (\xorb|y~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011001101001011010011001000000000110011010010110100110010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_code[7]~input_o\,
	datab => \ALT_INV_code[3]~input_o\,
	datac => \xora|ALT_INV_y~combout\,
	datad => \xorb|ALT_INV_y~combout\,
	datae => \xorc|ALT_INV_y~combout\,
	combout => \val_m2|or5|y~0_combout\);

\and1|y\ : cyclonev_lcell_comb
-- Equation(s):
-- \and1|y~combout\ = (!\val_m0|or5|y~0_combout\ & (!\val_m1|or5|y~0_combout\ & !\val_m2|or5|y~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \val_m0|or5|ALT_INV_y~0_combout\,
	datab => \val_m1|or5|ALT_INV_y~0_combout\,
	datac => \val_m2|or5|ALT_INV_y~0_combout\,
	combout => \and1|y~combout\);

ww_m(0) <= \m[0]~output_o\;

ww_m(1) <= \m[1]~output_o\;

ww_m(2) <= \m[2]~output_o\;

ww_m(3) <= \m[3]~output_o\;

ww_valid <= \valid~output_o\;
END structure;


