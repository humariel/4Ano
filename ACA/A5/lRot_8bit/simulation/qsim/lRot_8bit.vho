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

-- DATE "10/21/2019 19:55:03"

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

ENTITY 	lRot_8bit_LR IS
    PORT (
	dataIn : IN std_logic_vector(7 DOWNTO 0);
	s : IN std_logic_vector(2 DOWNTO 0);
	l_r : IN std_logic;
	dataOut : OUT std_logic_vector(7 DOWNTO 0)
	);
END lRot_8bit_LR;

-- Design Ports Information
-- dataOut[0]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[1]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[3]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[4]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[5]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[6]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataOut[7]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[4]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[3]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[2]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[1]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[0]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_r	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[1]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[2]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[0]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[7]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[6]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dataIn[5]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lRot_8bit_LR IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dataIn : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_s : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_l_r : std_logic;
SIGNAL ww_dataOut : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \s[0]~input_o\ : std_logic;
SIGNAL \l_r~input_o\ : std_logic;
SIGNAL \s[1]~input_o\ : std_logic;
SIGNAL \s[2]~input_o\ : std_logic;
SIGNAL \comb~1_combout\ : std_logic;
SIGNAL \dataIn[4]~input_o\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \dataIn[2]~input_o\ : std_logic;
SIGNAL \dataIn[1]~input_o\ : std_logic;
SIGNAL \dataIn[3]~input_o\ : std_logic;
SIGNAL \lRot|blk1|mult4|y~0_combout\ : std_logic;
SIGNAL \dataIn[6]~input_o\ : std_logic;
SIGNAL \dataIn[5]~input_o\ : std_logic;
SIGNAL \dataIn[0]~input_o\ : std_logic;
SIGNAL \dataIn[7]~input_o\ : std_logic;
SIGNAL \lRot|blk1|mult0|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult0|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult5|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult1|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult1|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult2|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult6|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult2|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult7|y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult3|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult3|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult4|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult5|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult6|y~0_combout\ : std_logic;
SIGNAL \lRot|blk2|mult7|y~0_combout\ : std_logic;
SIGNAL \ALT_INV_dataIn[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_s[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_s[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_l_r~input_o\ : std_logic;
SIGNAL \ALT_INV_s[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_dataIn[4]~input_o\ : std_logic;
SIGNAL \lRot|blk1|mult3|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult7|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult2|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult6|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult1|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult5|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \lRot|blk1|mult0|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \ALT_INV_comb~1_combout\ : std_logic;
SIGNAL \lRot|blk1|mult4|ALT_INV_y~0_combout\ : std_logic;
SIGNAL \ALT_INV_comb~0_combout\ : std_logic;

BEGIN

ww_dataIn <= dataIn;
ww_s <= s;
ww_l_r <= l_r;
dataOut <= ww_dataOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_dataIn[5]~input_o\ <= NOT \dataIn[5]~input_o\;
\ALT_INV_dataIn[6]~input_o\ <= NOT \dataIn[6]~input_o\;
\ALT_INV_dataIn[7]~input_o\ <= NOT \dataIn[7]~input_o\;
\ALT_INV_dataIn[0]~input_o\ <= NOT \dataIn[0]~input_o\;
\ALT_INV_s[2]~input_o\ <= NOT \s[2]~input_o\;
\ALT_INV_s[1]~input_o\ <= NOT \s[1]~input_o\;
\ALT_INV_l_r~input_o\ <= NOT \l_r~input_o\;
\ALT_INV_s[0]~input_o\ <= NOT \s[0]~input_o\;
\ALT_INV_dataIn[1]~input_o\ <= NOT \dataIn[1]~input_o\;
\ALT_INV_dataIn[2]~input_o\ <= NOT \dataIn[2]~input_o\;
\ALT_INV_dataIn[3]~input_o\ <= NOT \dataIn[3]~input_o\;
\ALT_INV_dataIn[4]~input_o\ <= NOT \dataIn[4]~input_o\;
\lRot|blk1|mult3|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult3|y~0_combout\;
\lRot|blk1|mult7|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult7|y~0_combout\;
\lRot|blk1|mult2|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult2|y~0_combout\;
\lRot|blk1|mult6|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult6|y~0_combout\;
\lRot|blk1|mult1|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult1|y~0_combout\;
\lRot|blk1|mult5|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult5|y~0_combout\;
\lRot|blk1|mult0|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult0|y~0_combout\;
\ALT_INV_comb~1_combout\ <= NOT \comb~1_combout\;
\lRot|blk1|mult4|ALT_INV_y~0_combout\ <= NOT \lRot|blk1|mult4|y~0_combout\;
\ALT_INV_comb~0_combout\ <= NOT \comb~0_combout\;

-- Location: IOOBUF_X89_Y38_N56
\dataOut[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult0|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(0));

-- Location: IOOBUF_X89_Y35_N79
\dataOut[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult1|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(1));

-- Location: IOOBUF_X89_Y35_N96
\dataOut[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult2|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(2));

-- Location: IOOBUF_X89_Y37_N39
\dataOut[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult3|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(3));

-- Location: IOOBUF_X89_Y38_N22
\dataOut[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult4|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(4));

-- Location: IOOBUF_X89_Y9_N39
\dataOut[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult5|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(5));

-- Location: IOOBUF_X89_Y35_N62
\dataOut[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult6|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(6));

-- Location: IOOBUF_X89_Y35_N45
\dataOut[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \lRot|blk2|mult7|y~0_combout\,
	devoe => ww_devoe,
	o => ww_dataOut(7));

-- Location: IOIBUF_X89_Y37_N21
\s[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(0),
	o => \s[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\l_r~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_l_r,
	o => \l_r~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\s[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(1),
	o => \s[1]~input_o\);

-- Location: IOIBUF_X89_Y37_N55
\s[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(2),
	o => \s[2]~input_o\);

-- Location: LABCELL_X88_Y36_N33
\comb~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~1_combout\ = ( \s[2]~input_o\ & ( (!\l_r~input_o\) # ((!\s[0]~input_o\ & !\s[1]~input_o\)) ) ) # ( !\s[2]~input_o\ & ( (\l_r~input_o\ & ((\s[1]~input_o\) # (\s[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001111101100111011001110110011101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_l_r~input_o\,
	datac => \ALT_INV_s[1]~input_o\,
	dataf => \ALT_INV_s[2]~input_o\,
	combout => \comb~1_combout\);

-- Location: IOIBUF_X89_Y36_N55
\dataIn[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(4),
	o => \dataIn[4]~input_o\);

-- Location: LABCELL_X88_Y36_N30
\comb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = ( \s[1]~input_o\ & ( (!\s[0]~input_o\) # (!\l_r~input_o\) ) ) # ( !\s[1]~input_o\ & ( (\s[0]~input_o\ & \l_r~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_l_r~input_o\,
	dataf => \ALT_INV_s[1]~input_o\,
	combout => \comb~0_combout\);

-- Location: IOIBUF_X89_Y36_N38
\dataIn[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(2),
	o => \dataIn[2]~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\dataIn[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(1),
	o => \dataIn[1]~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\dataIn[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(3),
	o => \dataIn[3]~input_o\);

-- Location: LABCELL_X88_Y36_N6
\lRot|blk1|mult4|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult4|y~0_combout\ = ( \dataIn[3]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\) # (\dataIn[1]~input_o\) ) ) ) # ( !\dataIn[3]~input_o\ & ( \s[0]~input_o\ & ( (\comb~0_combout\ & \dataIn[1]~input_o\) ) ) ) # ( \dataIn[3]~input_o\ & ( 
-- !\s[0]~input_o\ & ( (!\comb~0_combout\ & (\dataIn[4]~input_o\)) # (\comb~0_combout\ & ((\dataIn[2]~input_o\))) ) ) ) # ( !\dataIn[3]~input_o\ & ( !\s[0]~input_o\ & ( (!\comb~0_combout\ & (\dataIn[4]~input_o\)) # (\comb~0_combout\ & 
-- ((\dataIn[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100011101000111010001110100011100000000001100111100110011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dataIn[4]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[2]~input_o\,
	datad => \ALT_INV_dataIn[1]~input_o\,
	datae => \ALT_INV_dataIn[3]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \lRot|blk1|mult4|y~0_combout\);

-- Location: IOIBUF_X89_Y37_N4
\dataIn[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(6),
	o => \dataIn[6]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\dataIn[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(5),
	o => \dataIn[5]~input_o\);

-- Location: IOIBUF_X89_Y38_N38
\dataIn[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(0),
	o => \dataIn[0]~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\dataIn[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(7),
	o => \dataIn[7]~input_o\);

-- Location: LABCELL_X88_Y36_N42
\lRot|blk1|mult0|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult0|y~0_combout\ = ( \dataIn[7]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\) # (\dataIn[5]~input_o\) ) ) ) # ( !\dataIn[7]~input_o\ & ( \s[0]~input_o\ & ( (\comb~0_combout\ & \dataIn[5]~input_o\) ) ) ) # ( \dataIn[7]~input_o\ & ( 
-- !\s[0]~input_o\ & ( (!\comb~0_combout\ & ((\dataIn[0]~input_o\))) # (\comb~0_combout\ & (\dataIn[6]~input_o\)) ) ) ) # ( !\dataIn[7]~input_o\ & ( !\s[0]~input_o\ & ( (!\comb~0_combout\ & ((\dataIn[0]~input_o\))) # (\comb~0_combout\ & 
-- (\dataIn[6]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100000011000000111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dataIn[6]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[5]~input_o\,
	datad => \ALT_INV_dataIn[0]~input_o\,
	datae => \ALT_INV_dataIn[7]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \lRot|blk1|mult0|y~0_combout\);

-- Location: LABCELL_X88_Y36_N48
\lRot|blk2|mult0|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult0|y~0_combout\ = ( \lRot|blk1|mult0|y~0_combout\ & ( (!\comb~1_combout\) # (\lRot|blk1|mult4|y~0_combout\) ) ) # ( !\lRot|blk1|mult0|y~0_combout\ & ( (\comb~1_combout\ & \lRot|blk1|mult4|y~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_comb~1_combout\,
	datab => \lRot|blk1|mult4|ALT_INV_y~0_combout\,
	dataf => \lRot|blk1|mult0|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult0|y~0_combout\);

-- Location: LABCELL_X88_Y36_N54
\lRot|blk1|mult5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult5|y~0_combout\ = ( \dataIn[4]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\) # (\dataIn[2]~input_o\) ) ) ) # ( !\dataIn[4]~input_o\ & ( \s[0]~input_o\ & ( (\dataIn[2]~input_o\ & \comb~0_combout\) ) ) ) # ( \dataIn[4]~input_o\ & ( 
-- !\s[0]~input_o\ & ( (!\comb~0_combout\ & (\dataIn[5]~input_o\)) # (\comb~0_combout\ & ((\dataIn[3]~input_o\))) ) ) ) # ( !\dataIn[4]~input_o\ & ( !\s[0]~input_o\ & ( (!\comb~0_combout\ & (\dataIn[5]~input_o\)) # (\comb~0_combout\ & 
-- ((\dataIn[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000111111000011000011111100010001000100011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dataIn[2]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[5]~input_o\,
	datad => \ALT_INV_dataIn[3]~input_o\,
	datae => \ALT_INV_dataIn[4]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \lRot|blk1|mult5|y~0_combout\);

-- Location: LABCELL_X88_Y36_N0
\lRot|blk1|mult1|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult1|y~0_combout\ = ( \dataIn[7]~input_o\ & ( \dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (((\dataIn[1]~input_o\)) # (\comb~0_combout\))) # (\s[0]~input_o\ & ((!\comb~0_combout\) # ((\dataIn[6]~input_o\)))) ) ) ) # ( !\dataIn[7]~input_o\ & ( 
-- \dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (!\comb~0_combout\ & ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ & ((!\comb~0_combout\) # ((\dataIn[6]~input_o\)))) ) ) ) # ( \dataIn[7]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & 
-- (((\dataIn[1]~input_o\)) # (\comb~0_combout\))) # (\s[0]~input_o\ & (\comb~0_combout\ & (\dataIn[6]~input_o\))) ) ) ) # ( !\dataIn[7]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (!\comb~0_combout\ & ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ 
-- & (\comb~0_combout\ & (\dataIn[6]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110001001001000111010101101000101110011010110011111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[6]~input_o\,
	datad => \ALT_INV_dataIn[1]~input_o\,
	datae => \ALT_INV_dataIn[7]~input_o\,
	dataf => \ALT_INV_dataIn[0]~input_o\,
	combout => \lRot|blk1|mult1|y~0_combout\);

-- Location: LABCELL_X88_Y35_N0
\lRot|blk2|mult1|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult1|y~0_combout\ = ( \lRot|blk1|mult5|y~0_combout\ & ( \lRot|blk1|mult1|y~0_combout\ ) ) # ( !\lRot|blk1|mult5|y~0_combout\ & ( \lRot|blk1|mult1|y~0_combout\ & ( !\comb~1_combout\ ) ) ) # ( \lRot|blk1|mult5|y~0_combout\ & ( 
-- !\lRot|blk1|mult1|y~0_combout\ & ( \comb~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100110011001111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_comb~1_combout\,
	datae => \lRot|blk1|mult5|ALT_INV_y~0_combout\,
	dataf => \lRot|blk1|mult1|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult1|y~0_combout\);

-- Location: LABCELL_X88_Y36_N12
\lRot|blk1|mult2|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult2|y~0_combout\ = ( \dataIn[7]~input_o\ & ( \dataIn[0]~input_o\ & ( ((!\s[0]~input_o\ & (\dataIn[2]~input_o\)) # (\s[0]~input_o\ & ((\dataIn[1]~input_o\)))) # (\comb~0_combout\) ) ) ) # ( !\dataIn[7]~input_o\ & ( \dataIn[0]~input_o\ & ( 
-- (!\s[0]~input_o\ & (((\dataIn[2]~input_o\)) # (\comb~0_combout\))) # (\s[0]~input_o\ & (!\comb~0_combout\ & ((\dataIn[1]~input_o\)))) ) ) ) # ( \dataIn[7]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (!\comb~0_combout\ & 
-- (\dataIn[2]~input_o\))) # (\s[0]~input_o\ & (((\dataIn[1]~input_o\)) # (\comb~0_combout\))) ) ) ) # ( !\dataIn[7]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\comb~0_combout\ & ((!\s[0]~input_o\ & (\dataIn[2]~input_o\)) # (\s[0]~input_o\ & 
-- ((\dataIn[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001001100000110010101110100101010011011100011101101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[2]~input_o\,
	datad => \ALT_INV_dataIn[1]~input_o\,
	datae => \ALT_INV_dataIn[7]~input_o\,
	dataf => \ALT_INV_dataIn[0]~input_o\,
	combout => \lRot|blk1|mult2|y~0_combout\);

-- Location: LABCELL_X88_Y36_N36
\lRot|blk1|mult6|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult6|y~0_combout\ = ( \dataIn[6]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\ & (\dataIn[5]~input_o\)) # (\comb~0_combout\ & ((\dataIn[3]~input_o\))) ) ) ) # ( !\dataIn[6]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\ & 
-- (\dataIn[5]~input_o\)) # (\comb~0_combout\ & ((\dataIn[3]~input_o\))) ) ) ) # ( \dataIn[6]~input_o\ & ( !\s[0]~input_o\ & ( (!\comb~0_combout\) # (\dataIn[4]~input_o\) ) ) ) # ( !\dataIn[6]~input_o\ & ( !\s[0]~input_o\ & ( (\dataIn[4]~input_o\ & 
-- \comb~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001110111011101110100001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dataIn[4]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[5]~input_o\,
	datad => \ALT_INV_dataIn[3]~input_o\,
	datae => \ALT_INV_dataIn[6]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \lRot|blk1|mult6|y~0_combout\);

-- Location: LABCELL_X88_Y35_N36
\lRot|blk2|mult2|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult2|y~0_combout\ = ( \lRot|blk1|mult6|y~0_combout\ & ( \comb~1_combout\ ) ) # ( \lRot|blk1|mult6|y~0_combout\ & ( !\comb~1_combout\ & ( \lRot|blk1|mult2|y~0_combout\ ) ) ) # ( !\lRot|blk1|mult6|y~0_combout\ & ( !\comb~1_combout\ & ( 
-- \lRot|blk1|mult2|y~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \lRot|blk1|mult2|ALT_INV_y~0_combout\,
	datae => \lRot|blk1|mult6|ALT_INV_y~0_combout\,
	dataf => \ALT_INV_comb~1_combout\,
	combout => \lRot|blk2|mult2|y~0_combout\);

-- Location: LABCELL_X88_Y36_N18
\lRot|blk1|mult7|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult7|y~0_combout\ = ( \dataIn[6]~input_o\ & ( \s[0]~input_o\ & ( (!\comb~0_combout\) # (\dataIn[4]~input_o\) ) ) ) # ( !\dataIn[6]~input_o\ & ( \s[0]~input_o\ & ( (\dataIn[4]~input_o\ & \comb~0_combout\) ) ) ) # ( \dataIn[6]~input_o\ & ( 
-- !\s[0]~input_o\ & ( (!\comb~0_combout\ & ((\dataIn[7]~input_o\))) # (\comb~0_combout\ & (\dataIn[5]~input_o\)) ) ) ) # ( !\dataIn[6]~input_o\ & ( !\s[0]~input_o\ & ( (!\comb~0_combout\ & ((\dataIn[7]~input_o\))) # (\comb~0_combout\ & 
-- (\dataIn[5]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100010001000100011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_dataIn[4]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[5]~input_o\,
	datad => \ALT_INV_dataIn[7]~input_o\,
	datae => \ALT_INV_dataIn[6]~input_o\,
	dataf => \ALT_INV_s[0]~input_o\,
	combout => \lRot|blk1|mult7|y~0_combout\);

-- Location: LABCELL_X88_Y36_N24
\lRot|blk1|mult3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk1|mult3|y~0_combout\ = ( \dataIn[3]~input_o\ & ( \dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & ((!\comb~0_combout\) # ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ & (((\dataIn[2]~input_o\)) # (\comb~0_combout\))) ) ) ) # ( !\dataIn[3]~input_o\ & ( 
-- \dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (\comb~0_combout\ & ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ & (((\dataIn[2]~input_o\)) # (\comb~0_combout\))) ) ) ) # ( \dataIn[3]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & ((!\comb~0_combout\) 
-- # ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ & (!\comb~0_combout\ & (\dataIn[2]~input_o\))) ) ) ) # ( !\dataIn[3]~input_o\ & ( !\dataIn[0]~input_o\ & ( (!\s[0]~input_o\ & (\comb~0_combout\ & ((\dataIn[1]~input_o\)))) # (\s[0]~input_o\ & 
-- (!\comb~0_combout\ & (\dataIn[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110100011001010111000010101001101111001110110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s[0]~input_o\,
	datab => \ALT_INV_comb~0_combout\,
	datac => \ALT_INV_dataIn[2]~input_o\,
	datad => \ALT_INV_dataIn[1]~input_o\,
	datae => \ALT_INV_dataIn[3]~input_o\,
	dataf => \ALT_INV_dataIn[0]~input_o\,
	combout => \lRot|blk1|mult3|y~0_combout\);

-- Location: LABCELL_X88_Y35_N42
\lRot|blk2|mult3|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult3|y~0_combout\ = ( \lRot|blk1|mult3|y~0_combout\ & ( (!\comb~1_combout\) # (\lRot|blk1|mult7|y~0_combout\) ) ) # ( !\lRot|blk1|mult3|y~0_combout\ & ( (\lRot|blk1|mult7|y~0_combout\ & \comb~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001111111111001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \lRot|blk1|mult7|ALT_INV_y~0_combout\,
	datad => \ALT_INV_comb~1_combout\,
	dataf => \lRot|blk1|mult3|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult3|y~0_combout\);

-- Location: LABCELL_X88_Y36_N51
\lRot|blk2|mult4|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult4|y~0_combout\ = ( \lRot|blk1|mult0|y~0_combout\ & ( (\lRot|blk1|mult4|y~0_combout\) # (\comb~1_combout\) ) ) # ( !\lRot|blk1|mult0|y~0_combout\ & ( (!\comb~1_combout\ & \lRot|blk1|mult4|y~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_comb~1_combout\,
	datac => \lRot|blk1|mult4|ALT_INV_y~0_combout\,
	dataf => \lRot|blk1|mult0|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult4|y~0_combout\);

-- Location: LABCELL_X88_Y35_N21
\lRot|blk2|mult5|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult5|y~0_combout\ = ( \lRot|blk1|mult5|y~0_combout\ & ( \lRot|blk1|mult1|y~0_combout\ ) ) # ( !\lRot|blk1|mult5|y~0_combout\ & ( \lRot|blk1|mult1|y~0_combout\ & ( \comb~1_combout\ ) ) ) # ( \lRot|blk1|mult5|y~0_combout\ & ( 
-- !\lRot|blk1|mult1|y~0_combout\ & ( !\comb~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_comb~1_combout\,
	datae => \lRot|blk1|mult5|ALT_INV_y~0_combout\,
	dataf => \lRot|blk1|mult1|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult5|y~0_combout\);

-- Location: LABCELL_X88_Y35_N27
\lRot|blk2|mult6|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult6|y~0_combout\ = ( \lRot|blk1|mult6|y~0_combout\ & ( \comb~1_combout\ & ( \lRot|blk1|mult2|y~0_combout\ ) ) ) # ( !\lRot|blk1|mult6|y~0_combout\ & ( \comb~1_combout\ & ( \lRot|blk1|mult2|y~0_combout\ ) ) ) # ( \lRot|blk1|mult6|y~0_combout\ 
-- & ( !\comb~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \lRot|blk1|mult2|ALT_INV_y~0_combout\,
	datae => \lRot|blk1|mult6|ALT_INV_y~0_combout\,
	dataf => \ALT_INV_comb~1_combout\,
	combout => \lRot|blk2|mult6|y~0_combout\);

-- Location: LABCELL_X88_Y35_N33
\lRot|blk2|mult7|y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lRot|blk2|mult7|y~0_combout\ = ( \lRot|blk1|mult3|y~0_combout\ & ( (\lRot|blk1|mult7|y~0_combout\) # (\comb~1_combout\) ) ) # ( !\lRot|blk1|mult3|y~0_combout\ & ( (!\comb~1_combout\ & \lRot|blk1|mult7|y~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_comb~1_combout\,
	datac => \lRot|blk1|mult7|ALT_INV_y~0_combout\,
	dataf => \lRot|blk1|mult3|ALT_INV_y~0_combout\,
	combout => \lRot|blk2|mult7|y~0_combout\);

-- Location: MLABCELL_X52_Y21_N3
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


