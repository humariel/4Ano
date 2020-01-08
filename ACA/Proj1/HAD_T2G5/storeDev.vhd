LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDPET IS
  PORT (clk, D:     IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ:      OUT STD_LOGIC);
END flipFlopDPET;

ARCHITECTURE behavior OF flipFlopDPET IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN Q <= '0';
		      nQ <= '1';
		 ELSIF (nSet = '0')
		       THEN Q <= '1';
		            nQ <= '0';
	          ELSIF (clk = '1') AND (clk'EVENT)
	                THEN Q <= D;
		                  nQ <= NOT D;

	 END IF;
  END PROCESS;
END behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_5bit IS
  PORT (nRst: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END parReg_5bit;

ARCHITECTURE structure OF parReg_5bit IS
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
END structure;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parReg_6bit IS
  PORT (nSet: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        Q: OUT STD_LOGIC_VECTOR (5 DOWNTO 0));
END parReg_6bit;

ARCHITECTURE structure OF parReg_6bit IS
  COMPONENT flipFlopDPET
    PORT (clk, D: IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ff0: flipFlopDPET PORT MAP (clk, D(0), nSet, '1', Q(0));
  ff1: flipFlopDPET PORT MAP (clk, D(1), nSet, '1', Q(1));
  ff2: flipFlopDPET PORT MAP (clk, D(2), nSet, '1', Q(2));
  ff3: flipFlopDPET PORT MAP (clk, D(3), nSet, '1', Q(3));
  ff4: flipFlopDPET PORT MAP (clk, D(4), nSet, '1', Q(4));
  ff5: flipFlopDPET PORT MAP (clk, D(5), nSet, '1', Q(5));
END structure;
