--12302021 [12-30-2021]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package tbPackage is
    ----------------------------------------------------------------------------------------------------
    --procdures
    ----------------------------------------------------------------------------------------------------
    --functions
    function maxchar(L: integer)                                    return string;
    function image_size_width(bmp: string)                          return integer;
    function image_size_height(bmp: string)                         return integer;
    ----------------------------------------------------------------------------------------------------
    --       [64_64   = 5   us]
    --       [128_128 = 18  us]
    --       [255_255 = 18  us]
    --       [272_416 = 239 us]
    --       [272_832 = 239 us]
    --       [300_300 = 110 us]
    --       [400_300 = 123 us] 1/2 HR
    --       [500_500 = 250 us] 1   HR
    --       [619_479 = 304 us]
    --       [770_580 = 452 us]
    constant readbmp             : string  := "1012_606";
    constant Histrograms         : string  := "Histrograms";
    constant img_width           : integer := 1012;--image_size_width(readbmp);
    constant img_height          : integer := 606;--image_size_height(readbmp);
    constant clk_freq            : real    := 1000.00e6;
    constant revision_number     : std_logic_vector(31 downto 0) := x"02212019";
    constant dataWidth           : integer := 12; 
    constant line_hight          : integer := 5;  
    constant adwrWidth           : integer := 16;
    constant addrWidth           : integer := 12;
    constant SLOT_NUM            : integer := 80;
    constant wImgFolder          : string := "K:/ZEDBOARD/simulations/images/write";
    constant rImgFolder          : string := "K:/ZEDBOARD/simulations/images/read";
    constant bSlash              : string := "\";
    constant fSlash              : string := "/";
    constant LogsFolder          : string := "Logs";
end package;


--------------------------------------------------------------------------------------------------------
--TB PACKAGE
--------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package body tbPackage is
    ----------------------------------------------------------------------------------------------------
    function image_size_width(bmp: string) return integer is
    begin
       if bmp = "64_64"  then
           return 64;
       elsif bmp = "128_128" then
           return 128;
       elsif bmp = "255_255" then
           return 255;
       elsif bmp = "255_127" then
           return 255;
       elsif bmp = "272_416" then
           return 272;
       elsif bmp = "272_832" then
           return 272;
       elsif bmp = "300_300" then
           return 300;
       elsif bmp = "500_500" then
           return 500;
       elsif bmp = "600_600" then
           return 600;
       elsif bmp = "619_479" then
           return 619;
       elsif bmp = "770_580" then
           return 770;
       elsif bmp = "950_950" then
           return 950;
       elsif bmp = "1000_500" then
           return 1000;
       end if;
    end;
    ----------------------------------------------------------------------------------------------------
    function image_size_height(bmp: string) return integer is
    begin
       if bmp = "64_64"  then
           return 64;
       elsif bmp = "128_128" then
           return 128;
       elsif bmp = "255_255" then
           return 255;
       elsif bmp = "255_127" then
           return 127;
       elsif bmp = "272_416" then
           return 416;
       elsif bmp = "272_832" then
           return 832;
       elsif bmp = "300_300" then
           return 300;
       elsif bmp = "500_500" then
           return 500;
       elsif bmp = "600_600" then
           return 600;
       elsif bmp = "619_479" then
           return 479;
       elsif bmp = "770_580" then
           return 580;
       elsif bmp = "950_950" then
           return 950;
       elsif bmp = "1000_500" then
           return 500;
       end if;
    end;
    ----------------------------------------------------------------------------------------------------
    function maxchar(L: integer) return string is
    begin
       if L >= 100  then
           return " ";
       elsif L >= 10 then
           return "  ";
       elsif L <= 10 then
           return "   ";
       end if;
    end;
    ----------------------------------------------------------------------------------------------------




end package body;