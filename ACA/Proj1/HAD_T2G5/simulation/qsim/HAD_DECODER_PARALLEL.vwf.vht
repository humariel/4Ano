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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/17/2019 20:10:47"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          HAD_DECODER_PARALLEL
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY HAD_DECODER_PARALLEL_vhd_vec_tst IS
END HAD_DECODER_PARALLEL_vhd_vec_tst;
ARCHITECTURE HAD_DECODER_PARALLEL_arch OF HAD_DECODER_PARALLEL_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL m : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL valid : STD_LOGIC;
COMPONENT HAD_DECODER_PARALLEL
	PORT (
	code : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	m : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	valid : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : HAD_DECODER_PARALLEL
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	m => m,
	valid => valid
	);
-- code[7]
t_prcs_code_7: PROCESS
BEGIN
	code(7) <= '0';
	WAIT FOR 150000 ps;
	code(7) <= '1';
	WAIT FOR 450000 ps;
	code(7) <= '0';
WAIT;
END PROCESS t_prcs_code_7;
-- code[6]
t_prcs_code_6: PROCESS
BEGIN
	code(6) <= '1';
	WAIT FOR 300000 ps;
	code(6) <= '0';
	WAIT FOR 450000 ps;
	code(6) <= '1';
	WAIT FOR 150000 ps;
	code(6) <= '0';
WAIT;
END PROCESS t_prcs_code_6;
-- code[5]
t_prcs_code_5: PROCESS
BEGIN
	code(5) <= '1';
	WAIT FOR 450000 ps;
	code(5) <= '0';
WAIT;
END PROCESS t_prcs_code_5;
-- code[4]
t_prcs_code_4: PROCESS
BEGIN
	code(4) <= '0';
	WAIT FOR 450000 ps;
	code(4) <= '1';
	WAIT FOR 450000 ps;
	code(4) <= '0';
WAIT;
END PROCESS t_prcs_code_4;
-- code[3]
t_prcs_code_3: PROCESS
BEGIN
	code(3) <= '1';
	WAIT FOR 450000 ps;
	code(3) <= '0';
WAIT;
END PROCESS t_prcs_code_3;
-- code[2]
t_prcs_code_2: PROCESS
BEGIN
	code(2) <= '0';
	WAIT FOR 450000 ps;
	code(2) <= '1';
	WAIT FOR 450000 ps;
	code(2) <= '0';
WAIT;
END PROCESS t_prcs_code_2;
-- code[1]
t_prcs_code_1: PROCESS
BEGIN
	code(1) <= '0';
	WAIT FOR 450000 ps;
	code(1) <= '1';
	WAIT FOR 450000 ps;
	code(1) <= '0';
WAIT;
END PROCESS t_prcs_code_1;
-- code[0]
t_prcs_code_0: PROCESS
BEGIN
	code(0) <= '1';
	WAIT FOR 450000 ps;
	code(0) <= '0';
WAIT;
END PROCESS t_prcs_code_0;
END HAD_DECODER_PARALLEL_arch;
