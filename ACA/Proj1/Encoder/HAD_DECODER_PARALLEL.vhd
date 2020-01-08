LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;

ENTITY HAD_DECODER_PARALLEL IS
	PORT( code: IN STD_LOGIC_VECTOR(7 downto 0);
			m: OUT STD_LOGIC_VECTOR(3 downto 0);
			valid : OUT STD_LOGIC);
END HAD_DECODER_PARALLEL;

ARCHITECTURE logic OF HAD_DECODER_PARALLEL IS
	SIGNAL x, y, z : STD_LOGIC;
	SIGNAL m0_valid, m1_valid, m2_valid : STD_LOGIC;
	SIGNAL l_m0, l_m1, l_m2 : STD_LOGIC;
	SIGNAL x0_x1, x2_x3, x4_x5, x6_x7,x0_x2, x1_x3, x4_x6, x5_x7, x0_x4, x1_x5, x2_x6, x3_x7 : STD_LOGIC;
	SIGNAL norxyz, m3xor1, m3and : STD_LOGIC;
	
	COMPONENT validator
	PORT( c0, c1, c2, c3: IN STD_LOGIC;
			one, valid : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateAnd2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateXor2
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
	
	COMPONENT gateXor4
		PORT (x1, x2, x3, x4: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateNor3
		PORT (x1, x2, x3: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateAnd3
	  PORT (x1, x2, x3: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
BEGIN

	xor1: gateXor2 PORT MAP(code(7), code(6), x0_x1);
	xor2: gateXor2 PORT MAP(code(5), code(4), x2_x3);
	xor3: gateXor2 PORT MAP(code(3), code(2), x4_x5);
	xor4: gateXor2 PORT MAP(code(1), code(0), x6_x7);
	xor5: gateXor2 PORT MAP(code(7), code(5), x0_x2);
	xor6: gateXor2 PORT MAP(code(6), code(4), x1_x3);
	xor7: gateXor2 PORT MAP(code(3), code(1), x4_x6);
	xor8: gateXor2 PORT MAP(code(2), code(0), x5_x7);
	xor9: gateXor2 PORT MAP(code(7), code(3), x0_x4);
	xora: gateXor2 PORT MAP(code(6), code(2), x1_x5);
	xorb: gateXor2 PORT MAP(code(5), code(1), x2_x6);
	xorc: gateXor2 PORT MAP(code(4), code(0), x3_x7);
	
	val_m0 : validator PORT MAP(x0_x1, x2_x3, x4_x5, x6_x7,
										l_m0, m0_valid);
	val_m1 : validator PORT MAP(x0_x2, x1_x3, x4_x6, x5_x7,
										l_m1, m1_valid);
	val_m2 : validator PORT MAP(x0_x4, x1_x5, x2_x6, x3_x7,
										l_m2, m2_valid);
	
	m(3) <= l_m0;
	m(2) <= l_m1;
	m(1) <= l_m2;
	
	s_x: gateXor4 PORT MAP(l_m0, x2_x3, x4_x5, x6_x7, x);
	s_y: gateXor4 PORT MAP(l_m1, x1_x3, x4_x6, x5_x7, y);
	s_z: gateXor4 PORT MAP(l_m2, x1_x5, x2_x6, x3_x7, z);
	
	m3_nor: gateNor3 PORT MAP(x,y,z, norxyz);
	m3_xor1: gateXor2 PORT MAP(l_m0, x0_x1, m3xor1);
	m3_and: gateAnd2 PORT MAP(norxyz, m3xor1, m3and);
	m3_xor2: gateXor2 PORT MAP(m3and, code(7), m(0));

	and1: gateAnd3 PORT MAP(m0_valid, m1_valid, m2_valid, valid);
	
END logic;
