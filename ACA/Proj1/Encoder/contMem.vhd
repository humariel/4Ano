LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY contMem IS
  PORT (cicle:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        dOut: OUT STD_LOGIC_VECTOR (9 DOWNTO 0));
END contMem; 

ARCHITECTURE behavior OF contMem IS
BEGIN
  PROCESS (cicle)
    TYPE CMem IS ARRAY(0 TO 7) OF STD_LOGIC_VECTOR (9 DOWNTO 0);
    VARIABLE prog: CMem := ("1111111110", -- nRst = 1   done=0   00
                            "0000111110", -- nRst = 1   done=0   01
                            "0011001110", -- nRst = 1   done=0   02
                            "0101010110", -- nRst = 1   done=0   03
                            "0000000011", -- nRst = 1   done=0   04
                            "0000000000", -- nRst = 0   done=1   05
                            "0000000010",
                            --"0000000010",
									 "0000000010");
    VARIABLE pos: INTEGER;
  BEGIN
    pos := CONV_INTEGER(cicle);
    dOut <= prog(pos);
  END PROCESS;
END behavior;