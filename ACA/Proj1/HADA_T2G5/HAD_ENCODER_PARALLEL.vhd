LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY HAD_ENCODER_PARALLEL IS
	PORT( m: IN STD_LOGIC_VECTOR(3 downto 0);
			code: OUT STD_LOGIC_VECTOR(7 downto 0));
END HAD_ENCODER_PARALLEL;

ARCHITECTURE logic OF HAD_ENCODER_PARALLEL IS
	SIGNAL m0_m3 : STD_LOGIC;
	SIGNAL m1_m3 : STD_LOGIC;
	
	COMPONENT gateXor2
		PORT (x1, x2: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateXor3
		PORT (x1, x2, x3: IN STD_LOGIC;
			  y:      OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	
	m0m3: gateXor2 PORT MAP(m(3), m(0), m0_m3);
	m1m3: gateXor2 PORT MAP(m(2), m(0), m1_m3);
	
	code(7) <= m(0);
	code(6) <= m0_m3;
	code(5) <= m1_m3;
	code3: gateXor2 PORT MAP(m(3), m1_m3, code(4));
	code4: gateXor2 PORT MAP(m(1), m(0), code(3));
	code5: gateXor2 PORT MAP(m(1), m0_m3, code(2));
	code6: gateXor2 PORT MAP(m(1), m1_m3, code(1));
	code7: gateXor3 PORT MAP(m(1), m(2), m0_m3, code(0));
END LOGIC;