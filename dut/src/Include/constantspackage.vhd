--04282019 [04-28-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package constantspackage is
    -------------------------------------------------------------------------
    constant yes                       : std_logic := '1';
    constant no                        : std_logic := '0';
    constant hi                        : std_logic := '1';
    constant lo                        : std_logic := '0';
    constant one                       : integer   := 1;
    constant zero                      : integer   := 0;
    constant ch0                       : integer   := 0;
    constant ch1                       : integer   := 1;
    constant ch2                       : integer   := 2;
    constant ch3                       : integer   := 3;
    -------------------------------------------------------------------------
    constant kCoefYcbcrIndex           : integer   := 1;
    constant kCoefCgainIndex           : integer   := 2;
    constant kCoefSharpIndex           : integer   := 3;
    constant kCoefBlureIndex           : integer   := 4;
    constant kCoefSobeXIndex           : integer   := 5;
    constant kCoefSobeYIndex           : integer   := 6;
    constant kCoefEmbosIndex           : integer   := 7;
    constant kCoefCgai1Index           : integer   := 8;
    -------------------------------------------------------------------------
    constant soble                     : integer   := 0;
    constant sobRgb                    : integer   := 1;
    constant sobPoi                    : integer   := 2;
    constant hsvPoi                    : integer   := 3;
    constant sharp                     : integer   := 4;
    constant blur1x                    : integer   := 5;
    constant blur2x                    : integer   := 6;
    constant blur3x                    : integer   := 7;
    constant blur4x                    : integer   := 8;
    constant hsv                       : integer   := 9;
    constant rgb                       : integer   := 10;
    constant rgbRemix                  : integer   := 11;
    constant tPatter1                  : integer   := 12;
    constant tPatter2                  : integer   := 13;
    constant tPatter3                  : integer   := 14;
    constant tPatter4                  : integer   := 15;
    constant tPatter5                  : integer   := 16;
    constant rgbCorrect                : integer   := 17;
    constant hsl                       : integer   := 18;
    constant hsvCcBl                   : integer   := 19;
    constant ycbcr                     : integer   := 0;
    -------------------------------------------------------------------------
    -- videoProcess constants
    -------------------------------------------------------------------------
    constant C_S_AXI_DATA_WIDTH        : integer := 32;
    constant C_rgb_m_axis_TDATA_WIDTH  : integer := 16;
    constant C_rgb_m_axis_START_COUNT  : integer := 32;
    constant C_rgb_s_axis_TDATA_WIDTH  : integer := 16;
    constant C_m_axis_mm2s_TDATA_WIDTH : integer := 16;
    constant C_m_axis_mm2s_START_COUNT : integer := 32;
    constant C_vfpConfig_DATA_WIDTH    : integer := 32;
    constant C_vfpConfig_ADDR_WIDTH    : integer := 8;
    constant i_data_width              : integer := 8;
    constant s_data_width              : integer := 16;
    constant b_data_width              : integer := 32;
    constant i_precision               : integer := 12;
    constant i_full_range              : boolean := FALSE;
    constant conf_data_width           : integer := 32;
    constant conf_addr_width           : integer := 8;
    -------------------------------------------------------------------------
    constant blurMsb                   : integer := 11;
    constant blurLsb                   : integer := 4;
    constant rgb_msb                   : integer := 12;
    constant rgb_lsb                   : integer := 5;
    constant XYCOORD                   : integer := 16;
    -------------------------------------------------------------------------
    constant initCordValueRht          : integer := 0;
    constant initCordValueLft          : integer := 65535;
    constant initCordValueTop          : integer := 65535;
    constant initCordValueBot          : integer := 0;
    constant frameSizeLft              : integer := 1;
    constant frameSizeRht              : integer := 200;
    constant frameSizeTop              : integer := 5;
    constant frameSizeBot              : integer := 200;
    constant pInterestWidth            : integer := 127;
    constant pInterestHight            : integer := 127;
    -------------------------------------------------------------------------
    constant STREAM_TESTPATTERN1       : std_logic_vector(31 downto 0) := x"00000001";
    constant STREAM_TESTPATTERN2       : std_logic_vector(31 downto 0) := x"00000002";
    constant EXTERNAL_AXIS_STREAM      : std_logic_vector(31 downto 0) := x"00000000";
    -------------------------------------------------------------------------
    constant blurMacKernel_1           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_2           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_3           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_4           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_5           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_6           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_7           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_8           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant blurMacKernel_9           : unsigned(i_data_width-1 downto 0) :=x"01";
    constant white                     : std_logic_vector(i_data_width-1 downto 0) :=x"FF";
    constant black                     : std_logic_vector(i_data_width-1 downto 0) :=x"00";
    constant whiteUn                   : unsigned(i_data_width-1 downto 0) :=x"FF";
    constant blackUn                   : unsigned(i_data_width-1 downto 0) :=x"00";
    -------------------------------------------------------------------------
    constant FONT_WIDTH                : integer := 8;
    constant FONT_HEIGHT               : integer := 16;
    -------------------------------------------------------------------------
    constant C_WHOLE_WIDTH             : integer := 3;  
    constant DATA_EXT_WIDTH            : natural := i_data_width + 1;
    constant FRAC_BITS_TO_KEEP         : natural := 3;  
    constant MULT_RESULT_WIDTH         : natural := DATA_EXT_WIDTH + C_WHOLE_WIDTH + FRAC_BITS_TO_KEEP;
    constant ADD_RESULT_WIDTH          : natural := MULT_RESULT_WIDTH + 1;
    constant ROUND_RESULT_WIDTH        : natural := ADD_RESULT_WIDTH - FRAC_BITS_TO_KEEP;
    constant ROUND                     : signed(ADD_RESULT_WIDTH-1 downto 0) := to_signed(0, ADD_RESULT_WIDTH-FRAC_BITS_TO_KEEP)&'1' & to_signed(0, FRAC_BITS_TO_KEEP-1);  
    -------------------------------------------------------------------------
    function max(L, R: INTEGER) return INTEGER;
    function min(L, R: INTEGER) return INTEGER;
    function SelFrame(L, R: BOOLEAN) return BOOLEAN;
    function SelFrame(L, R, M: BOOLEAN) return BOOLEAN;
    function conv_std_logic_vector(ARG : integer; SIZE : integer) return std_logic_vector;
    -------------------------------------------------------------------------
end package;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package body constantspackage is
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
    function SelFrame(L, R: BOOLEAN) return BOOLEAN is
    begin
    if (L = TRUE) and (R = TRUE) then 
        return TRUE;
    else
        return FALSE;
    end if;
    end;
    function SelFrame(L, R, M: BOOLEAN) return BOOLEAN is
    begin
    if (L = TRUE) and (R = TRUE) and (M = TRUE) then 
        return TRUE;
    else
        return FALSE;
    end if;
    end;
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
end package body;