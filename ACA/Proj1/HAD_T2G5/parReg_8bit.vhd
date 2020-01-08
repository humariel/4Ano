LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_8bit IS
  PORT (nRst: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END parReg_8bit;

ARCHITECTURE structure OF parReg_8bit IS
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D(0), '1', nRst, Q(0));
  ff1: flipFlopDPET PORT MAP (clk, D(1), '1', nRst, Q(1));
  ff2: flipFlopDPET PORT MAP (clk, D(2), '1', nRst, Q(2));
  ff3: flipFlopDPET PORT MAP (clk, D(3), '1', nRst, Q(3));
  ff4: flipFlopDPET PORT MAP (clk, D(4), '1', nRst, Q(4));
  ff5: flipFlopDPET PORT MAP (clk, D(5), '1', nRst, Q(5));
  ff6: flipFlopDPET PORT MAP (clk, D(6), '1', nRst, Q(6));
  ff7: flipFlopDPET PORT MAP (clk, D(7), '1', nRst, Q(7));
END structure;