library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_package.all;
use work.vpf_records.all;
use work.ports_package.all;
entity PixelOnDisplay is
generic(
    img_width_bmp    : integer := 1920;
    img_height_bmp   : integer := 1080;
    b_data_width     : integer := 32);
port (
    clk          : in std_logic;
    rst_l        : in std_logic;
    location     : in cord;
    grid         : in cord;
    videoChannel : in std_logic_vector(b_data_width-1 downto 0);
    pixel        : out std_logic);
end PixelOnDisplay;

architecture Behavioral of PixelOnDisplay is
    constant NU_MRGB_TYPES       : natural := 50;
    signal displayText           : string(1 to 5):= "INRGB";
    signal vChannelSelect        : natural range 0 to NU_MRGB_TYPES := 0;
    signal fontAddress           : integer := 0;
    signal charBitInRow          : std_logic_vector(FONT_WIDTH-1 downto 0) := (others => '0');
    signal charCode              : natural := 0;
    signal charCodeLen           : natural := 16;
    signal charPosition          : integer := 1;
    signal bit_position_enable   : std_logic := lo;
    signal bit_position_sync     : std_logic := lo;
    signal bit_position          : natural range 0 to (FONT_WIDTH-1) := 0;
    
begin

vChannelSelect    <= to_integer(unsigned(videoChannel));

videoOutP: process (clk) begin
    if rising_edge(clk) then
        if (vChannelSelect = ch0) then
            displayText      <= "CGAIN";
        elsif(vChannelSelect = ch1)then
            displayText      <= "SHARP";
        elsif(vChannelSelect = ch2)then
            displayText      <= "BLURE";
        elsif(vChannelSelect = ch3)then
            displayText      <= "INHSL";
        elsif(vChannelSelect = ch4)then
            displayText      <= "INHSV";
        elsif(vChannelSelect = ch5)then
            displayText      <= "INRGB";
        elsif(vChannelSelect = ch6)then
            displayText      <= "SOBEL";
        elsif(vChannelSelect = ch7)then
            displayText      <= "EMBOS";
        elsif(vChannelSelect = 22)then
            displayText      <= "CGHSL";
        elsif(vChannelSelect = 25)then
            displayText      <= "CGSHP";
        elsif(vChannelSelect = 27)then
            displayText      <= "SHPCG";
        else
            displayText      <= "YCBCR";
        end if;
    end if;
end process videoOutP;


charPosition <= (iCrdDelta(grid.x,location.x)/FONT_WIDTH + 1) when (grid.x >= location.x);

charCode     <= (character'pos(displayText(charPosition))) when (charPosition > zero and charPosition < displayText'LENGTH);
fontAddress  <= (charCode*charCodeLen) + iCrdDelta(grid.y,location.y);
bit_position_enable  <= hi when (grid.x >= location.x - 1) else lo;

dSyncP: process(clk) begin
    if rising_edge(clk) then
        bit_position_sync <= bit_position_enable;
        if (bit_position_sync = hi and bit_position < FONT_WIDTH-1) then
            bit_position  <= bit_position + one;
        else
            bit_position <= zero;
        end if;
    end if;
end process dSyncP;



--process (clk) begin
--if rising_edge(clk) then
--    if (rst_l = lo) then
--        charPosition <= 0;--1
--        bitPosition  <= 0;
--        fontAddress  <= 0;
--    else
--       if (grid.x >= location.x and grid.x <= (location.x + displayText'LENGTH)) and (grid.y >= location.y and grid.y <= (location.y + displayText'LENGTH))then
--        charPosition <= iCrdDelta(grid.x,location.x)/FONT_WIDTH + 1;
--        bitPosition  <= iCrdDelta(grid.x,location.x) mod FONT_WIDTH;
--        fontAddress  <= charCode*16 + iCrdDelta(grid.y,location.y);
--       end if;
--    end if;
--end if;
--end process;

--process (clk) begin
--if rising_edge(clk) then
--    if (rst_l = lo) then
--        charCode     <= 0;
--    else
--        if (charPosition > 0 and charPosition < displayText'LENGTH) then
--            charCode     <= character'pos(displayText(charPosition));
--        end if;
--    end if;
--end if;
--end process;


FontRomInst: FontRom
port map(
    clk     => clk,
    addr    => fontAddress,
    fontRow => charBitInRow);
    
pixelOn: process(clk)
    variable inXRange: boolean := false;
    variable inYRange: boolean := false;
begin
    if rising_edge(clk) then
        inXRange := false;
        inYRange := false;
        pixel   <= lo;
        if grid.x >= location.x and grid.x < location.x + (FONT_WIDTH * displayText'length) then
            inXRange := true;
        end if;
        if grid.y >= location.y and grid.y < location.y + FONT_HEIGHT then
            inYRange := true;
        end if;
        if inXRange and inYRange then
            if charBitInRow((FONT_WIDTH-1)- bit_position) = hi then
                pixel <= hi;
            end if;                    
        end if;
    end if;
end process;
end Behavioral;