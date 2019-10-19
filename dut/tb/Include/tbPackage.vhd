--01062019 [01-06-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package tbPackage is
    constant revision_number     : std_logic_vector(31 downto 0) := x"02212019";
    constant pixclk_freq         : real    := 150.00e6;
    constant aclk_freq           : real    := 150.00e6;
    constant mm2s_aclk           : real    := 150.00e6;
    constant maxis_aclk          : real    := 150.00e6;
    constant saxis_aclk          : real    := 150.00e6;
    constant dataWidth           : integer := 12; 
    constant line_hight          : integer := 5;  
     constant img_width           : integer := 400;
     constant img_height          : integer := 300;
    --constant img_width           : integer := 128;
    --constant img_height          : integer := 128;
    constant adwrWidth           : integer := 16;
    constant addrWidth           : integer := 12;
    constant readbmp             : string  := "400_300";
    --constant readbmp             : string  := "128_128";
    --constant writebmp            : string  := "readbmp";
function conv_std_logic_vector(ARG : integer; SIZE : integer) return std_logic_vector;
procedure clk_gen(signal clk : out std_logic; constant FREQ : real) ;
function max(L, R: INTEGER) return INTEGER;
function min(L, R: INTEGER) return INTEGER;
end package;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package body tbPackage is
    function max(L, R: INTEGER) return INTEGER is
    begin
       if L > R then
           return L;
       else
           return R;
       end if;
    end;
    function min(L, R: INTEGER) return INTEGER is
    begin
       if L < R then
           return L;
       else
           return R;
       end if;
    end;
procedure clk_gen(signal clk : out std_logic; constant FREQ : real) is
    constant PERIOD    : time := 1 sec / FREQ;
    constant HIGH_TIME : time := PERIOD / 2;
    constant LOW_TIME  : time := PERIOD - HIGH_TIME;
    begin
        loop
        clk <= '1';
        wait for HIGH_TIME;
        clk <= '0';
        wait for LOW_TIME;
    end loop;
end procedure;
function conv_std_logic_vector(ARG : integer; SIZE : integer) return std_logic_vector is
    variable result         : std_logic_vector (SIZE - 1 downto 0);
    variable temp           : integer;
    begin
    temp := ARG;
    for i in 0 to SIZE - 1 loop
        if (temp mod 2) = 1 then
            result(i) := '1';
        else
            result(i) := '0';
        end if;
        if temp > 0 then
            temp := temp / 2;
        elsif (temp > integer'low) then
            temp := (temp - 1) / 2;
        else
            temp := temp / 2;
        end if;
    end loop; 
    return result;
end function;
end package body;