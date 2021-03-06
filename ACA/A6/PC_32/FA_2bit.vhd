LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FA_2bit IS
	PORT( A, B: IN STD_LOGIC_VECTOR(1 downto 0);
			cin: IN STD_LOGIC;
			sum: OUT STD_LOGIC_VECTOR(1 downto 0);
			cout: OUT STD_LOGIC);
END FA_2bit;

ARCHITECTURE structure OF FA_2bit IS
	SIGNAL l01: STD_LOGIC;
	COMPONENT FA_1bit 
		PORT(in0, in1, cin: IN STD_LOGIC;
				sum, cout: OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN

	fa1bit_0: FA_1bit PORT MAP(A(0), B(0), cin,
										sum(0), l01);
										
	fa1bit_1: FA_1bit PORT MAP(A(1), B(1), l01,
										sum(1), cout);

END structure;