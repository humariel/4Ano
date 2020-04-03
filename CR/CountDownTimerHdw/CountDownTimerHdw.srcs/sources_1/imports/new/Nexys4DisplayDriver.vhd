library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nexys4DisplayDriver is
  port(clk       : in  std_logic;
       enable    : in  std_logic;
       digitEn   : in  std_logic_vector(7 downto 0);
       digVal0   : in  std_logic_vector(3 downto 0);
       digVal1   : in  std_logic_vector(3 downto 0);
       digVal2   : in  std_logic_vector(3 downto 0);
       digVal3   : in  std_logic_vector(3 downto 0);
       digVal4   : in  std_logic_vector(3 downto 0);
       digVal5   : in  std_logic_vector(3 downto 0);
       digVal6   : in  std_logic_vector(3 downto 0);
       digVal7   : in  std_logic_vector(3 downto 0);
       decPtEn   : in  std_logic_vector(7 downto 0);
       dispEn_n  : out std_logic_vector(7 downto 0);
       dispSeg_n : out std_logic_vector(6 downto 0);
       dispPt_n  : out std_logic);
end Nexys4DisplayDriver;

architecture Behavioral of Nexys4DisplayDriver is

    signal s_counter : unsigned(2 downto 0);
    signal s_segment : std_logic_vector(3 downto 0);
    type ROM is array(0 to 15) of std_logic_vector(6 downto 0);
    signal s_rom : ROM :=(
            "1000000",
            "1111001",
            "0100100",
            "0110000",
            "0011001",
            "0010010",
            "0000010",
            "1111000",
            "0000000",
            "0010000",
            "0001000",
            "0000011",
            "1000110",
            "0100001",
            "0000110",
            "0001110"); 

begin
    --counter
    process(clk, enable)
    begin
        if(rising_edge(clk)) then
            if(enable = '1') then
                s_counter <= s_counter + 1;
            end if;
        end if;
    end process;
    --anodos
    process
    begin
        dispEn_n <= (others => '1');
        dispEn_n(to_integer(s_counter)) <= '0'; 
    end process;
    --decimal point
    process
    begin
        dispPt_n <= not(decPtEn(to_integer(s_counter)));
    end process;
    --multiplexer
    process
    begin
        case s_counter is
          when "000" =>   s_segment <= digVal0;
          when "001" =>   s_segment <= digVal1;
          when "010" =>   s_segment <= digVal2;
          when "011" =>   s_segment <= digVal3;
          when "100" =>   s_segment <= digVal4;
          when "101" =>   s_segment <= digVal5;
          when "110" =>   s_segment <= digVal6;
          when "111" =>   s_segment <= digVal7;
        end case;
    end process;
    --catodos
    process
    begin
        if(digitEn(to_integer(s_counter)) = '1') then
            dispSeg_n <= s_rom(to_integer(unsigned(s_segment)));
        else
            dispSeg_n <= (others => '1');
        end if;
    end process;
    
end Behavioral;