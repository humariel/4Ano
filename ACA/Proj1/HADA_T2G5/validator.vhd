LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY validator IS
	PORT( c0, c1, c2, c3: IN STD_LOGIC;
			one, valid : OUT STD_LOGIC);
END validator;

ARCHITECTURE logic OF validator IS
	SIGNAL l_zero, l_one : STD_LOGIC;
	SIGNAL c3andc2, c1orc0, c1andc0, c3orc2, one0, one1 : STD_LOGIC;
	SIGNAL c3norc2, c1nandc0, c1norc0, c3nandc2, zero0, zero1 : STD_LOGIC;
	
	COMPONENT gateAnd2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateNand2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateOr2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateNor2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
				--calcular one--
	and1: gateAnd2 PORT MAP(c3,c2,c3andc2);
	or1 : gateOr2 PORT MAP(c1,c0,c1orc0);
	and2: gateAnd2 PORT MAP(c3andc2,c1orc0, one0);
	and3: gateAnd2 PORT MAP(c1,c0,c1andc0);
	or2 : gateOr2 PORT MAP(c3,c2,c3orc2);
	and4: gateAnd2 PORT MAP(c1andc0,c3orc2, one1);
	or3 : gateOr2 PORT MAP(one0,one1,l_one);
	
				--calcular zero--
	nor1: gateNor2 PORT MAP(c3,c2,c3norc2);
	nand1 : gateNand2 PORT MAP(c1,c0,c1nandc0);
	and5: gateAnd2 PORT MAP(c3norc2,c1nandc0, zero0);
	nor2: gateNor2 PORT MAP(c1,c0,c1norc0);
	nand2 : gateNand2 PORT MAP(c3,c2,c3nandc2);
	and6: gateAnd2 PORT MAP(c1norc0,c3nandc2, zero1);
	or4 : gateOr2 PORT MAP(zero0,zero1,l_zero);
	
	one <= l_one;
	or5 : gateOr2 PORT MAP(l_one, l_zero, valid);
END logic;