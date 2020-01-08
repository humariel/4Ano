LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bitEncoder IS
	PORT( bIn: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			nRst: IN STD_LOGIC;
			mult: IN STD_LOGIC;
			bOut: OUT STD_LOGIC);
END bitEncoder;

ARCHITECTURE behaviour OF bitEncoder IS

	signal tMult, tXor, tReg : STD_LOGIC;

	COMPONENT gateAnd2
	 PORT (x1, x2: IN STD_LOGIC;
			 y:      OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT gateXor2
    PORT (x1, x2: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
	END COMPONENT;
	
  COMPONENT parReg_1bit
    PORT (nRst: IN STD_LOGIC;
          clk: IN STD_LOGIC;
          D: IN STD_LOGIC;
          Q: OUT STD_LOGIC);
  END COMPONENT;
  
BEGIN

	ad: gateAnd2 PORT MAP(bIn, mult, tMult);
	xo: gateXor2 PORT MAP(tMult, tReg, tXor);
	pr: parReg_1bit PORT MAP (nRst, clk, tXor, tReg);
	bOut <= tReg;
	--bOut <= tXor;

END behaviour;
