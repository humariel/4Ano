LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY PC_4 IS
	PORT( dataIn: IN STD_LOGIC_VECTOR(3 downto 0);
			count: OUT STD_LOGIC_VECTOR(2 downto 0));
END PC_4;

ARCHITECTURE logic OF PC_4 IS
BEGIN
	count(2) <= dataIn(3) AND dataIn(2) AND dataIn(1) AND dataIn(0);
	
	count(1) <= (dataIn(3) AND (dataIn(2) XOR dataIn(1))) OR 
					(dataIn(2) AND (dataIn(1) XOR dataIn(0))) OR  
					(dataIn(0) AND ((dataIn(3) AND (NOT(dataIn(2)))) OR (NOT(dataIn(3)) AND dataIn(1))));
					
	count(0) <= dataIn(3) XOR dataIn(2) XOR dataIn(1) XOR dataIn(0);
END logic;