LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY FA_1bit IS
	PORT( in0, in1, cin: IN STD_LOGIC;
			sum, cout: OUT STD_LOGIC);
END FA_1bit;

ARCHITECTURE logic OF FA_1bit IS
BEGIN
	sum <= cin XOR (in0 XOR in1);
	cout <= (in0 AND in1) OR (in1 AND cin) OR (in0 AND cin);
END logic;