LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control IS
  PORT (nGRst: IN STD_LOGIC;
        clk:   IN STD_LOGIC;
        cicle: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        nRst:  OUT STD_LOGIC;
        done: OUT STD_LOGIC;
		  factors: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END control;

ARCHITECTURE structure OF control IS
  SIGNAL cSignals: STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL iNRst, iNSetO: STD_LOGIC;
  
	COMPONENT contMem
	 PORT (cicle:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			 dOut: OUT STD_LOGIC_VECTOR (9 DOWNTO 0));
	END COMPONENT;

	COMPONENT gateNand2
	 PORT (x1, x2: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT gateNor2
	 PORT (x1, x2: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;
  
	COMPONENT parReg_8bit
	 PORT (nRst: IN STD_LOGIC;
			 clk: IN STD_LOGIC;
			 D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			 Q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	END COMPONENT;
  
BEGIN
  cMem: contMem   PORT MAP (cicle, cSignals);
  par: parReg_8bit PORT MAP (nGRst, not(clk), cSignals(9 downto 2), factors);
  nad1: gateNand2 PORT MAP (nGRst, cSignals(1), iNRst);
  nad2: gateNand2 PORT MAP (clk, iNRst, nRst);
  done <= cSignals(0);
END structure;
