library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PulseGenerator is
	generic(k 	: natural := 50);
	port(clkIn	: in  std_logic;
		 clkOut	: out std_logic);
end PulseGenerator;

architecture Behavioral of PulseGenerator is

	signal s_divCounter : natural;

begin
	assert(K >= 2);
	
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (s_divCounter = k - 1) then
				clkOut <= '1';
				s_divCounter <= 0;
			else
				s_divCounter <= s_divCounter + 1;
				clkOut <= '0';
			end if;
		end if;
	end process;
end Behavioral;