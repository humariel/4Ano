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

-- DATE "10/30/2019 02:58:07"

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

ENTITY 	PC_32 IS
    PORT (
	datain : IN std_logic_vector(31 DOWNTO 0);
	count : OUT std_logic_vector(5 DOWNTO 0)
	);
END PC_32;

-- Design Ports Information
-- count[0]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[1]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[2]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[3]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[4]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- count[5]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[2]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[3]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[0]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[1]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[6]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[7]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[4]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[5]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[10]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[11]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[8]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[9]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[14]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[15]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[12]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[13]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[18]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[19]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[16]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[17]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[22]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[23]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[20]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[21]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[26]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[27]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[24]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[25]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[30]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[31]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[28]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- datain[29]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PC_32 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_datain : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_count : std_logic_vector(5 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \datain[30]~input_o\ : std_logic;
SIGNAL \datain[28]~input_o\ : std_logic;
SIGNAL \datain[31]~input_o\ : std_logic;
SIGNAL \datain[29]~input_o\ : std_logic;
SIGNAL \datain[17]~input_o\ : std_logic;
SIGNAL \datain[16]~input_o\ : std_logic;
SIGNAL \datain[19]~input_o\ : std_logic;
SIGNAL \datain[18]~input_o\ : std_logic;
SIGNAL \datain[20]~input_o\ : std_logic;
SIGNAL \datain[21]~input_o\ : std_logic;
SIGNAL \datain[23]~input_o\ : std_logic;
SIGNAL \datain[22]~input_o\ : std_logic;
SIGNAL \datain[24]~input_o\ : std_logic;
SIGNAL \datain[25]~input_o\ : std_logic;
SIGNAL \datain[26]~input_o\ : std_logic;
SIGNAL \datain[27]~input_o\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_0|sum~0_combout\ : std_logic;
SIGNAL \datain[14]~input_o\ : std_logic;
SIGNAL \datain[15]~input_o\ : std_logic;
SIGNAL \datain[12]~input_o\ : std_logic;
SIGNAL \datain[13]~input_o\ : std_logic;
SIGNAL \datain[1]~input_o\ : std_logic;
SIGNAL \datain[3]~input_o\ : std_logic;
SIGNAL \datain[0]~input_o\ : std_logic;
SIGNAL \datain[2]~input_o\ : std_logic;
SIGNAL \datain[11]~input_o\ : std_logic;
SIGNAL \datain[10]~input_o\ : std_logic;
SIGNAL \datain[9]~input_o\ : std_logic;
SIGNAL \datain[8]~input_o\ : std_logic;
SIGNAL \datain[7]~input_o\ : std_logic;
SIGNAL \datain[5]~input_o\ : std_logic;
SIGNAL \datain[6]~input_o\ : std_logic;
SIGNAL \datain[4]~input_o\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_0|sum~0_combout\ : std_logic;
SIGNAL \FA5|fa1|fa1bit_0|sum~0_combout\ : std_logic;
SIGNAL \PC4_4|count[1]~0_combout\ : std_logic;
SIGNAL \PC4_5|count[1]~0_combout\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_1|sum~0_combout\ : std_logic;
SIGNAL \PC4_3|count[1]~0_combout\ : std_logic;
SIGNAL \PC4_2|count[1]~0_combout\ : std_logic;
SIGNAL \FA3_1|fa2bit|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \PC4_1|count[1]~0_combout\ : std_logic;
SIGNAL \PC4_0|count[1]~0_combout\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_1|sum~0_combout\ : std_logic;
SIGNAL \PC4_6|count[1]~0_combout\ : std_logic;
SIGNAL \PC4_7|count[1]~0_combout\ : std_logic;
SIGNAL \FA3_3|fa2bit|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA5|fa1|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA5|fa1|fa1bit_1|cout~combout\ : std_logic;
SIGNAL \FA3_2|fa2bit|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA3_2|fa2bit|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA3_3|fa2bit|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_0|cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA3_0|fa2bit|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_0|cout~0_combout\ : std_logic;
SIGNAL \FA3_0|fa2bit|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA3_1|fa2bit|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA5|fa2|fa1bit|sum~combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|sum~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|sum~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA5|fa2|fa2bit|fa1bit_0|sum~combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_0|cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|cout~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_0|cout~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|cout~0_combout\ : std_logic;
SIGNAL \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ : std_logic;
SIGNAL \FA5|fa2|fa2bit|fa1bit_1|sum~combout\ : std_logic;
SIGNAL \FA5|fa2|fa2bit|fa1bit_1|cout~0_combout\ : std_logic;
SIGNAL \PC4_7|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_6|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_5|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_4|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_3|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_2|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_1|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_0|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_datain[29]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[28]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[31]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[30]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[25]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[24]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[27]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[26]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[21]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[20]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[23]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[22]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[19]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[18]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_datain[2]~input_o\ : std_logic;
SIGNAL \FA5|fa2|fa2bit|fa1bit_0|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_0|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_0|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \FA5|fa1|fa1bit_1|ALT_INV_cout~combout\ : std_logic;
SIGNAL \FA4_1|fa2|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA3_3|fa2bit|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_7|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_6|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \FA3_2|fa2bit|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_5|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_4|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \FA3_2|fa2bit|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_0|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_0|fa2|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA3_1|fa2bit|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_3|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_2|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \FA3_0|fa2bit|fa1bit_1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_1|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \PC4_0|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \FA3_0|fa2bit|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_0|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \PC4_5|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \PC4_4|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \PC4_1|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \PC4_0|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_7|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \PC4_6|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \PC4_3|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \PC4_2|ALT_INV_count[1]~0_combout\ : std_logic;
SIGNAL \FA4_1|fa1|fa1bit_0|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \FA4_0|fa1|fa1bit_0|ALT_INV_sum~0_combout\ : std_logic;

BEGIN

ww_datain <= datain;
count <= ww_count;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_datain[29]~input_o\ <= NOT \datain[29]~input_o\;
\ALT_INV_datain[28]~input_o\ <= NOT \datain[28]~input_o\;
\ALT_INV_datain[31]~input_o\ <= NOT \datain[31]~input_o\;
\ALT_INV_datain[30]~input_o\ <= NOT \datain[30]~input_o\;
\ALT_INV_datain[25]~input_o\ <= NOT \datain[25]~input_o\;
\ALT_INV_datain[24]~input_o\ <= NOT \datain[24]~input_o\;
\ALT_INV_datain[27]~input_o\ <= NOT \datain[27]~input_o\;
\ALT_INV_datain[26]~input_o\ <= NOT \datain[26]~input_o\;
\ALT_INV_datain[21]~input_o\ <= NOT \datain[21]~input_o\;
\ALT_INV_datain[20]~input_o\ <= NOT \datain[20]~input_o\;
\ALT_INV_datain[23]~input_o\ <= NOT \datain[23]~input_o\;
\ALT_INV_datain[22]~input_o\ <= NOT \datain[22]~input_o\;
\ALT_INV_datain[17]~input_o\ <= NOT \datain[17]~input_o\;
\ALT_INV_datain[16]~input_o\ <= NOT \datain[16]~input_o\;
\ALT_INV_datain[19]~input_o\ <= NOT \datain[19]~input_o\;
\ALT_INV_datain[18]~input_o\ <= NOT \datain[18]~input_o\;
\ALT_INV_datain[13]~input_o\ <= NOT \datain[13]~input_o\;
\ALT_INV_datain[12]~input_o\ <= NOT \datain[12]~input_o\;
\ALT_INV_datain[15]~input_o\ <= NOT \datain[15]~input_o\;
\ALT_INV_datain[14]~input_o\ <= NOT \datain[14]~input_o\;
\ALT_INV_datain[9]~input_o\ <= NOT \datain[9]~input_o\;
\ALT_INV_datain[8]~input_o\ <= NOT \datain[8]~input_o\;
\ALT_INV_datain[11]~input_o\ <= NOT \datain[11]~input_o\;
\ALT_INV_datain[10]~input_o\ <= NOT \datain[10]~input_o\;
\ALT_INV_datain[5]~input_o\ <= NOT \datain[5]~input_o\;
\ALT_INV_datain[4]~input_o\ <= NOT \datain[4]~input_o\;
\ALT_INV_datain[7]~input_o\ <= NOT \datain[7]~input_o\;
\ALT_INV_datain[6]~input_o\ <= NOT \datain[6]~input_o\;
\ALT_INV_datain[1]~input_o\ <= NOT \datain[1]~input_o\;
\ALT_INV_datain[0]~input_o\ <= NOT \datain[0]~input_o\;
\ALT_INV_datain[3]~input_o\ <= NOT \datain[3]~input_o\;
\ALT_INV_datain[2]~input_o\ <= NOT \datain[2]~input_o\;
\FA5|fa2|fa2bit|fa1bit_0|ALT_INV_cout~0_combout\ <= NOT \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\;
\FA4_1|fa2|fa1bit_1|ALT_INV_cout~0_combout\ <= NOT \FA4_1|fa2|fa1bit_1|cout~0_combout\;
\FA4_1|fa2|fa1bit_0|ALT_INV_cout~0_combout\ <= NOT \FA4_1|fa2|fa1bit_0|cout~0_combout\;
\FA4_0|fa2|fa1bit_1|ALT_INV_cout~0_combout\ <= NOT \FA4_0|fa2|fa1bit_1|cout~0_combout\;
\FA4_0|fa2|fa1bit_0|ALT_INV_cout~0_combout\ <= NOT \FA4_0|fa2|fa1bit_0|cout~0_combout\;
\FA4_1|fa2|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA4_1|fa2|fa1bit_1|sum~combout\;
\FA4_1|fa2|fa1bit_1|ALT_INV_sum~0_combout\ <= NOT \FA4_1|fa2|fa1bit_1|sum~0_combout\;
\FA4_0|fa2|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA4_0|fa2|fa1bit_1|sum~combout\;
\FA4_0|fa2|fa1bit_1|ALT_INV_sum~0_combout\ <= NOT \FA4_0|fa2|fa1bit_1|sum~0_combout\;
\FA5|fa1|fa1bit_1|ALT_INV_cout~combout\ <= NOT \FA5|fa1|fa1bit_1|cout~combout\;
\FA4_1|fa2|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA4_1|fa2|fa1bit_0|sum~combout\;
\FA3_3|fa2bit|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA3_3|fa2bit|fa1bit_1|sum~combout\;
\PC4_7|ALT_INV_count\(2) <= NOT \PC4_7|count\(2);
\PC4_6|ALT_INV_count\(2) <= NOT \PC4_6|count\(2);
\FA3_2|fa2bit|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA3_2|fa2bit|fa1bit_1|sum~combout\;
\PC4_5|ALT_INV_count\(2) <= NOT \PC4_5|count\(2);
\PC4_4|ALT_INV_count\(2) <= NOT \PC4_4|count\(2);
\FA3_2|fa2bit|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA3_2|fa2bit|fa1bit_0|sum~combout\;
\FA4_1|fa1|fa1bit_0|ALT_INV_cout~0_combout\ <= NOT \FA4_1|fa1|fa1bit_0|cout~0_combout\;
\FA4_0|fa2|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA4_0|fa2|fa1bit_0|sum~combout\;
\FA3_1|fa2bit|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA3_1|fa2bit|fa1bit_1|sum~combout\;
\PC4_3|ALT_INV_count\(2) <= NOT \PC4_3|count\(2);
\PC4_2|ALT_INV_count\(2) <= NOT \PC4_2|count\(2);
\FA3_0|fa2bit|fa1bit_1|ALT_INV_sum~combout\ <= NOT \FA3_0|fa2bit|fa1bit_1|sum~combout\;
\PC4_1|ALT_INV_count\(2) <= NOT \PC4_1|count\(2);
\PC4_0|ALT_INV_count\(2) <= NOT \PC4_0|count\(2);
\FA3_0|fa2bit|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA3_0|fa2bit|fa1bit_0|sum~combout\;
\FA4_0|fa1|fa1bit_0|ALT_INV_cout~0_combout\ <= NOT \FA4_0|fa1|fa1bit_0|cout~0_combout\;
\FA4_1|fa1|fa1bit_1|ALT_INV_sum~0_combout\ <= NOT \FA4_1|fa1|fa1bit_1|sum~0_combout\;
\PC4_5|ALT_INV_count[1]~0_combout\ <= NOT \PC4_5|count[1]~0_combout\;
\PC4_4|ALT_INV_count[1]~0_combout\ <= NOT \PC4_4|count[1]~0_combout\;
\FA4_0|fa1|fa1bit_1|ALT_INV_sum~0_combout\ <= NOT \FA4_0|fa1|fa1bit_1|sum~0_combout\;
\PC4_1|ALT_INV_count[1]~0_combout\ <= NOT \PC4_1|count[1]~0_combout\;
\PC4_0|ALT_INV_count[1]~0_combout\ <= NOT \PC4_0|count[1]~0_combout\;
\FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA3_3|fa2bit|fa1bit_0|sum~combout\;
\PC4_7|ALT_INV_count[1]~0_combout\ <= NOT \PC4_7|count[1]~0_combout\;
\PC4_6|ALT_INV_count[1]~0_combout\ <= NOT \PC4_6|count[1]~0_combout\;
\FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\ <= NOT \FA3_1|fa2bit|fa1bit_0|sum~combout\;
\PC4_3|ALT_INV_count[1]~0_combout\ <= NOT \PC4_3|count[1]~0_combout\;
\PC4_2|ALT_INV_count[1]~0_combout\ <= NOT \PC4_2|count[1]~0_combout\;
\FA4_1|fa1|fa1bit_0|ALT_INV_sum~0_combout\ <= NOT \FA4_1|fa1|fa1bit_0|sum~0_combout\;
\PC4_7|ALT_INV_count\(0) <= NOT \PC4_7|count\(0);
\PC4_6|ALT_INV_count\(0) <= NOT \PC4_6|count\(0);
\PC4_5|ALT_INV_count\(0) <= NOT \PC4_5|count\(0);
\PC4_4|ALT_INV_count\(0) <= NOT \PC4_4|count\(0);
\FA4_0|fa1|fa1bit_0|ALT_INV_sum~0_combout\ <= NOT \FA4_0|fa1|fa1bit_0|sum~0_combout\;
\PC4_3|ALT_INV_count\(0) <= NOT \PC4_3|count\(0);
\PC4_2|ALT_INV_count\(0) <= NOT \PC4_2|count\(0);
\PC4_1|ALT_INV_count\(0) <= NOT \PC4_1|count\(0);
\PC4_0|ALT_INV_count\(0) <= NOT \PC4_0|count\(0);

-- Location: IOOBUF_X89_Y6_N22
\count[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa1|fa1bit_0|sum~0_combout\,
	devoe => ww_devoe,
	o => ww_count(0));

-- Location: IOOBUF_X89_Y6_N56
\count[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa1|fa1bit_1|sum~combout\,
	devoe => ww_devoe,
	o => ww_count(1));

-- Location: IOOBUF_X89_Y4_N79
\count[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa2|fa1bit|sum~combout\,
	devoe => ww_devoe,
	o => ww_count(2));

-- Location: IOOBUF_X89_Y4_N62
\count[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa2|fa2bit|fa1bit_0|sum~combout\,
	devoe => ww_devoe,
	o => ww_count(3));

-- Location: IOOBUF_X70_Y0_N53
\count[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa2|fa2bit|fa1bit_1|sum~combout\,
	devoe => ww_devoe,
	o => ww_count(4));

-- Location: IOOBUF_X89_Y9_N5
\count[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA5|fa2|fa2bit|fa1bit_1|cout~0_combout\,
	devoe => ww_devoe,
	o => ww_count(5));

-- Location: IOIBUF_X89_Y9_N38
\datain[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(30),
	o => \datain[30]~input_o\);

-- Location: IOIBUF_X89_Y4_N95
\datain[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(28),
	o => \datain[28]~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\datain[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(31),
	o => \datain[31]~input_o\);

-- Location: IOIBUF_X72_Y0_N1
\datain[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(29),
	o => \datain[29]~input_o\);

-- Location: LABCELL_X88_Y19_N39
\PC4_7|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_7|count\(0) = ( \datain[31]~input_o\ & ( \datain[29]~input_o\ & ( !\datain[30]~input_o\ $ (!\datain[28]~input_o\) ) ) ) # ( !\datain[31]~input_o\ & ( \datain[29]~input_o\ & ( !\datain[30]~input_o\ $ (\datain[28]~input_o\) ) ) ) # ( 
-- \datain[31]~input_o\ & ( !\datain[29]~input_o\ & ( !\datain[30]~input_o\ $ (\datain[28]~input_o\) ) ) ) # ( !\datain[31]~input_o\ & ( !\datain[29]~input_o\ & ( !\datain[30]~input_o\ $ (!\datain[28]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010101010100101010110101010010101010101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[30]~input_o\,
	datad => \ALT_INV_datain[28]~input_o\,
	datae => \ALT_INV_datain[31]~input_o\,
	dataf => \ALT_INV_datain[29]~input_o\,
	combout => \PC4_7|count\(0));

-- Location: IOIBUF_X68_Y0_N52
\datain[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(17),
	o => \datain[17]~input_o\);

-- Location: IOIBUF_X89_Y37_N4
\datain[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(16),
	o => \datain[16]~input_o\);

-- Location: IOIBUF_X89_Y38_N38
\datain[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(19),
	o => \datain[19]~input_o\);

-- Location: IOIBUF_X89_Y37_N55
\datain[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(18),
	o => \datain[18]~input_o\);

-- Location: LABCELL_X88_Y22_N12
\PC4_4|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_4|count\(0) = ( \datain[18]~input_o\ & ( !\datain[17]~input_o\ $ (!\datain[16]~input_o\ $ (!\datain[19]~input_o\)) ) ) # ( !\datain[18]~input_o\ & ( !\datain[17]~input_o\ $ (!\datain[16]~input_o\ $ (\datain[19]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010011001011001101001100110011001011001101001100101100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[17]~input_o\,
	datab => \ALT_INV_datain[16]~input_o\,
	datad => \ALT_INV_datain[19]~input_o\,
	dataf => \ALT_INV_datain[18]~input_o\,
	combout => \PC4_4|count\(0));

-- Location: IOIBUF_X72_Y0_N18
\datain[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(20),
	o => \datain[20]~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\datain[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(21),
	o => \datain[21]~input_o\);

-- Location: IOIBUF_X89_Y6_N4
\datain[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(23),
	o => \datain[23]~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\datain[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(22),
	o => \datain[22]~input_o\);

-- Location: LABCELL_X88_Y19_N30
\PC4_5|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_5|count\(0) = ( \datain[23]~input_o\ & ( \datain[22]~input_o\ & ( !\datain[20]~input_o\ $ (!\datain[21]~input_o\) ) ) ) # ( !\datain[23]~input_o\ & ( \datain[22]~input_o\ & ( !\datain[20]~input_o\ $ (\datain[21]~input_o\) ) ) ) # ( 
-- \datain[23]~input_o\ & ( !\datain[22]~input_o\ & ( !\datain[20]~input_o\ $ (\datain[21]~input_o\) ) ) ) # ( !\datain[23]~input_o\ & ( !\datain[22]~input_o\ & ( !\datain[20]~input_o\ $ (!\datain[21]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100110000111100001111000011110000110011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_datain[20]~input_o\,
	datac => \ALT_INV_datain[21]~input_o\,
	datae => \ALT_INV_datain[23]~input_o\,
	dataf => \ALT_INV_datain[22]~input_o\,
	combout => \PC4_5|count\(0));

-- Location: IOIBUF_X72_Y0_N35
\datain[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(24),
	o => \datain[24]~input_o\);

-- Location: IOIBUF_X89_Y35_N95
\datain[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(25),
	o => \datain[25]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\datain[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(26),
	o => \datain[26]~input_o\);

-- Location: IOIBUF_X89_Y37_N21
\datain[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(27),
	o => \datain[27]~input_o\);

-- Location: LABCELL_X88_Y22_N18
\PC4_6|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_6|count\(0) = ( \datain[27]~input_o\ & ( !\datain[24]~input_o\ $ (!\datain[25]~input_o\ $ (!\datain[26]~input_o\)) ) ) # ( !\datain[27]~input_o\ & ( !\datain[24]~input_o\ $ (!\datain[25]~input_o\ $ (\datain[26]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011001111001100001111000011001111001100001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_datain[24]~input_o\,
	datac => \ALT_INV_datain[25]~input_o\,
	datad => \ALT_INV_datain[26]~input_o\,
	dataf => \ALT_INV_datain[27]~input_o\,
	combout => \PC4_6|count\(0));

-- Location: LABCELL_X88_Y22_N21
\FA4_1|fa1|fa1bit_0|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa1|fa1bit_0|sum~0_combout\ = ( \PC4_6|count\(0) & ( !\PC4_7|count\(0) $ (!\PC4_4|count\(0) $ (!\PC4_5|count\(0))) ) ) # ( !\PC4_6|count\(0) & ( !\PC4_7|count\(0) $ (!\PC4_4|count\(0) $ (\PC4_5|count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101010100101010110101010010110100101010110101010010101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_7|ALT_INV_count\(0),
	datac => \PC4_4|ALT_INV_count\(0),
	datad => \PC4_5|ALT_INV_count\(0),
	dataf => \PC4_6|ALT_INV_count\(0),
	combout => \FA4_1|fa1|fa1bit_0|sum~0_combout\);

-- Location: IOIBUF_X89_Y36_N55
\datain[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(14),
	o => \datain[14]~input_o\);

-- Location: IOIBUF_X89_Y38_N4
\datain[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(15),
	o => \datain[15]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\datain[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(12),
	o => \datain[12]~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\datain[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(13),
	o => \datain[13]~input_o\);

-- Location: LABCELL_X88_Y22_N36
\PC4_3|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_3|count\(0) = !\datain[14]~input_o\ $ (!\datain[15]~input_o\ $ (!\datain[12]~input_o\ $ (!\datain[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110011010011001011001101001100101100110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[14]~input_o\,
	datab => \ALT_INV_datain[15]~input_o\,
	datac => \ALT_INV_datain[12]~input_o\,
	datad => \ALT_INV_datain[13]~input_o\,
	combout => \PC4_3|count\(0));

-- Location: IOIBUF_X89_Y8_N21
\datain[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(1),
	o => \datain[1]~input_o\);

-- Location: IOIBUF_X72_Y0_N52
\datain[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(3),
	o => \datain[3]~input_o\);

-- Location: IOIBUF_X70_Y0_N1
\datain[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(0),
	o => \datain[0]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\datain[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(2),
	o => \datain[2]~input_o\);

-- Location: MLABCELL_X87_Y20_N30
\PC4_0|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_0|count\(0) = ( \datain[2]~input_o\ & ( !\datain[1]~input_o\ $ (!\datain[3]~input_o\ $ (!\datain[0]~input_o\)) ) ) # ( !\datain[2]~input_o\ & ( !\datain[1]~input_o\ $ (!\datain[3]~input_o\ $ (\datain[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010011001011001101001100110011001011001101001100101100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datab => \ALT_INV_datain[3]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	dataf => \ALT_INV_datain[2]~input_o\,
	combout => \PC4_0|count\(0));

-- Location: IOIBUF_X89_Y35_N61
\datain[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(11),
	o => \datain[11]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\datain[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(10),
	o => \datain[10]~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\datain[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(9),
	o => \datain[9]~input_o\);

-- Location: IOIBUF_X89_Y37_N38
\datain[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(8),
	o => \datain[8]~input_o\);

-- Location: LABCELL_X88_Y22_N33
\PC4_2|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_2|count\(0) = ( \datain[8]~input_o\ & ( !\datain[11]~input_o\ $ (!\datain[10]~input_o\ $ (!\datain[9]~input_o\)) ) ) # ( !\datain[8]~input_o\ & ( !\datain[11]~input_o\ $ (!\datain[10]~input_o\ $ (\datain[9]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010011001011001101001100110011001011001101001100101100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[11]~input_o\,
	datab => \ALT_INV_datain[10]~input_o\,
	datad => \ALT_INV_datain[9]~input_o\,
	dataf => \ALT_INV_datain[8]~input_o\,
	combout => \PC4_2|count\(0));

-- Location: IOIBUF_X89_Y8_N4
\datain[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(7),
	o => \datain[7]~input_o\);

-- Location: IOIBUF_X89_Y6_N38
\datain[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(5),
	o => \datain[5]~input_o\);

-- Location: IOIBUF_X89_Y8_N38
\datain[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(6),
	o => \datain[6]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\datain[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_datain(4),
	o => \datain[4]~input_o\);

-- Location: LABCELL_X88_Y20_N30
\PC4_1|count[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_1|count\(0) = ( \datain[4]~input_o\ & ( !\datain[7]~input_o\ $ (!\datain[5]~input_o\ $ (!\datain[6]~input_o\)) ) ) # ( !\datain[4]~input_o\ & ( !\datain[7]~input_o\ $ (!\datain[5]~input_o\ $ (\datain[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010011001011001101001100110011001011001101001100101100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[7]~input_o\,
	datab => \ALT_INV_datain[5]~input_o\,
	datad => \ALT_INV_datain[6]~input_o\,
	dataf => \ALT_INV_datain[4]~input_o\,
	combout => \PC4_1|count\(0));

-- Location: MLABCELL_X87_Y20_N9
\FA4_0|fa1|fa1bit_0|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa1|fa1bit_0|sum~0_combout\ = ( \PC4_1|count\(0) & ( !\PC4_3|count\(0) $ (!\PC4_0|count\(0) $ (!\PC4_2|count\(0))) ) ) # ( !\PC4_1|count\(0) & ( !\PC4_3|count\(0) $ (!\PC4_0|count\(0) $ (\PC4_2|count\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101010100101010110101010010110100101010110101010010101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_3|ALT_INV_count\(0),
	datac => \PC4_0|ALT_INV_count\(0),
	datad => \PC4_2|ALT_INV_count\(0),
	dataf => \PC4_1|ALT_INV_count\(0),
	combout => \FA4_0|fa1|fa1bit_0|sum~0_combout\);

-- Location: LABCELL_X88_Y20_N9
\FA5|fa1|fa1bit_0|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa1|fa1bit_0|sum~0_combout\ = ( \FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_1|fa1|fa1bit_0|sum~0_combout\ ) ) # ( !\FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( \FA4_1|fa1|fa1bit_0|sum~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \FA4_1|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	dataf => \FA4_0|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	combout => \FA5|fa1|fa1bit_0|sum~0_combout\);

-- Location: LABCELL_X88_Y22_N15
\PC4_4|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_4|count[1]~0_combout\ = ( \datain[18]~input_o\ & ( (!\datain[17]~input_o\ & (!\datain[16]~input_o\ & !\datain[19]~input_o\)) # (\datain[17]~input_o\ & (\datain[16]~input_o\ & \datain[19]~input_o\)) ) ) # ( !\datain[18]~input_o\ & ( 
-- (!\datain[17]~input_o\ & ((!\datain[16]~input_o\) # (!\datain[19]~input_o\))) # (\datain[17]~input_o\ & (!\datain[16]~input_o\ & !\datain[19]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110100011101000111010001110100010000001100000011000000110000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[17]~input_o\,
	datab => \ALT_INV_datain[16]~input_o\,
	datac => \ALT_INV_datain[19]~input_o\,
	dataf => \ALT_INV_datain[18]~input_o\,
	combout => \PC4_4|count[1]~0_combout\);

-- Location: LABCELL_X88_Y22_N9
\PC4_5|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_5|count[1]~0_combout\ = ( \datain[21]~input_o\ & ( (!\datain[23]~input_o\ & (!\datain[20]~input_o\ & !\datain[22]~input_o\)) # (\datain[23]~input_o\ & (\datain[20]~input_o\ & \datain[22]~input_o\)) ) ) # ( !\datain[21]~input_o\ & ( 
-- (!\datain[23]~input_o\ & ((!\datain[20]~input_o\) # (!\datain[22]~input_o\))) # (\datain[23]~input_o\ & (!\datain[20]~input_o\ & !\datain[22]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010100000111110101010000010100000000001011010000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[23]~input_o\,
	datac => \ALT_INV_datain[20]~input_o\,
	datad => \ALT_INV_datain[22]~input_o\,
	dataf => \ALT_INV_datain[21]~input_o\,
	combout => \PC4_5|count[1]~0_combout\);

-- Location: LABCELL_X88_Y22_N42
\FA4_1|fa1|fa1bit_1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa1|fa1bit_1|sum~0_combout\ = ( \PC4_5|count\(0) & ( \PC4_4|count\(0) & ( !\PC4_4|count[1]~0_combout\ $ (\PC4_5|count[1]~0_combout\) ) ) ) # ( !\PC4_5|count\(0) & ( \PC4_4|count\(0) & ( !\PC4_6|count\(0) $ (!\PC4_4|count[1]~0_combout\ $ 
-- (!\PC4_7|count\(0) $ (!\PC4_5|count[1]~0_combout\))) ) ) ) # ( \PC4_5|count\(0) & ( !\PC4_4|count\(0) & ( !\PC4_6|count\(0) $ (!\PC4_4|count[1]~0_combout\ $ (!\PC4_7|count\(0) $ (!\PC4_5|count[1]~0_combout\))) ) ) ) # ( !\PC4_5|count\(0) & ( 
-- !\PC4_4|count\(0) & ( !\PC4_4|count[1]~0_combout\ $ (!\PC4_5|count[1]~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111001100011010011001011001101001100101101100110000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_6|ALT_INV_count\(0),
	datab => \PC4_4|ALT_INV_count[1]~0_combout\,
	datac => \PC4_7|ALT_INV_count\(0),
	datad => \PC4_5|ALT_INV_count[1]~0_combout\,
	datae => \PC4_5|ALT_INV_count\(0),
	dataf => \PC4_4|ALT_INV_count\(0),
	combout => \FA4_1|fa1|fa1bit_1|sum~0_combout\);

-- Location: LABCELL_X88_Y22_N39
\PC4_3|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_3|count[1]~0_combout\ = (!\datain[14]~input_o\ & ((!\datain[15]~input_o\ & ((!\datain[12]~input_o\) # (!\datain[13]~input_o\))) # (\datain[15]~input_o\ & (!\datain[12]~input_o\ & !\datain[13]~input_o\)))) # (\datain[14]~input_o\ & 
-- ((!\datain[15]~input_o\ & (!\datain[12]~input_o\ & !\datain[13]~input_o\)) # (\datain[15]~input_o\ & (\datain[12]~input_o\ & \datain[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110100010000001111010001000000111101000100000011110100010000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[14]~input_o\,
	datab => \ALT_INV_datain[15]~input_o\,
	datac => \ALT_INV_datain[12]~input_o\,
	datad => \ALT_INV_datain[13]~input_o\,
	combout => \PC4_3|count[1]~0_combout\);

-- Location: LABCELL_X88_Y22_N27
\PC4_2|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_2|count[1]~0_combout\ = ( \datain[8]~input_o\ & ( (!\datain[9]~input_o\ & (!\datain[10]~input_o\ & !\datain[11]~input_o\)) # (\datain[9]~input_o\ & (\datain[10]~input_o\ & \datain[11]~input_o\)) ) ) # ( !\datain[8]~input_o\ & ( (!\datain[9]~input_o\ 
-- & ((!\datain[10]~input_o\) # (!\datain[11]~input_o\))) # (\datain[9]~input_o\ & (!\datain[10]~input_o\ & !\datain[11]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010100000111110101010000010100000000001011010000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[9]~input_o\,
	datac => \ALT_INV_datain[10]~input_o\,
	datad => \ALT_INV_datain[11]~input_o\,
	dataf => \ALT_INV_datain[8]~input_o\,
	combout => \PC4_2|count[1]~0_combout\);

-- Location: MLABCELL_X87_Y20_N42
\FA3_1|fa2bit|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_1|fa2bit|fa1bit_0|sum~combout\ = ( \PC4_3|count\(0) & ( !\PC4_3|count[1]~0_combout\ $ (!\PC4_2|count[1]~0_combout\ $ (\PC4_2|count\(0))) ) ) # ( !\PC4_3|count\(0) & ( !\PC4_3|count[1]~0_combout\ $ (!\PC4_2|count[1]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011110000111100110000110011110011000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \PC4_3|ALT_INV_count[1]~0_combout\,
	datac => \PC4_2|ALT_INV_count[1]~0_combout\,
	datad => \PC4_2|ALT_INV_count\(0),
	dataf => \PC4_3|ALT_INV_count\(0),
	combout => \FA3_1|fa2bit|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y20_N33
\PC4_1|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_1|count[1]~0_combout\ = ( \datain[4]~input_o\ & ( (!\datain[7]~input_o\ & (!\datain[5]~input_o\ & !\datain[6]~input_o\)) # (\datain[7]~input_o\ & (\datain[5]~input_o\ & \datain[6]~input_o\)) ) ) # ( !\datain[4]~input_o\ & ( (!\datain[7]~input_o\ & 
-- ((!\datain[5]~input_o\) # (!\datain[6]~input_o\))) # (\datain[7]~input_o\ & (!\datain[5]~input_o\ & !\datain[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110100011101000111010001110100010000001100000011000000110000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[7]~input_o\,
	datab => \ALT_INV_datain[5]~input_o\,
	datac => \ALT_INV_datain[6]~input_o\,
	dataf => \ALT_INV_datain[4]~input_o\,
	combout => \PC4_1|count[1]~0_combout\);

-- Location: MLABCELL_X87_Y20_N33
\PC4_0|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_0|count[1]~0_combout\ = ( \datain[2]~input_o\ & ( (!\datain[1]~input_o\ & (!\datain[3]~input_o\ & !\datain[0]~input_o\)) # (\datain[1]~input_o\ & (\datain[3]~input_o\ & \datain[0]~input_o\)) ) ) # ( !\datain[2]~input_o\ & ( (!\datain[1]~input_o\ & 
-- ((!\datain[3]~input_o\) # (!\datain[0]~input_o\))) # (\datain[1]~input_o\ & (!\datain[3]~input_o\ & !\datain[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010100000111110101010000010100000000001011010000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[1]~input_o\,
	datac => \ALT_INV_datain[3]~input_o\,
	datad => \ALT_INV_datain[0]~input_o\,
	dataf => \ALT_INV_datain[2]~input_o\,
	combout => \PC4_0|count[1]~0_combout\);

-- Location: MLABCELL_X87_Y20_N18
\FA4_0|fa1|fa1bit_1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa1|fa1bit_1|sum~0_combout\ = ( \PC4_2|count\(0) & ( \PC4_0|count[1]~0_combout\ & ( !\PC4_1|count[1]~0_combout\ $ (((!\PC4_0|count\(0) & (\PC4_1|count\(0) & !\PC4_3|count\(0))) # (\PC4_0|count\(0) & ((!\PC4_3|count\(0)) # (\PC4_1|count\(0)))))) ) ) 
-- ) # ( !\PC4_2|count\(0) & ( \PC4_0|count[1]~0_combout\ & ( !\PC4_1|count[1]~0_combout\ $ (((!\PC4_0|count\(0) & (\PC4_1|count\(0) & \PC4_3|count\(0))) # (\PC4_0|count\(0) & ((\PC4_3|count\(0)) # (\PC4_1|count\(0)))))) ) ) ) # ( \PC4_2|count\(0) & ( 
-- !\PC4_0|count[1]~0_combout\ & ( !\PC4_1|count[1]~0_combout\ $ (((!\PC4_0|count\(0) & ((!\PC4_1|count\(0)) # (\PC4_3|count\(0)))) # (\PC4_0|count\(0) & (!\PC4_1|count\(0) & \PC4_3|count\(0))))) ) ) ) # ( !\PC4_2|count\(0) & ( !\PC4_0|count[1]~0_combout\ & 
-- ( !\PC4_1|count[1]~0_combout\ $ (((!\PC4_0|count\(0) & ((!\PC4_1|count\(0)) # (!\PC4_3|count\(0)))) # (\PC4_0|count\(0) & (!\PC4_1|count\(0) & !\PC4_3|count\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001101010011010100101011010101001100101011001010110101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_1|ALT_INV_count[1]~0_combout\,
	datab => \PC4_0|ALT_INV_count\(0),
	datac => \PC4_1|ALT_INV_count\(0),
	datad => \PC4_3|ALT_INV_count\(0),
	datae => \PC4_2|ALT_INV_count\(0),
	dataf => \PC4_0|ALT_INV_count[1]~0_combout\,
	combout => \FA4_0|fa1|fa1bit_1|sum~0_combout\);

-- Location: LABCELL_X88_Y22_N3
\PC4_6|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_6|count[1]~0_combout\ = ( \datain[27]~input_o\ & ( (!\datain[25]~input_o\ & (!\datain[24]~input_o\ & !\datain[26]~input_o\)) # (\datain[25]~input_o\ & (\datain[24]~input_o\ & \datain[26]~input_o\)) ) ) # ( !\datain[27]~input_o\ & ( 
-- (!\datain[25]~input_o\ & ((!\datain[24]~input_o\) # (!\datain[26]~input_o\))) # (\datain[25]~input_o\ & (!\datain[24]~input_o\ & !\datain[26]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111010001000111011101000100010001000000100011000100000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[25]~input_o\,
	datab => \ALT_INV_datain[24]~input_o\,
	datad => \ALT_INV_datain[26]~input_o\,
	dataf => \ALT_INV_datain[27]~input_o\,
	combout => \PC4_6|count[1]~0_combout\);

-- Location: LABCELL_X88_Y19_N12
\PC4_7|count[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_7|count[1]~0_combout\ = ( \datain[31]~input_o\ & ( \datain[29]~input_o\ & ( (\datain[28]~input_o\ & \datain[30]~input_o\) ) ) ) # ( !\datain[31]~input_o\ & ( \datain[29]~input_o\ & ( (!\datain[28]~input_o\ & !\datain[30]~input_o\) ) ) ) # ( 
-- \datain[31]~input_o\ & ( !\datain[29]~input_o\ & ( (!\datain[28]~input_o\ & !\datain[30]~input_o\) ) ) ) # ( !\datain[31]~input_o\ & ( !\datain[29]~input_o\ & ( (!\datain[28]~input_o\) # (!\datain[30]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010101000001010000010100000101000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[28]~input_o\,
	datac => \ALT_INV_datain[30]~input_o\,
	datae => \ALT_INV_datain[31]~input_o\,
	dataf => \ALT_INV_datain[29]~input_o\,
	combout => \PC4_7|count[1]~0_combout\);

-- Location: LABCELL_X88_Y20_N45
\FA3_3|fa2bit|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_3|fa2bit|fa1bit_0|sum~combout\ = ( \PC4_7|count[1]~0_combout\ & ( !\PC4_6|count[1]~0_combout\ $ (((\PC4_6|count\(0) & \PC4_7|count\(0)))) ) ) # ( !\PC4_7|count[1]~0_combout\ & ( !\PC4_6|count[1]~0_combout\ $ (((!\PC4_6|count\(0)) # 
-- (!\PC4_7|count\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111010000001011111101011111010000001011111101000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_6|ALT_INV_count\(0),
	datac => \PC4_7|ALT_INV_count\(0),
	datad => \PC4_6|ALT_INV_count[1]~0_combout\,
	dataf => \PC4_7|ALT_INV_count[1]~0_combout\,
	combout => \FA3_3|fa2bit|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y20_N18
\FA5|fa1|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa1|fa1bit_1|sum~combout\ = ( \FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( \FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_1|fa1|fa1bit_1|sum~0_combout\ $ (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\ $ 
-- (\FA3_3|fa2bit|fa1bit_0|sum~combout\))) ) ) ) # ( !\FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( \FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_1|fa1|fa1bit_1|sum~0_combout\ $ (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\ $ 
-- (!\FA3_3|fa2bit|fa1bit_0|sum~combout\))) ) ) ) # ( \FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_1|fa1|fa1bit_1|sum~0_combout\ $ (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\ $ 
-- (!\FA3_3|fa2bit|fa1bit_0|sum~combout\))) ) ) ) # ( !\FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_1|fa1|fa1bit_1|sum~0_combout\ $ (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\ $ 
-- (!\FA3_3|fa2bit|fa1bit_0|sum~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110011010011001011001101001100101101001011001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA4_1|fa1|fa1bit_1|ALT_INV_sum~0_combout\,
	datab => \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datac => \FA4_0|fa1|fa1bit_1|ALT_INV_sum~0_combout\,
	datad => \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datae => \FA4_1|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	dataf => \FA4_0|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	combout => \FA5|fa1|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y20_N36
\FA5|fa1|fa1bit_1|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa1|fa1bit_1|cout~combout\ = ( \FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( \FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( (!\FA4_1|fa1|fa1bit_1|sum~0_combout\ & ((!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)) # 
-- (\FA3_3|fa2bit|fa1bit_0|sum~combout\))) # (\FA4_1|fa1|fa1bit_1|sum~0_combout\ & ((!\FA3_3|fa2bit|fa1bit_0|sum~combout\) # (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) ) ) ) # ( !\FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( 
-- \FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( (!\FA4_1|fa1|fa1bit_1|sum~0_combout\ & (\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) # (\FA4_1|fa1|fa1bit_1|sum~0_combout\ & 
-- (!\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) ) ) ) # ( \FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( (!\FA4_1|fa1|fa1bit_1|sum~0_combout\ & 
-- (\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) # (\FA4_1|fa1|fa1bit_1|sum~0_combout\ & (!\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ 
-- (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) ) ) ) # ( !\FA4_1|fa1|fa1bit_0|sum~0_combout\ & ( !\FA4_0|fa1|fa1bit_0|sum~0_combout\ & ( (!\FA4_1|fa1|fa1bit_1|sum~0_combout\ & (\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ 
-- (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) # (\FA4_1|fa1|fa1bit_1|sum~0_combout\ & (!\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_1|fa2bit|fa1bit_0|sum~combout\ $ (!\FA4_0|fa1|fa1bit_1|sum~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000101000000101000010100000010100001010000111110110111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA4_1|fa1|fa1bit_1|ALT_INV_sum~0_combout\,
	datab => \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datac => \FA4_0|fa1|fa1bit_1|ALT_INV_sum~0_combout\,
	datad => \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datae => \FA4_1|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	dataf => \FA4_0|fa1|fa1bit_0|ALT_INV_sum~0_combout\,
	combout => \FA5|fa1|fa1bit_1|cout~combout\);

-- Location: LABCELL_X88_Y19_N21
\PC4_5|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_5|count\(2) = ( \datain[23]~input_o\ & ( \datain[22]~input_o\ & ( (\datain[21]~input_o\ & \datain[20]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[21]~input_o\,
	datac => \ALT_INV_datain[20]~input_o\,
	datae => \ALT_INV_datain[23]~input_o\,
	dataf => \ALT_INV_datain[22]~input_o\,
	combout => \PC4_5|count\(2));

-- Location: LABCELL_X88_Y22_N6
\PC4_4|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_4|count\(2) = ( \datain[18]~input_o\ & ( (\datain[16]~input_o\ & (\datain[17]~input_o\ & \datain[19]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_datain[16]~input_o\,
	datac => \ALT_INV_datain[17]~input_o\,
	datad => \ALT_INV_datain[19]~input_o\,
	dataf => \ALT_INV_datain[18]~input_o\,
	combout => \PC4_4|count\(2));

-- Location: LABCELL_X88_Y22_N54
\FA3_2|fa2bit|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_2|fa2bit|fa1bit_1|sum~combout\ = ( \PC4_5|count\(0) & ( \PC4_4|count\(2) & ( !\PC4_5|count\(2) $ (((!\PC4_5|count[1]~0_combout\ & ((!\PC4_4|count[1]~0_combout\) # (\PC4_4|count\(0)))) # (\PC4_5|count[1]~0_combout\ & (!\PC4_4|count[1]~0_combout\ & 
-- \PC4_4|count\(0))))) ) ) ) # ( !\PC4_5|count\(0) & ( \PC4_4|count\(2) & ( !\PC4_5|count\(2) $ (((!\PC4_5|count[1]~0_combout\ & !\PC4_4|count[1]~0_combout\))) ) ) ) # ( \PC4_5|count\(0) & ( !\PC4_4|count\(2) & ( !\PC4_5|count\(2) $ 
-- (((!\PC4_5|count[1]~0_combout\ & (\PC4_4|count[1]~0_combout\ & !\PC4_4|count\(0))) # (\PC4_5|count[1]~0_combout\ & ((!\PC4_4|count\(0)) # (\PC4_4|count[1]~0_combout\))))) ) ) ) # ( !\PC4_5|count\(0) & ( !\PC4_4|count\(2) & ( !\PC4_5|count\(2) $ 
-- (((\PC4_4|count[1]~0_combout\) # (\PC4_5|count[1]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000011110000111100001111110000101111000011110000111100000011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_5|ALT_INV_count[1]~0_combout\,
	datab => \PC4_4|ALT_INV_count[1]~0_combout\,
	datac => \PC4_5|ALT_INV_count\(2),
	datad => \PC4_4|ALT_INV_count\(0),
	datae => \PC4_5|ALT_INV_count\(0),
	dataf => \PC4_4|ALT_INV_count\(2),
	combout => \FA3_2|fa2bit|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y22_N51
\FA3_2|fa2bit|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_2|fa2bit|fa1bit_0|sum~combout\ = ( \PC4_5|count[1]~0_combout\ & ( !\PC4_4|count[1]~0_combout\ $ (((\PC4_5|count\(0) & \PC4_4|count\(0)))) ) ) # ( !\PC4_5|count[1]~0_combout\ & ( !\PC4_4|count[1]~0_combout\ $ (((!\PC4_5|count\(0)) # 
-- (!\PC4_4|count\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000011110000111100001111011100001111000011110000111100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_5|ALT_INV_count\(0),
	datab => \PC4_4|ALT_INV_count\(0),
	datac => \PC4_4|ALT_INV_count[1]~0_combout\,
	dataf => \PC4_5|ALT_INV_count[1]~0_combout\,
	combout => \FA3_2|fa2bit|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y19_N24
\PC4_7|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_7|count\(2) = ( \datain[31]~input_o\ & ( \datain[29]~input_o\ & ( (\datain[28]~input_o\ & \datain[30]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[28]~input_o\,
	datac => \ALT_INV_datain[30]~input_o\,
	datae => \ALT_INV_datain[31]~input_o\,
	dataf => \ALT_INV_datain[29]~input_o\,
	combout => \PC4_7|count\(2));

-- Location: LABCELL_X88_Y22_N0
\PC4_6|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_6|count\(2) = ( \datain[27]~input_o\ & ( (\datain[25]~input_o\ & (\datain[24]~input_o\ & \datain[26]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[25]~input_o\,
	datab => \ALT_INV_datain[24]~input_o\,
	datac => \ALT_INV_datain[26]~input_o\,
	dataf => \ALT_INV_datain[27]~input_o\,
	combout => \PC4_6|count\(2));

-- Location: LABCELL_X88_Y20_N54
\FA3_3|fa2bit|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_3|fa2bit|fa1bit_1|sum~combout\ = ( \PC4_6|count\(0) & ( \PC4_7|count[1]~0_combout\ & ( !\PC4_7|count\(2) $ (!\PC4_6|count\(2) $ (((!\PC4_6|count[1]~0_combout\ & \PC4_7|count\(0))))) ) ) ) # ( !\PC4_6|count\(0) & ( \PC4_7|count[1]~0_combout\ & ( 
-- !\PC4_7|count\(2) $ (!\PC4_6|count\(2)) ) ) ) # ( \PC4_6|count\(0) & ( !\PC4_7|count[1]~0_combout\ & ( !\PC4_7|count\(2) $ (!\PC4_6|count\(2) $ (((!\PC4_6|count[1]~0_combout\) # (\PC4_7|count\(0))))) ) ) ) # ( !\PC4_6|count\(0) & ( 
-- !\PC4_7|count[1]~0_combout\ & ( !\PC4_6|count[1]~0_combout\ $ (!\PC4_7|count\(2) $ (!\PC4_6|count\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100101100110100111000110001100110011110011000011100111000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_6|ALT_INV_count[1]~0_combout\,
	datab => \PC4_7|ALT_INV_count\(2),
	datac => \PC4_7|ALT_INV_count\(0),
	datad => \PC4_6|ALT_INV_count\(2),
	datae => \PC4_6|ALT_INV_count\(0),
	dataf => \PC4_7|ALT_INV_count[1]~0_combout\,
	combout => \FA3_3|fa2bit|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y22_N48
\FA4_1|fa1|fa1bit_0|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa1|fa1bit_0|cout~0_combout\ = ( \PC4_6|count\(0) & ( (!\PC4_7|count\(0) & (!\PC4_5|count\(0) $ (!\PC4_4|count\(0)))) ) ) # ( !\PC4_6|count\(0) & ( (\PC4_7|count\(0) & (!\PC4_5|count\(0) $ (!\PC4_4|count\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000001100000011001100000011000000110000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_5|ALT_INV_count\(0),
	datab => \PC4_4|ALT_INV_count\(0),
	datac => \PC4_7|ALT_INV_count\(0),
	dataf => \PC4_6|ALT_INV_count\(0),
	combout => \FA4_1|fa1|fa1bit_0|cout~0_combout\);

-- Location: LABCELL_X88_Y20_N0
\FA4_1|fa2|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa2|fa1bit_0|sum~combout\ = ( \FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA3_2|fa2bit|fa1bit_1|sum~combout\ $ (!\FA3_3|fa2bit|fa1bit_1|sum~combout\ $ (((\FA3_2|fa2bit|fa1bit_0|sum~combout\) # (\FA3_3|fa2bit|fa1bit_0|sum~combout\)))) ) ) # ( 
-- !\FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA3_2|fa2bit|fa1bit_1|sum~combout\ $ (!\FA3_3|fa2bit|fa1bit_1|sum~combout\ $ (((\FA3_3|fa2bit|fa1bit_0|sum~combout\ & \FA3_2|fa2bit|fa1bit_0|sum~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011010101001010101101010100101101010100101010110101010010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_2|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datab => \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datac => \FA3_2|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datad => \FA3_3|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	dataf => \FA4_1|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	combout => \FA4_1|fa2|fa1bit_0|sum~combout\);

-- Location: MLABCELL_X87_Y20_N54
\PC4_0|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_0|count\(2) = ( \datain[2]~input_o\ & ( (\datain[0]~input_o\ & (\datain[1]~input_o\ & \datain[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_datain[0]~input_o\,
	datac => \ALT_INV_datain[1]~input_o\,
	datad => \ALT_INV_datain[3]~input_o\,
	dataf => \ALT_INV_datain[2]~input_o\,
	combout => \PC4_0|count\(2));

-- Location: LABCELL_X88_Y20_N6
\PC4_1|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_1|count\(2) = (\datain[7]~input_o\ & (\datain[5]~input_o\ & (\datain[4]~input_o\ & \datain[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[7]~input_o\,
	datab => \ALT_INV_datain[5]~input_o\,
	datac => \ALT_INV_datain[4]~input_o\,
	datad => \ALT_INV_datain[6]~input_o\,
	combout => \PC4_1|count\(2));

-- Location: MLABCELL_X87_Y20_N0
\FA3_0|fa2bit|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_0|fa2bit|fa1bit_1|sum~combout\ = ( \PC4_1|count\(2) & ( \PC4_1|count\(0) & ( !\PC4_0|count\(2) $ (((!\PC4_1|count[1]~0_combout\ & ((!\PC4_0|count[1]~0_combout\) # (\PC4_0|count\(0)))) # (\PC4_1|count[1]~0_combout\ & (\PC4_0|count\(0) & 
-- !\PC4_0|count[1]~0_combout\)))) ) ) ) # ( !\PC4_1|count\(2) & ( \PC4_1|count\(0) & ( !\PC4_0|count\(2) $ (((!\PC4_1|count[1]~0_combout\ & (!\PC4_0|count\(0) & \PC4_0|count[1]~0_combout\)) # (\PC4_1|count[1]~0_combout\ & ((!\PC4_0|count\(0)) # 
-- (\PC4_0|count[1]~0_combout\))))) ) ) ) # ( \PC4_1|count\(2) & ( !\PC4_1|count\(0) & ( !\PC4_0|count\(2) $ (((!\PC4_1|count[1]~0_combout\ & !\PC4_0|count[1]~0_combout\))) ) ) ) # ( !\PC4_1|count\(2) & ( !\PC4_1|count\(0) & ( !\PC4_0|count\(2) $ 
-- (((\PC4_0|count[1]~0_combout\) # (\PC4_1|count[1]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000001011111010111111010000010110010010011010100110110110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_1|ALT_INV_count[1]~0_combout\,
	datab => \PC4_0|ALT_INV_count\(0),
	datac => \PC4_0|ALT_INV_count[1]~0_combout\,
	datad => \PC4_0|ALT_INV_count\(2),
	datae => \PC4_1|ALT_INV_count\(2),
	dataf => \PC4_1|ALT_INV_count\(0),
	combout => \FA3_0|fa2bit|fa1bit_1|sum~combout\);

-- Location: MLABCELL_X87_Y20_N6
\FA4_0|fa1|fa1bit_0|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa1|fa1bit_0|cout~0_combout\ = ( \PC4_1|count\(0) & ( (!\PC4_0|count\(0) & (!\PC4_3|count\(0) $ (!\PC4_2|count\(0)))) ) ) # ( !\PC4_1|count\(0) & ( (\PC4_0|count\(0) & (!\PC4_3|count\(0) $ (!\PC4_2|count\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110000000000110011000000001100110000000000110011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \PC4_0|ALT_INV_count\(0),
	datac => \PC4_3|ALT_INV_count\(0),
	datad => \PC4_2|ALT_INV_count\(0),
	dataf => \PC4_1|ALT_INV_count\(0),
	combout => \FA4_0|fa1|fa1bit_0|cout~0_combout\);

-- Location: MLABCELL_X87_Y20_N57
\FA3_0|fa2bit|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_0|fa2bit|fa1bit_0|sum~combout\ = ( \PC4_1|count\(0) & ( !\PC4_0|count[1]~0_combout\ $ (!\PC4_0|count\(0) $ (\PC4_1|count[1]~0_combout\)) ) ) # ( !\PC4_1|count\(0) & ( !\PC4_0|count[1]~0_combout\ $ (!\PC4_1|count[1]~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101001011010101001010101101010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_0|ALT_INV_count[1]~0_combout\,
	datac => \PC4_0|ALT_INV_count\(0),
	datad => \PC4_1|ALT_INV_count[1]~0_combout\,
	dataf => \PC4_1|ALT_INV_count\(0),
	combout => \FA3_0|fa2bit|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y22_N30
\PC4_2|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_2|count\(2) = ( \datain[8]~input_o\ & ( (\datain[11]~input_o\ & (\datain[10]~input_o\ & \datain[9]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_datain[11]~input_o\,
	datab => \ALT_INV_datain[10]~input_o\,
	datac => \ALT_INV_datain[9]~input_o\,
	dataf => \ALT_INV_datain[8]~input_o\,
	combout => \PC4_2|count\(2));

-- Location: LABCELL_X88_Y22_N24
\PC4_3|count[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \PC4_3|count\(2) = ( \datain[12]~input_o\ & ( (\datain[15]~input_o\ & (\datain[13]~input_o\ & \datain[14]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_datain[15]~input_o\,
	datac => \ALT_INV_datain[13]~input_o\,
	datad => \ALT_INV_datain[14]~input_o\,
	dataf => \ALT_INV_datain[12]~input_o\,
	combout => \PC4_3|count\(2));

-- Location: MLABCELL_X87_Y20_N36
\FA3_1|fa2bit|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA3_1|fa2bit|fa1bit_1|sum~combout\ = ( \PC4_2|count\(0) & ( \PC4_3|count\(0) & ( !\PC4_2|count\(2) $ (!\PC4_3|count\(2) $ (((!\PC4_2|count[1]~0_combout\) # (!\PC4_3|count[1]~0_combout\)))) ) ) ) # ( !\PC4_2|count\(0) & ( \PC4_3|count\(0) & ( 
-- !\PC4_2|count\(2) $ (!\PC4_3|count\(2) $ (((!\PC4_2|count[1]~0_combout\ & !\PC4_3|count[1]~0_combout\)))) ) ) ) # ( \PC4_2|count\(0) & ( !\PC4_3|count\(0) & ( !\PC4_2|count\(2) $ (!\PC4_3|count\(2) $ (((!\PC4_2|count[1]~0_combout\ & 
-- !\PC4_3|count[1]~0_combout\)))) ) ) ) # ( !\PC4_2|count\(0) & ( !\PC4_3|count\(0) & ( !\PC4_2|count\(2) $ (!\PC4_3|count\(2) $ (((!\PC4_2|count[1]~0_combout\ & !\PC4_3|count[1]~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011000111100100101100011110010010110001111001100001110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_2|ALT_INV_count[1]~0_combout\,
	datab => \PC4_2|ALT_INV_count\(2),
	datac => \PC4_3|ALT_INV_count\(2),
	datad => \PC4_3|ALT_INV_count[1]~0_combout\,
	datae => \PC4_2|ALT_INV_count\(0),
	dataf => \PC4_3|ALT_INV_count\(0),
	combout => \FA3_1|fa2bit|fa1bit_1|sum~combout\);

-- Location: MLABCELL_X87_Y20_N15
\FA4_0|fa2|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa2|fa1bit_0|sum~combout\ = ( \FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( !\FA3_0|fa2bit|fa1bit_1|sum~combout\ $ (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ $ (((\FA3_0|fa2bit|fa1bit_0|sum~combout\) # (\FA4_0|fa1|fa1bit_0|cout~0_combout\)))) ) ) # ( 
-- !\FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( !\FA3_0|fa2bit|fa1bit_1|sum~combout\ $ (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ $ (((\FA4_0|fa1|fa1bit_0|cout~0_combout\ & \FA3_0|fa2bit|fa1bit_0|sum~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011010101001010101101010100101101010100101010110101010010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_0|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datab => \FA4_0|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	datac => \FA3_0|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datad => \FA3_1|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	dataf => \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	combout => \FA4_0|fa2|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y20_N12
\FA5|fa2|fa1bit|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa2|fa1bit|sum~combout\ = ( \FA4_0|fa2|fa1bit_0|sum~combout\ & ( !\FA5|fa1|fa1bit_1|cout~combout\ $ (\FA4_1|fa2|fa1bit_0|sum~combout\) ) ) # ( !\FA4_0|fa2|fa1bit_0|sum~combout\ & ( !\FA5|fa1|fa1bit_1|cout~combout\ $ 
-- (!\FA4_1|fa2|fa1bit_0|sum~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000011110000000011111111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \FA5|fa1|fa1bit_1|ALT_INV_cout~combout\,
	datad => \FA4_1|fa2|fa1bit_0|ALT_INV_sum~combout\,
	dataf => \FA4_0|fa2|fa1bit_0|ALT_INV_sum~combout\,
	combout => \FA5|fa2|fa1bit|sum~combout\);

-- Location: MLABCELL_X87_Y20_N45
\FA4_0|fa2|fa1bit_1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa2|fa1bit_1|sum~0_combout\ = ( \PC4_2|count\(2) & ( !\PC4_3|count\(2) $ (((!\PC4_0|count\(2)) # (!\PC4_1|count\(2)))) ) ) # ( !\PC4_2|count\(2) & ( (\PC4_0|count\(2) & \PC4_1|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100001111010110100000111101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_0|ALT_INV_count\(2),
	datac => \PC4_3|ALT_INV_count\(2),
	datad => \PC4_1|ALT_INV_count\(2),
	dataf => \PC4_2|ALT_INV_count\(2),
	combout => \FA4_0|fa2|fa1bit_1|sum~0_combout\);

-- Location: MLABCELL_X87_Y20_N48
\FA4_0|fa2|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa2|fa1bit_1|sum~combout\ = ( \FA4_0|fa2|fa1bit_1|sum~0_combout\ & ( \FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ & ((!\FA3_0|fa2bit|fa1bit_1|sum~combout\) # ((!\FA4_0|fa1|fa1bit_0|cout~0_combout\ & 
-- !\FA3_0|fa2bit|fa1bit_0|sum~combout\)))) # (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & (!\FA4_0|fa1|fa1bit_0|cout~0_combout\ & (!\FA3_0|fa2bit|fa1bit_1|sum~combout\ & !\FA3_0|fa2bit|fa1bit_0|sum~combout\))) ) ) ) # ( !\FA4_0|fa2|fa1bit_1|sum~0_combout\ & ( 
-- \FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ & (\FA3_0|fa2bit|fa1bit_1|sum~combout\ & ((\FA3_0|fa2bit|fa1bit_0|sum~combout\) # (\FA4_0|fa1|fa1bit_0|cout~0_combout\)))) # (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & 
-- (((\FA3_0|fa2bit|fa1bit_0|sum~combout\) # (\FA3_0|fa2bit|fa1bit_1|sum~combout\)) # (\FA4_0|fa1|fa1bit_0|cout~0_combout\))) ) ) ) # ( \FA4_0|fa2|fa1bit_1|sum~0_combout\ & ( !\FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ & 
-- ((!\FA4_0|fa1|fa1bit_0|cout~0_combout\) # ((!\FA3_0|fa2bit|fa1bit_1|sum~combout\) # (!\FA3_0|fa2bit|fa1bit_0|sum~combout\)))) # (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & (!\FA3_0|fa2bit|fa1bit_1|sum~combout\ & ((!\FA4_0|fa1|fa1bit_0|cout~0_combout\) # 
-- (!\FA3_0|fa2bit|fa1bit_0|sum~combout\)))) ) ) ) # ( !\FA4_0|fa2|fa1bit_1|sum~0_combout\ & ( !\FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_1|fa2bit|fa1bit_1|sum~combout\ & (\FA4_0|fa1|fa1bit_0|cout~0_combout\ & (\FA3_0|fa2bit|fa1bit_1|sum~combout\ & 
-- \FA3_0|fa2bit|fa1bit_0|sum~combout\))) # (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & (((\FA4_0|fa1|fa1bit_0|cout~0_combout\ & \FA3_0|fa2bit|fa1bit_0|sum~combout\)) # (\FA3_0|fa2bit|fa1bit_1|sum~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100010111111110101110100000010111010111111110100010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_1|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datab => \FA4_0|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	datac => \FA3_0|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datad => \FA3_0|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datae => \FA4_0|fa2|fa1bit_1|ALT_INV_sum~0_combout\,
	dataf => \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	combout => \FA4_0|fa2|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y20_N42
\FA4_1|fa2|fa1bit_1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa2|fa1bit_1|sum~0_combout\ = ( \PC4_7|count\(2) & ( !\PC4_6|count\(2) $ (((!\PC4_4|count\(2)) # (!\PC4_5|count\(2)))) ) ) # ( !\PC4_7|count\(2) & ( (\PC4_4|count\(2) & \PC4_5|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100110011001111000011001100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \PC4_6|ALT_INV_count\(2),
	datac => \PC4_4|ALT_INV_count\(2),
	datad => \PC4_5|ALT_INV_count\(2),
	dataf => \PC4_7|ALT_INV_count\(2),
	combout => \FA4_1|fa2|fa1bit_1|sum~0_combout\);

-- Location: LABCELL_X88_Y20_N48
\FA4_1|fa2|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa2|fa1bit_1|sum~combout\ = ( \FA3_3|fa2bit|fa1bit_1|sum~combout\ & ( \FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA4_1|fa2|fa1bit_1|sum~0_combout\ $ (((!\FA3_2|fa2bit|fa1bit_0|sum~combout\ & (!\FA3_3|fa2bit|fa1bit_0|sum~combout\ & 
-- !\FA3_2|fa2bit|fa1bit_1|sum~combout\)))) ) ) ) # ( !\FA3_3|fa2bit|fa1bit_1|sum~combout\ & ( \FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA4_1|fa2|fa1bit_1|sum~0_combout\ $ (((!\FA3_2|fa2bit|fa1bit_1|sum~combout\) # ((!\FA3_2|fa2bit|fa1bit_0|sum~combout\ & 
-- !\FA3_3|fa2bit|fa1bit_0|sum~combout\)))) ) ) ) # ( \FA3_3|fa2bit|fa1bit_1|sum~combout\ & ( !\FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA4_1|fa2|fa1bit_1|sum~0_combout\ $ (((!\FA3_2|fa2bit|fa1bit_1|sum~combout\ & ((!\FA3_2|fa2bit|fa1bit_0|sum~combout\) # 
-- (!\FA3_3|fa2bit|fa1bit_0|sum~combout\))))) ) ) ) # ( !\FA3_3|fa2bit|fa1bit_1|sum~combout\ & ( !\FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( !\FA4_1|fa2|fa1bit_1|sum~0_combout\ $ (((!\FA3_2|fa2bit|fa1bit_0|sum~combout\) # ((!\FA3_3|fa2bit|fa1bit_0|sum~combout\) 
-- # (!\FA3_2|fa2bit|fa1bit_1|sum~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000111111110000000000111111110000111111110000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_2|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datab => \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datac => \FA3_2|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datad => \FA4_1|fa2|fa1bit_1|ALT_INV_sum~0_combout\,
	datae => \FA3_3|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	dataf => \FA4_1|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	combout => \FA4_1|fa2|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y20_N27
\FA5|fa2|fa2bit|fa1bit_0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa2|fa2bit|fa1bit_0|sum~combout\ = ( \FA4_1|fa2|fa1bit_1|sum~combout\ & ( !\FA4_0|fa2|fa1bit_1|sum~combout\ $ (((!\FA5|fa1|fa1bit_1|cout~combout\ & (\FA4_0|fa2|fa1bit_0|sum~combout\ & \FA4_1|fa2|fa1bit_0|sum~combout\)) # 
-- (\FA5|fa1|fa1bit_1|cout~combout\ & ((\FA4_1|fa2|fa1bit_0|sum~combout\) # (\FA4_0|fa2|fa1bit_0|sum~combout\))))) ) ) # ( !\FA4_1|fa2|fa1bit_1|sum~combout\ & ( !\FA4_0|fa2|fa1bit_1|sum~combout\ $ (((!\FA5|fa1|fa1bit_1|cout~combout\ & 
-- ((!\FA4_0|fa2|fa1bit_0|sum~combout\) # (!\FA4_1|fa2|fa1bit_0|sum~combout\))) # (\FA5|fa1|fa1bit_1|cout~combout\ & (!\FA4_0|fa2|fa1bit_0|sum~combout\ & !\FA4_1|fa2|fa1bit_0|sum~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011001101100001101100110110011001001100100111100100110010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA5|fa1|fa1bit_1|ALT_INV_cout~combout\,
	datab => \FA4_0|fa2|fa1bit_1|ALT_INV_sum~combout\,
	datac => \FA4_0|fa2|fa1bit_0|ALT_INV_sum~combout\,
	datad => \FA4_1|fa2|fa1bit_0|ALT_INV_sum~combout\,
	dataf => \FA4_1|fa2|fa1bit_1|ALT_INV_sum~combout\,
	combout => \FA5|fa2|fa2bit|fa1bit_0|sum~combout\);

-- Location: LABCELL_X88_Y20_N3
\FA4_1|fa2|fa1bit_0|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa2|fa1bit_0|cout~0_combout\ = ( \FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( (!\FA3_2|fa2bit|fa1bit_1|sum~combout\ & (\FA3_3|fa2bit|fa1bit_1|sum~combout\ & ((\FA3_2|fa2bit|fa1bit_0|sum~combout\) # (\FA3_3|fa2bit|fa1bit_0|sum~combout\)))) # 
-- (\FA3_2|fa2bit|fa1bit_1|sum~combout\ & (((\FA3_2|fa2bit|fa1bit_0|sum~combout\) # (\FA3_3|fa2bit|fa1bit_1|sum~combout\)) # (\FA3_3|fa2bit|fa1bit_0|sum~combout\))) ) ) # ( !\FA4_1|fa1|fa1bit_0|cout~0_combout\ & ( (!\FA3_2|fa2bit|fa1bit_1|sum~combout\ & 
-- (\FA3_3|fa2bit|fa1bit_0|sum~combout\ & (\FA3_3|fa2bit|fa1bit_1|sum~combout\ & \FA3_2|fa2bit|fa1bit_0|sum~combout\))) # (\FA3_2|fa2bit|fa1bit_1|sum~combout\ & (((\FA3_3|fa2bit|fa1bit_0|sum~combout\ & \FA3_2|fa2bit|fa1bit_0|sum~combout\)) # 
-- (\FA3_3|fa2bit|fa1bit_1|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100010111000001010001011100010111010111110001011101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_2|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datab => \FA3_3|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	datac => \FA3_3|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datad => \FA3_2|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	dataf => \FA4_1|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	combout => \FA4_1|fa2|fa1bit_0|cout~0_combout\);

-- Location: LABCELL_X88_Y20_N15
\FA4_1|fa2|fa1bit_1|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_1|fa2|fa1bit_1|cout~0_combout\ = ( \PC4_7|count\(2) & ( (!\PC4_6|count\(2) & (\PC4_4|count\(2) & (\PC4_5|count\(2) & \FA4_1|fa2|fa1bit_0|cout~0_combout\))) # (\PC4_6|count\(2) & (((\PC4_4|count\(2) & \PC4_5|count\(2))) # 
-- (\FA4_1|fa2|fa1bit_0|cout~0_combout\))) ) ) # ( !\PC4_7|count\(2) & ( (\PC4_4|count\(2) & (\PC4_5|count\(2) & \FA4_1|fa2|fa1bit_0|cout~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100000001000111110000000100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_4|ALT_INV_count\(2),
	datab => \PC4_5|ALT_INV_count\(2),
	datac => \PC4_6|ALT_INV_count\(2),
	datad => \FA4_1|fa2|fa1bit_0|ALT_INV_cout~0_combout\,
	dataf => \PC4_7|ALT_INV_count\(2),
	combout => \FA4_1|fa2|fa1bit_1|cout~0_combout\);

-- Location: MLABCELL_X87_Y20_N12
\FA4_0|fa2|fa1bit_0|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa2|fa1bit_0|cout~0_combout\ = ( \FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_0|fa2bit|fa1bit_1|sum~combout\ & (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & ((\FA3_0|fa2bit|fa1bit_0|sum~combout\) # (\FA4_0|fa1|fa1bit_0|cout~0_combout\)))) # 
-- (\FA3_0|fa2bit|fa1bit_1|sum~combout\ & (((\FA3_0|fa2bit|fa1bit_0|sum~combout\) # (\FA3_1|fa2bit|fa1bit_1|sum~combout\)) # (\FA4_0|fa1|fa1bit_0|cout~0_combout\))) ) ) # ( !\FA3_1|fa2bit|fa1bit_0|sum~combout\ & ( (!\FA3_0|fa2bit|fa1bit_1|sum~combout\ & 
-- (\FA4_0|fa1|fa1bit_0|cout~0_combout\ & (\FA3_1|fa2bit|fa1bit_1|sum~combout\ & \FA3_0|fa2bit|fa1bit_0|sum~combout\))) # (\FA3_0|fa2bit|fa1bit_1|sum~combout\ & (((\FA4_0|fa1|fa1bit_0|cout~0_combout\ & \FA3_0|fa2bit|fa1bit_0|sum~combout\)) # 
-- (\FA3_1|fa2bit|fa1bit_1|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100010111000001010001011100010111010111110001011101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA3_0|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datab => \FA4_0|fa1|fa1bit_0|ALT_INV_cout~0_combout\,
	datac => \FA3_1|fa2bit|fa1bit_1|ALT_INV_sum~combout\,
	datad => \FA3_0|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	dataf => \FA3_1|fa2bit|fa1bit_0|ALT_INV_sum~combout\,
	combout => \FA4_0|fa2|fa1bit_0|cout~0_combout\);

-- Location: MLABCELL_X87_Y20_N24
\FA4_0|fa2|fa1bit_1|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA4_0|fa2|fa1bit_1|cout~0_combout\ = ( \PC4_0|count\(2) & ( (!\FA4_0|fa2|fa1bit_0|cout~0_combout\ & (\PC4_3|count\(2) & (\PC4_1|count\(2) & \PC4_2|count\(2)))) # (\FA4_0|fa2|fa1bit_0|cout~0_combout\ & (((\PC4_3|count\(2) & \PC4_2|count\(2))) # 
-- (\PC4_1|count\(2)))) ) ) # ( !\PC4_0|count\(2) & ( (\PC4_3|count\(2) & (\FA4_0|fa2|fa1bit_0|cout~0_combout\ & \PC4_2|count\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000110001011100000000000100010000001100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC4_3|ALT_INV_count\(2),
	datab => \FA4_0|fa2|fa1bit_0|ALT_INV_cout~0_combout\,
	datac => \PC4_1|ALT_INV_count\(2),
	datad => \PC4_2|ALT_INV_count\(2),
	datae => \PC4_0|ALT_INV_count\(2),
	combout => \FA4_0|fa2|fa1bit_1|cout~0_combout\);

-- Location: LABCELL_X88_Y20_N24
\FA5|fa2|fa2bit|fa1bit_0|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ = ( \FA4_1|fa2|fa1bit_1|sum~combout\ & ( ((!\FA5|fa1|fa1bit_1|cout~combout\ & (\FA4_1|fa2|fa1bit_0|sum~combout\ & \FA4_0|fa2|fa1bit_0|sum~combout\)) # (\FA5|fa1|fa1bit_1|cout~combout\ & 
-- ((\FA4_0|fa2|fa1bit_0|sum~combout\) # (\FA4_1|fa2|fa1bit_0|sum~combout\)))) # (\FA4_0|fa2|fa1bit_1|sum~combout\) ) ) # ( !\FA4_1|fa2|fa1bit_1|sum~combout\ & ( (\FA4_0|fa2|fa1bit_1|sum~combout\ & ((!\FA5|fa1|fa1bit_1|cout~combout\ & 
-- (\FA4_1|fa2|fa1bit_0|sum~combout\ & \FA4_0|fa2|fa1bit_0|sum~combout\)) # (\FA5|fa1|fa1bit_1|cout~combout\ & ((\FA4_0|fa2|fa1bit_0|sum~combout\) # (\FA4_1|fa2|fa1bit_0|sum~combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010011000000010001001100110111011111110011011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \FA5|fa1|fa1bit_1|ALT_INV_cout~combout\,
	datab => \FA4_0|fa2|fa1bit_1|ALT_INV_sum~combout\,
	datac => \FA4_1|fa2|fa1bit_0|ALT_INV_sum~combout\,
	datad => \FA4_0|fa2|fa1bit_0|ALT_INV_sum~combout\,
	dataf => \FA4_1|fa2|fa1bit_1|ALT_INV_sum~combout\,
	combout => \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\);

-- Location: LABCELL_X88_Y19_N0
\FA5|fa2|fa2bit|fa1bit_1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa2|fa2bit|fa1bit_1|sum~combout\ = ( \FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ & ( \FA4_1|fa2|fa1bit_1|cout~0_combout\ ) ) ) # ( !\FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ 
-- & ( !\FA4_1|fa2|fa1bit_1|cout~0_combout\ ) ) ) # ( \FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( !\FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ & ( !\FA4_1|fa2|fa1bit_1|cout~0_combout\ ) ) ) # ( !\FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( 
-- !\FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ & ( \FA4_1|fa2|fa1bit_1|cout~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110011001100110011000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA4_1|fa2|fa1bit_1|ALT_INV_cout~0_combout\,
	datae => \FA4_0|fa2|fa1bit_1|ALT_INV_cout~0_combout\,
	dataf => \FA5|fa2|fa2bit|fa1bit_0|ALT_INV_cout~0_combout\,
	combout => \FA5|fa2|fa2bit|fa1bit_1|sum~combout\);

-- Location: LABCELL_X88_Y19_N9
\FA5|fa2|fa2bit|fa1bit_1|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA5|fa2|fa2bit|fa1bit_1|cout~0_combout\ = ( \FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ ) ) # ( !\FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( \FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ & ( \FA4_1|fa2|fa1bit_1|cout~0_combout\ 
-- ) ) ) # ( \FA4_0|fa2|fa1bit_1|cout~0_combout\ & ( !\FA5|fa2|fa2bit|fa1bit_0|cout~0_combout\ & ( \FA4_1|fa2|fa1bit_1|cout~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \FA4_1|fa2|fa1bit_1|ALT_INV_cout~0_combout\,
	datae => \FA4_0|fa2|fa1bit_1|ALT_INV_cout~0_combout\,
	dataf => \FA5|fa2|fa2bit|fa1bit_0|ALT_INV_cout~0_combout\,
	combout => \FA5|fa2|fa2bit|fa1bit_1|cout~0_combout\);

-- Location: LABCELL_X19_Y80_N0
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


