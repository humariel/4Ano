LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FA_3bit IS
	PORT( A, B: IN STD_LOGIC_VECTOR(2 downto 0);
			cin: IN STD_LOGIC;
			sum: OUT STD_LOGIC_VECTOR(2 downto 0);
			cout: OUT STD_LOGIC);
END FA_3bit;

ARCHITECTURE structure OF FA_3bit IS

	SIGNAL lFA1_FA2: STD_LOGIC;
	--FA de 1 bit--
	COMPONENT FA_1bit 
		PORT(in0, in1, cin: IN STD_LOGIC;
				sum, cout: OUT STD_LOGIC);
	END COMPONENT;
	--FA de 2 bit --
	COMPONENT FA_2bit 
		PORT( A, B: IN STD_LOGIC_VECTOR(1 downto 0);
				cin: IN STD_LOGIC;
				sum: OUT STD_LOGIC_VECTOR(1 downto 0);
				cout: OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN

	fa1bit: FA_1bit PORT MAP(A(0), B(0), cin,
										sum(0), lFA1_FA2);
										
	fa2bit: FA_2bit PORT MAP(A(2 downto 1), B(2 downto 1),
										lFA1_FA2,
										sum(2 downto 1),
										cout);

END structure;