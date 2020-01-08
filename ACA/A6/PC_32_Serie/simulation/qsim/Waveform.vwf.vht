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
-- Generated on "11/11/2019 21:10:32"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          popCounter_32bitSerial
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY popCounter_32bitSerial_vhd_vec_tst IS
END popCounter_32bitSerial_vhd_vec_tst;
ARCHITECTURE popCounter_32bitSerial_arch OF popCounter_32bitSerial_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cnt : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL dIn : STD_LOGIC;
SIGNAL nGRst : STD_LOGIC;
COMPONENT popCounter_32bitSerial
	PORT (
	clk : IN STD_LOGIC;
	cnt : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	dIn : IN STD_LOGIC;
	nGRst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : popCounter_32bitSerial
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cnt => cnt,
	dIn => dIn,
	nGRst => nGRst
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		clk <= '0';
		WAIT FOR 15000 ps;
		clk <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- nGRst
t_prcs_nGRst: PROCESS
BEGIN
	nGRst <= '1';
WAIT;
END PROCESS t_prcs_nGRst;

-- dIn
t_prcs_dIn: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		dIn <= '0';
		WAIT FOR 15000 ps;
		dIn <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	dIn <= '0';
WAIT;
END PROCESS t_prcs_dIn;
END popCounter_32bitSerial_arch;
