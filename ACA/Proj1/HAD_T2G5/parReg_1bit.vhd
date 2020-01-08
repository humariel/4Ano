LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_1bit IS
  PORT (nRst: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END parReg_1bit;

ARCHITECTURE structure OF parReg_1bit IS
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D, '1', nRst, Q);
END structure;