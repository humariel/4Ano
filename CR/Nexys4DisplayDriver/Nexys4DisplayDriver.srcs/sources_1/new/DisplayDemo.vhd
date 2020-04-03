library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DisplayDemo is
    port(clk : in  std_logic;
         sw  : in  std_logic_vector(15 downto 0);
         an  : out std_logic_vector(7 downto 0);
         seg : out std_logic_vector(6 downto 0);
         dp  : out std_logic);
end DisplayDemo;

architecture Wrapper of DisplayDemo is

    signal s_pulse : std_logic;
    
begin
    clk_divider : entity work.PulseGenerator(Behavioral)
	   generic map(k 	=> 125000)
	   port map(clkIn	=> clk,
		        clkOut	=> s_pulse);

    display_driver : entity work.Nexys4DisplayDriver(Behavioral)
        port map(clk       => clk,
                 enable    => s_pulse,
                 digitEn   => sw(7 downto 0), 
                 digVal0   => "0001",
                 digVal1   => "0011", 
                 digVal2   => "0101",
                 digVal3   => "0111",
                 digVal4   => "1001",
                 digVal5   => "1011",
                 digVal6   => "1101",
                 digVal7   => "1111",
                 decPtEn   => sw(15 downto 8),
                 dispEn_n  => an,
                 dispSeg_n => seg,
                 dispPt_n  => dp);
end Wrapper;