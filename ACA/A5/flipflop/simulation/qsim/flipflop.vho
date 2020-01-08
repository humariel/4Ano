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

-- DATE "10/21/2019 16:44:58"

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

ENTITY 	flipflop IS
    PORT (
	clk : IN std_logic;
	D : IN std_logic;
	nSet : IN std_logic;
	nRst : IN std_logic;
	Q : OUT std_logic;
	nQ : OUT std_logic
	);
END flipflop;

-- Design Ports Information
-- Q	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nQ	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nRst	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nSet	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF flipflop IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_nSet : std_logic;
SIGNAL ww_nRst : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_nQ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \nRst~input_o\ : std_logic;
SIGNAL \nSet~input_o\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \lock~0_combout\ : std_logic;
SIGNAL \ckQ~3_combout\ : std_logic;
SIGNAL \iQ~0_combout\ : std_logic;
SIGNAL \iNQ~0_combout\ : std_logic;
SIGNAL \ALT_INV_clk~input_o\ : std_logic;
SIGNAL \ALT_INV_nSet~input_o\ : std_logic;
SIGNAL \ALT_INV_D~input_o\ : std_logic;
SIGNAL \ALT_INV_nRst~input_o\ : std_logic;
SIGNAL \ALT_INV_lock~0_combout\ : std_logic;
SIGNAL \ALT_INV_ckQ~3_combout\ : std_logic;
SIGNAL \ALT_INV_iQ~0_combout\ : std_logic;
SIGNAL \ALT_INV_iNQ~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_D <= D;
ww_nSet <= nSet;
ww_nRst <= nRst;
Q <= ww_Q;
nQ <= ww_nQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_clk~input_o\ <= NOT \clk~input_o\;
\ALT_INV_nSet~input_o\ <= NOT \nSet~input_o\;
\ALT_INV_D~input_o\ <= NOT \D~input_o\;
\ALT_INV_nRst~input_o\ <= NOT \nRst~input_o\;
\ALT_INV_lock~0_combout\ <= NOT \lock~0_combout\;
\ALT_INV_ckQ~3_combout\ <= NOT \ckQ~3_combout\;
\ALT_INV_iQ~0_combout\ <= NOT \iQ~0_combout\;
\ALT_INV_iNQ~0_combout\ <= NOT \iNQ~0_combout\;

-- Location: IOOBUF_X89_Y36_N39
\Q~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_iQ~0_combout\,
	devoe => ww_devoe,
	o => ww_Q);

-- Location: IOOBUF_X89_Y36_N56
\nQ~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_iNQ~0_combout\,
	devoe => ww_devoe,
	o => ww_nQ);

-- Location: IOIBUF_X89_Y38_N21
\nRst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nRst,
	o => \nRst~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\nSet~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nSet,
	o => \nSet~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\D~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

-- Location: IOIBUF_X89_Y38_N38
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: LABCELL_X88_Y38_N21
\lock~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \lock~0_combout\ = ( \lock~0_combout\ & ( \clk~input_o\ ) ) # ( !\lock~0_combout\ & ( \clk~input_o\ & ( (!\nSet~input_o\) # ((!\ckQ~3_combout\) # (!\nRst~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111110101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_nSet~input_o\,
	datac => \ALT_INV_ckQ~3_combout\,
	datad => \ALT_INV_nRst~input_o\,
	datae => \ALT_INV_lock~0_combout\,
	dataf => \ALT_INV_clk~input_o\,
	combout => \lock~0_combout\);

-- Location: LABCELL_X88_Y38_N57
\ckQ~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ckQ~3_combout\ = ( \clk~input_o\ & ( (!\nRst~input_o\) # ((!\nSet~input_o\) # ((!\ckQ~3_combout\) # (\lock~0_combout\))) ) ) # ( !\clk~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111110111111111111111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_nRst~input_o\,
	datab => \ALT_INV_nSet~input_o\,
	datac => \ALT_INV_ckQ~3_combout\,
	datad => \ALT_INV_lock~0_combout\,
	dataf => \ALT_INV_clk~input_o\,
	combout => \ckQ~3_combout\);

-- Location: LABCELL_X88_Y38_N51
\iQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \iQ~0_combout\ = ( \D~input_o\ & ( \ckQ~3_combout\ & ( (\nSet~input_o\ & ((!\nRst~input_o\) # (\iQ~0_combout\))) ) ) ) # ( !\D~input_o\ & ( \ckQ~3_combout\ & ( (\nSet~input_o\ & ((!\nRst~input_o\) # (\iQ~0_combout\))) ) ) ) # ( \D~input_o\ & ( 
-- !\ckQ~3_combout\ & ( (!\nRst~input_o\ & \nSet~input_o\) ) ) ) # ( !\D~input_o\ & ( !\ckQ~3_combout\ & ( \nSet~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001010101000000000101011110000000010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_nRst~input_o\,
	datac => \ALT_INV_iQ~0_combout\,
	datad => \ALT_INV_nSet~input_o\,
	datae => \ALT_INV_D~input_o\,
	dataf => \ALT_INV_ckQ~3_combout\,
	combout => \iQ~0_combout\);

-- Location: LABCELL_X88_Y38_N54
\iNQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \iNQ~0_combout\ = ( \ckQ~3_combout\ & ( (\nRst~input_o\ & !\iQ~0_combout\) ) ) # ( !\ckQ~3_combout\ & ( (\nRst~input_o\ & (!\iQ~0_combout\ & ((!\nSet~input_o\) # (\D~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010100000000010001010000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_nRst~input_o\,
	datab => \ALT_INV_nSet~input_o\,
	datac => \ALT_INV_D~input_o\,
	datad => \ALT_INV_iQ~0_combout\,
	dataf => \ALT_INV_ckQ~3_combout\,
	combout => \iNQ~0_combout\);

-- Location: LABCELL_X85_Y28_N0
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


