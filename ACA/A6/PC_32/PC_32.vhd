LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
ENTITY PC_32 IS
	PORT( datain: IN STD_LOGIC_VECTOR(31 downto 0);
			count: OUT STD_LOGIC_VECTOR(5 downto 0));
END PC_32;

ARCHITECTURE structure OF PC_32 IS
	SIGNAL PC4_FA3_0, PC4_FA3_1, PC4_FA3_2, PC4_FA3_3, PC4_FA3_4, PC4_FA3_5, PC4_FA3_6, PC4_FA3_7:  STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL FA3_FA4_0, FA3_FA4_1, FA3_FA4_2, FA3_FA4_3: STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL FA4_FA5_0, FA4_FA5_1: STD_LOGIC_VECTOR(4 downto 0);
	
	--PC de 4 bit --
	COMPONENT PC_4 
		PORT( dataIn: IN STD_LOGIC_VECTOR(3 downto 0);
				count: OUT STD_LOGIC_VECTOR(2 downto 0));
	END COMPONENT;
	--FA de 3 bit --
	COMPONENT FA_3bit 
		PORT( A, B: IN STD_LOGIC_VECTOR(2 downto 0);
				cin: IN STD_LOGIC;
				sum: OUT STD_LOGIC_VECTOR(2 downto 0);
				cout: OUT STD_LOGIC);
	END COMPONENT;
	--FA de 4 bit --
	COMPONENT FA_4bit 
		PORT( A, B: IN STD_LOGIC_VECTOR(3 downto 0);
				cin: IN STD_LOGIC;
				sum: OUT STD_LOGIC_VECTOR(3 downto 0);
				cout: OUT STD_LOGIC);
	END COMPONENT;
	--FA de 5 bit --
	COMPONENT FA_5bit 
		PORT( A, B: IN STD_LOGIC_VECTOR(4 downto 0);
				cin: IN STD_LOGIC;
				sum: OUT STD_LOGIC_VECTOR(4 downto 0);
				cout: OUT STD_LOGIC);
	END COMPONENT;

BEGIN

	PC4_0: PC_4 PORT MAP(datain(3 downto 0),
								PC4_FA3_0);
	PC4_1: PC_4 PORT MAP(datain(7 downto 4),
								PC4_FA3_1);
	PC4_2: PC_4 PORT MAP(datain(11 downto 8),
								PC4_FA3_2);
	PC4_3: PC_4 PORT MAP(datain(15 downto 12),
								PC4_FA3_3);
	PC4_4: PC_4 PORT MAP(datain(19 downto 16),
								PC4_FA3_4);
	PC4_5: PC_4 PORT MAP(datain(23 downto 20),
								PC4_FA3_5);
	PC4_6: PC_4 PORT MAP(datain(27 downto 24),
								PC4_FA3_6);
	PC4_7: PC_4 PORT MAP(datain(31 downto 28),
								PC4_FA3_7);

	FA3_0: FA_3bit PORT MAP(PC4_FA3_0, PC4_FA3_1,
									'0',
									FA3_FA4_0(2 downto 0),
									FA3_FA4_0(3));
	FA3_1: FA_3bit PORT MAP(PC4_FA3_2, PC4_FA3_3,
									'0',
									FA3_FA4_1(2 downto 0),
									FA3_FA4_1(3));
	FA3_2: FA_3bit PORT MAP(PC4_FA3_4, PC4_FA3_5,
									'0',
									FA3_FA4_2(2 downto 0),
									FA3_FA4_2(3));
	FA3_3: FA_3bit PORT MAP(PC4_FA3_6, PC4_FA3_7,
									'0',
									FA3_FA4_3(2 downto 0),
									FA3_FA4_3(3));
									
	FA4_0: FA_4bit PORT MAP(FA3_FA4_0, FA3_FA4_1,
									'0',
									FA4_FA5_0(3 downto 0),
									FA4_FA5_0(4));
	FA4_1: FA_4bit PORT MAP(FA3_FA4_2, FA3_FA4_3,
									'0',
									FA4_FA5_1(3 downto 0),
									FA4_FA5_1(4));	
									
	FA5: FA_5bit PORT MAP(FA4_FA5_0, FA4_FA5_1,
								 '0',
								 count(4 downto 0),
								 count(5));
									
END structure;