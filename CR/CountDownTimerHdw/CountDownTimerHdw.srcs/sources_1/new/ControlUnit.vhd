library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
  Port (reset       : in std_logic;
        clk         : in std_logic;
        btnStart    : in std_logic;
        btnSet      : in std_logic;
        btnUp       : in std_logic; 
        btnDown     : in std_logic;
        upDownEn    : in std_logic;
        zeroFlag    : in std_logic;
        runFlag     : out std_logic;
        setFlags    : out std_logic_vector(3 downto 0);
        secLSSetInc : out std_logic;
        secLSSetDec : out std_logic;
        secMSSetInc : out std_logic;
        secMSSetDec : out std_logic;
        minLSSetInc : out std_logic;
        minLSSetDec : out std_logic;
        minMSSetInc : out std_logic;
        minMSSetDec : out std_logic);
end ControlUnit;

architecture Behavioral of ControlUnit is

    Type TState is (CLEARED, STARTED, PAUSED, SET_SEC_LS, SET_SEC_MS, SET_MIN_LS, SET_MIN_MS);
    signal s_currentState, s_nextState : TState;
    signal s_runFlag : std_logic;
    signal s_setFlags : std_logic_vector(3 downto 0);
    
begin
    --sync state process
    sync_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                s_currentState <= CLEARED;
            else
                s_currentState <= s_nextState;
            end if;
        end if;
    end process;

    --combinatorial process
    comb_proc: process(s_currentState, btnStart, btnSet, zeroFlag)
    begin
        case s_currentState is
        when CLEARED => 
            --set signals
            runFlag     <= '0';
            s_setFlags    <= "0000";
            --set next state
            s_nextState <= PAUSED;
            
        when STARTED => 
            --set signals
            runFlag     <= '1';
            s_setFlags    <= "0000";
            --set next state
            if(btnStart = '1' or zeroFlag = '1') then
                s_nextState <= PAUSED;
            else
                s_nextState <= s_currentState;
            end if;
            
        when PAUSED => 
            --set signals
            runFlag     <= '0';
            if(zeroFlag = '1') then   
                s_setFlags <= "1111";  
            else
                s_setFlags <= "0000";
            end if;
            --set next state
            if(btnStart = '1') then
                s_nextState <= STARTED;
            elsif(btnSet = '1') then
                s_nextState <= SET_SEC_LS;
            else
                s_nextState <= s_currentState;
            end if;
            
        when SET_SEC_LS => 
            --set signals
            runFlag     <= '0';
            s_setFlags    <= "0001";
            --set next state
            if(btnSet = '1') then
                s_nextState <= SET_SEC_MS;
            else
                s_nextState <= s_currentState;
            end if;    
                   
        when SET_SEC_MS => 
            --set signals
            runFlag     <= '0';
            s_setFlags    <= "0010";
            --set next state
            if(btnSet = '1') then
                s_nextState <= SET_MIN_LS;
            else
                s_nextState <= s_currentState;
            end if; 
            
        when SET_MIN_LS => 
            --set signals
            runFlag     <= '0';
            s_setFlags    <= "0100";
            --set next state
            if(btnSet = '1') then
                s_nextState <= SET_MIN_MS;
            else
                s_nextState <= s_currentState;
            end if; 
            
        when SET_MIN_MS => 
            --set signals
            runFlag     <= '0';
            s_setFlags    <= "1000";
            --set next state
            if(btnSet = '1') then
                s_nextState <= PAUSED;
            else
                s_nextState <= s_currentState;
            end if; 

       end case;
    end process;
    
    setFlags <= s_setFlags;
    
    secLSSetInc <= btnUp and upDownEn and s_setFlags(0);
    secLSSetDec <= btnDown and upDownEn and s_setFlags(0);
    secMSSetInc <= btnUp and upDownEn and s_setFlags(1);
    secMSSetDec <= btnDown and upDownEn and s_setFlags(1);
    minLSSetInc <= btnUp and upDownEn and s_setFlags(2);
    minLSSetDec <= btnDown and upDownEn and s_setFlags(2);
    minMSSetInc <= btnUp and upDownEn and s_setFlags(3);
    minMSSetDec <= btnDown and upDownEn and s_setFlags(3);
    
end Behavioral;
