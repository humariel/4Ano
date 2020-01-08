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
-- Generated on "10/21/2019 16:36:43"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          flipflop
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY flipflop_vhd_vec_tst IS
END flipflop_vhd_vec_tst;
ARCHITECTURE flipflop_arch OF flipflop_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL nQ : STD_LOGIC;
SIGNAL nRst : STD_LOGIC;
SIGNAL nSet : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
COMPONENT flipflop
	PORT (
	clk : IN STD_LOGIC;
	D : IN STD_LOGIC;
	nQ : OUT STD_LOGIC;
	nRst : IN STD_LOGIC;
	nSet : IN STD_LOGIC;
	Q : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : flipflop
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	D => D,
	nQ => nQ,
	nRst => nRst,
	nSet => nSet,
	Q => Q
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 100000 ps;
	clk <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 160000 ps;
	D <= '1';
	WAIT FOR 120000 ps;
	D <= '0';
	WAIT FOR 160000 ps;
	D <= '1';
WAIT;
END PROCESS t_prcs_D;

-- nRst
t_prcs_nRst: PROCESS
BEGIN
	nRst <= '0';
	WAIT FOR 460000 ps;
	nRst <= '1';
	WAIT FOR 160000 ps;
	nRst <= '0';
WAIT;
END PROCESS t_prcs_nRst;

-- nSet
t_prcs_nSet: PROCESS
BEGIN
	nSet <= '0';
	WAIT FOR 100000 ps;
	nSet <= '1';
	WAIT FOR 180000 ps;
	nSet <= '0';
WAIT;
END PROCESS t_prcs_nSet;
END flipflop_arch;
