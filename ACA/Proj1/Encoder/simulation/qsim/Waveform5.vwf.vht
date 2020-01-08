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
-- Generated on "11/15/2019 16:04:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          control
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY control_vhd_vec_tst IS
END control_vhd_vec_tst;
ARCHITECTURE control_arch OF control_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cicle : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL clkO : STD_LOGIC;
SIGNAL factors : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL nGRst : STD_LOGIC;
SIGNAL nRst : STD_LOGIC;
SIGNAL nSetO : STD_LOGIC;
COMPONENT control
	PORT (
	cicle : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	clk : IN STD_LOGIC;
	clkO : BUFFER STD_LOGIC;
	factors : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	nGRst : IN STD_LOGIC;
	nRst : BUFFER STD_LOGIC;
	nSetO : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : control
	PORT MAP (
-- list connections between master ports and signals
	cicle => cicle,
	clk => clk,
	clkO => clkO,
	factors => factors,
	nGRst => nGRst,
	nRst => nRst,
	nSetO => nSetO
	);
-- cicle[2]
t_prcs_cicle_2: PROCESS
BEGIN
	cicle(2) <= '0';
	WAIT FOR 400000 ps;
	cicle(2) <= '1';
	WAIT FOR 400000 ps;
	cicle(2) <= '0';
WAIT;
END PROCESS t_prcs_cicle_2;
-- cicle[1]
t_prcs_cicle_1: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		cicle(1) <= '0';
		WAIT FOR 200000 ps;
		cicle(1) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	cicle(1) <= '0';
WAIT;
END PROCESS t_prcs_cicle_1;
-- cicle[0]
t_prcs_cicle_0: PROCESS
BEGIN
LOOP
	cicle(0) <= '0';
	WAIT FOR 100000 ps;
	cicle(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_cicle_0;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 50000 ps;
	clk <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- nGRst
t_prcs_nGRst: PROCESS
BEGIN
	nGRst <= '1';
WAIT;
END PROCESS t_prcs_nGRst;
END control_arch;
