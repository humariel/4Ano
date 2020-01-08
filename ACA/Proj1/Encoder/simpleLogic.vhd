LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateAnd2;

ARCHITECTURE logicFunction OF gateAnd2 IS
BEGIN
  y <= x1 AND x2;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateNand2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateNand2;

ARCHITECTURE logicFunction OF gateNand2 IS
BEGIN
  y <= NOT (x1 AND x2);
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateOr2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateOr2;

ARCHITECTURE logicFunction OF gateOr2 IS
BEGIN
  y <= x1 OR x2;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateNor2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateNor2;

ARCHITECTURE logicFunction OF gateNor2 IS
BEGIN
  y <= NOT (x1 OR x2);
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateXor2;

ARCHITECTURE logicFunction OF gateXor2 IS
BEGIN
  y <= x1 XOR x2;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor4 IS
  PORT (x1, x2, x3, x4: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateXor4;

ARCHITECTURE logicFunction OF gateXor4 IS
BEGIN
  y <= x1 XOR x2 XOR x3 XOR x4;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateNor3 IS
  PORT (x1, x2, x3: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateNor3;

ARCHITECTURE logicFunction OF gateNor3 IS
BEGIN
  y <= NOT(x1 OR x2 OR x3);
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd3 IS
  PORT (x1, x2, x3: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateAnd3;

ARCHITECTURE logicFunction OF gateAnd3 IS
BEGIN
  y <= x1 AND x2 AND x3;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXor3 IS
  PORT (x1, x2, x3: IN STD_LOGIC;
        y:      OUT STD_LOGIC);
END gateXor3;

ARCHITECTURE logicFunction OF gateXor3 IS
BEGIN
  y <= x1 XOR x2 XOR x3;
END logicFunction;
