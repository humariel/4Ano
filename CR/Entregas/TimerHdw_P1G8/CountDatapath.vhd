library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CountDatapath is
  Port (reset       : in  std_logic;
        clk         : in  std_logic;
        clkEnable   : in  std_logic;
        runFlag     : in  std_logic;
        secLSSetInc : in  std_logic;
        secLSSetDec : in  std_logic;
        secMSSetInc : in  std_logic;
        secMSSetDec : in  std_logic;
        minLSSetInc : in  std_logic;
        minLSSetDec : in  std_logic;
        minMSSetInc : in  std_logic;
        minMSSetDec : in  std_logic;
        zeroFlag    : out std_logic;
        secLSCntVal : out std_logic_vector(3 downto 0);
        secMSCntVal : out std_logic_vector(3 downto 0);
        minLSCntVal : out std_logic_vector(3 downto 0);
        minMSCntVal : out std_logic_vector(3 downto 0));
end CountDatapath;

architecture Behavioral of CountDatapath is
    signal s_secLSTermCnt, s_secMSTermCnt, s_minLSTermCnt, s_minMSTermCnt : std_logic;
    signal s_cntEn_secLS, s_cntEn_secMS, s_cntEn_minLS, s_cntEn_minMS : std_logic;
begin
    s_cntEn_secLS <= runFlag;
    sec_LS:  entity work.CounterDown4(Behavioral)
                generic map(MAX_VAL => 9)
                port map(reset      => reset,
                         clk        => clk,
                         clkEnable  => clkEnable,
                         cntEnable  => s_cntEn_secLS,
                         setIncrem  => secLSSetInc,
                         setDecrem  => secLSSetDec,
                         valOut     => secLSCntVal,
                         termCnt    => s_secLSTermCnt);
                         
    s_cntEn_secMS <= s_cntEn_secLS and s_secLSTermCnt;                     
    sec_MS:  entity work.CounterDown4(Behavioral)
                generic map(MAX_VAL => 5)
                port map(reset      => reset,
                         clk        => clk,
                         clkEnable  => clkEnable,
                         cntEnable  => s_cntEn_secMS,
                         setIncrem  => secMSSetInc,
                         setDecrem  => secMSSetDec,
                         valOut     => secMSCntVal,
                         termCnt    => s_secMSTermCnt);
                         
     s_cntEn_minLS <= s_cntEn_secMS and s_secMSTermCnt;                   
     min_LS:  entity work.CounterDown4(Behavioral)
                generic map(MAX_VAL => 9)
                port map(reset      => reset,
                         clk        => clk,
                         clkEnable  => clkEnable,
                         cntEnable  => s_cntEn_minLS,
                         setIncrem  => minLSSetInc,
                         setDecrem  => minLSSetDec,
                         valOut     => minLSCntVal,
                         termCnt    => s_minLSTermCnt);
                         
     s_cntEn_minMS <=  s_cntEn_minLS and s_minLSTermCnt;
     min_MS:  entity work.CounterDown4(Behavioral)
                generic map(MAX_VAL => 5)
                port map(reset      => reset,
                         clk        => clk,
                         clkEnable  => clkEnable,
                         cntEnable  => s_cntEn_minMS,
                         setIncrem  => minMSSetInc,
                         setDecrem  => minMSSetDec,
                         valOut     => minMSCntVal,
                         termCnt    => s_minMSTermCnt);

    zeroFlag <= s_secLSTermCnt and s_secMSTermCnt and s_minLSTermCnt and s_minMSTermCnt;                 
       
end Behavioral;
