LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FA_4bit IS
	PORT( A, B: IN STD_LOGIC_VECTOR(3 downto 0);
			cin: IN STD_LOGIC;
			sum: OUT STD_LOGIC_VECTOR(3 downto 0);
			cout: OUT STD_LOGIC);
END FA_4bit;

ARCHITECTURE structure OF FA_4bit IS

	SIGNAL l12: STD_LOGIC;
	--FA de 2 bit --
	COMPONENT FA_2bit 
		PORT( A, B: IN STD_LOGIC_VECTOR(1 downto 0);
				cin: IN STD_LOGIC;
				sum: OUT STD_LOGIC_VECTOR(1 downto 0);
				cout: OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN

	fa1: FA_2bit PORT MAP(A(1 downto 0), B(1 downto 0),
									cin,
									sum(1 downto 0),
									l12);
										
	fa2: FA_2bit PORT MAP(A(3 downto 2), B(3 downto 2),
										l12,
										sum(3 downto 2),
										cout);

END structure;