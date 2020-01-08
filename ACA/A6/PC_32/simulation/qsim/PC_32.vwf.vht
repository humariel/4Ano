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
-- Generated on "10/30/2019 19:00:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          PC_32
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY PC_32_vhd_vec_tst IS
END PC_32_vhd_vec_tst;
ARCHITECTURE PC_32_arch OF PC_32_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL count : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL datain : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT PC_32
	PORT (
	count : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : PC_32
	PORT MAP (
-- list connections between master ports and signals
	count => count,
	datain => datain
	);
-- datain[31]
t_prcs_datain_31: PROCESS
BEGIN
	datain(31) <= '1';
WAIT;
END PROCESS t_prcs_datain_31;
-- datain[30]
t_prcs_datain_30: PROCESS
BEGIN
	datain(30) <= '1';
WAIT;
END PROCESS t_prcs_datain_30;
-- datain[29]
t_prcs_datain_29: PROCESS
BEGIN
	datain(29) <= '1';
WAIT;
END PROCESS t_prcs_datain_29;
-- datain[28]
t_prcs_datain_28: PROCESS
BEGIN
	datain(28) <= '1';
WAIT;
END PROCESS t_prcs_datain_28;
-- datain[27]
t_prcs_datain_27: PROCESS
BEGIN
	datain(27) <= '1';
WAIT;
END PROCESS t_prcs_datain_27;
-- datain[26]
t_prcs_datain_26: PROCESS
BEGIN
	datain(26) <= '1';
WAIT;
END PROCESS t_prcs_datain_26;
-- datain[25]
t_prcs_datain_25: PROCESS
BEGIN
	datain(25) <= '1';
WAIT;
END PROCESS t_prcs_datain_25;
-- datain[24]
t_prcs_datain_24: PROCESS
BEGIN
	datain(24) <= '1';
WAIT;
END PROCESS t_prcs_datain_24;
-- datain[23]
t_prcs_datain_23: PROCESS
BEGIN
	datain(23) <= '1';
WAIT;
END PROCESS t_prcs_datain_23;
-- datain[22]
t_prcs_datain_22: PROCESS
BEGIN
	datain(22) <= '1';
WAIT;
END PROCESS t_prcs_datain_22;
-- datain[21]
t_prcs_datain_21: PROCESS
BEGIN
	datain(21) <= '1';
WAIT;
END PROCESS t_prcs_datain_21;
-- datain[20]
t_prcs_datain_20: PROCESS
BEGIN
	datain(20) <= '1';
WAIT;
END PROCESS t_prcs_datain_20;
-- datain[19]
t_prcs_datain_19: PROCESS
BEGIN
	datain(19) <= '1';
WAIT;
END PROCESS t_prcs_datain_19;
-- datain[18]
t_prcs_datain_18: PROCESS
BEGIN
	datain(18) <= '1';
WAIT;
END PROCESS t_prcs_datain_18;
-- datain[17]
t_prcs_datain_17: PROCESS
BEGIN
	datain(17) <= '1';
WAIT;
END PROCESS t_prcs_datain_17;
-- datain[16]
t_prcs_datain_16: PROCESS
BEGIN
	datain(16) <= '1';
WAIT;
END PROCESS t_prcs_datain_16;
-- datain[15]
t_prcs_datain_15: PROCESS
BEGIN
	datain(15) <= '1';
WAIT;
END PROCESS t_prcs_datain_15;
-- datain[14]
t_prcs_datain_14: PROCESS
BEGIN
	datain(14) <= '1';
WAIT;
END PROCESS t_prcs_datain_14;
-- datain[13]
t_prcs_datain_13: PROCESS
BEGIN
	datain(13) <= '1';
WAIT;
END PROCESS t_prcs_datain_13;
-- datain[12]
t_prcs_datain_12: PROCESS
BEGIN
	datain(12) <= '1';
WAIT;
END PROCESS t_prcs_datain_12;
-- datain[11]
t_prcs_datain_11: PROCESS
BEGIN
	datain(11) <= '1';
WAIT;
END PROCESS t_prcs_datain_11;
-- datain[10]
t_prcs_datain_10: PROCESS
BEGIN
	datain(10) <= '1';
WAIT;
END PROCESS t_prcs_datain_10;
-- datain[9]
t_prcs_datain_9: PROCESS
BEGIN
	datain(9) <= '1';
WAIT;
END PROCESS t_prcs_datain_9;
-- datain[8]
t_prcs_datain_8: PROCESS
BEGIN
	datain(8) <= '1';
WAIT;
END PROCESS t_prcs_datain_8;
-- datain[7]
t_prcs_datain_7: PROCESS
BEGIN
	datain(7) <= '1';
WAIT;
END PROCESS t_prcs_datain_7;
-- datain[6]
t_prcs_datain_6: PROCESS
BEGIN
	datain(6) <= '1';
WAIT;
END PROCESS t_prcs_datain_6;
-- datain[5]
t_prcs_datain_5: PROCESS
BEGIN
	datain(5) <= '1';
WAIT;
END PROCESS t_prcs_datain_5;
-- datain[4]
t_prcs_datain_4: PROCESS
BEGIN
	datain(4) <= '1';
WAIT;
END PROCESS t_prcs_datain_4;
-- datain[3]
t_prcs_datain_3: PROCESS
BEGIN
	datain(3) <= '1';
WAIT;
END PROCESS t_prcs_datain_3;
-- datain[2]
t_prcs_datain_2: PROCESS
BEGIN
	datain(2) <= '1';
WAIT;
END PROCESS t_prcs_datain_2;
-- datain[1]
t_prcs_datain_1: PROCESS
BEGIN
	datain(1) <= '1';
WAIT;
END PROCESS t_prcs_datain_1;
-- datain[0]
t_prcs_datain_0: PROCESS
BEGIN
	datain(0) <= '1';
WAIT;
END PROCESS t_prcs_datain_0;
END PC_32_arch;
