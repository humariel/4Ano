LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY lRot_8bit_LR IS
  PORT (dataIn: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        s: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		  l_r: IN STD_LOGIC;
        dataOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END lRot_8bit_LR;


ARCHITECTURE structure OF lRot_8bit_LR IS
	SIGNAL complement_s : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL lr: STD_LOGIC_VECTOR(2 downto 0);
	COMPONENT lRot_8bit
		PORT (dIn: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			  sel: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			  dOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	END COMPONENT;
	
BEGIN
	lr <= (others => l_r);
	complement_s <= STD_LOGIC_VECTOR(UNSIGNED(NOT s) + 1);
	
	lRot: lRot_8bit PORT MAP ( dataIn,
										(complement_s AND lr) OR (s AND (NOT lr)),
										dataOut);
	
END structure;
