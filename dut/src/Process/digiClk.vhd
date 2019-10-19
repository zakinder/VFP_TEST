--02072019 [02-07-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.constantspackage.all;
use work.vpfRecords.all;
--source clock 142.857132 instead 150 = half p 71428566 else if 75= 37500000*2
--source clock 100Mhz = half p 50000000 but to sec in per ms 50000
entity digiClk is
    port (
    clk1    : in std_logic;
    seconds : out std_logic_vector(5 downto 0);
    minutes : out std_logic_vector(5 downto 0);
    hours   : out std_logic_vector(4 downto 0));
end digiClk;
architecture Behavioral of digiClk is
constant HALFPERIOD     : integer   := 71428566;--@142.8MHz= 1/2sec for HARDWARE
constant TESTHALFPERIOD : integer   := 50000;--@100MHz= 1/2ms
signal sec,min,hour     : integer range 0 to 60 :=0;
signal count            : integer   := 1;
signal clk              : std_logic :='0';
begin
    seconds <= conv_std_logic_vector(sec,6);
    minutes <= conv_std_logic_vector(min,6);
    hours   <= conv_std_logic_vector(hour,5);
process(clk1)begin
    if(clk1'event and clk1='1') then
        count <=count + 1;
        if(count = HALFPERIOD) then
            clk     <= not clk;
            count   <=1;
        end if;
    end if;
end process;
process(clk)begin
    if(clk'event and clk='1') then
        sec <= sec+ 1;
        if(sec = 59) then
            sec<=0;
            min <= min + 1;
            if(min = 59) then
                hour <= hour + 1;
                min <= 0;
                if(hour = 23) then
                    hour <= 0;
                end if;
            end if;
        end if;
    end if;
end process;
end Behavioral;