LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY HAD_ENCODER_SERIE IS
	PORT( mIn: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			nGRst: IN STD_LOGIC;
			done: OUT STD_LOGIC;
			code: OUT STD_LOGIC_VECTOR(7 downto 0));
END HAD_ENCODER_SERIE;

ARCHITECTURE logic OF HAD_ENCODER_SERIE IS

	signal cicle : STD_LOGIC_VECTOR(2 downto 0);
	signal clkO, s_mIn, iNRst, iNSet : STD_LOGIC;
	signal factorsO: STD_LOGIC_VECTOR(7 downto 0);
	
	COMPONENT flipFlopD
	 PORT (clk, D: IN STD_LOGIC;
			 nSet, nRst: IN STD_LOGIC;
			 Q, nQ: OUT STD_LOGIC);
	END COMPONENT;
	
  COMPONENT binCounter_3bit
    PORT (nRst: IN STD_LOGIC;
          clk:  IN STD_LOGIC;
          c:    OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT control
    PORT (nGRst: IN STD_LOGIC;
          clk:   IN STD_LOGIC;
          cicle: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
          nRst:  OUT STD_LOGIC;
          done: OUT STD_LOGIC;
			 factors: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT bitEncoder
	PORT( bIn: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			nRst: IN STD_LOGIC;
			mult: IN STD_LOGIC;
			bOut: OUT STD_LOGIC);
  END COMPONENT;
	
BEGIN

	bc:  binCounter_3bit PORT MAP (iNRst, clk, cicle);
	con: control  PORT MAP (nGRst, clk, cicle, iNRst, done, factorsO);
	
	be0: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(0), code(0));
	be1: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(1), code(1));
	be2: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(2), code(2));
	be3: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(3), code(3));
	be4: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(4), code(4));
	be5: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(5), code(5));
	be6: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(6), code(6));
	be7: bitEncoder PORT MAP (mIn, clk, iNRst, factorsO(7), code(7));
	
END LOGIC;