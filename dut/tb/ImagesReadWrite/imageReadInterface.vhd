library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.constantspackage.all;
use work.vpfrecords.all;
use work.portspackage.all;
entity imageReadInterface is
generic (
    i_data_width       : integer := 8;
    img_frames_cnt_bmp : integer := 2;
    img_width_bmp      : integer := 400;
    img_height_bmp     : integer := 300;
    read_bmp           : string  := "input_image");
port (
    --
    clk                  : in  std_logic;
    reset                : in  std_logic;
    aclk                 : out std_logic;
    --
    m_axis_mm2s_aclk     : in  std_logic;
    m_axis_mm2s_tvalid   : in  std_logic;
    m_axis_mm2s_tdata    : in std_logic_vector(23 downto 0);
    --
    iReadyToRead         : in  std_logic;
    iImageTypeTest       : in  std_logic;
    iRgb                 : in std_logic_vector(23 downto 0);
    ilvalid              : in std_logic;
    ifvalid              : in std_logic;
    --
    valid                : out std_logic;
    red                  : out std_logic_vector(7 downto 0);
    green                : out std_logic_vector(7 downto 0);
    blue                 : out std_logic_vector(7 downto 0);
    --
    rgb                  : out std_logic_vector(23 downto 0);
    lvalid               : out std_logic;
    fvalid               : out std_logic;
    xCord                : out std_logic_vector(11 downto 0);
    yCord                : out std_logic_vector(11 downto 0);
    endOfFrame           : out std_logic);
end imageReadInterface;
architecture Behavioral of imageReadInterface is

    signal   rgbRead             : channel;
    signal   txCord              : coord;
    signal   enableWrite         : std_logic := lo;
    signal   doneWrite           : std_logic := lo;
    signal   mm2rgb              : channel;
    signal   doneTask            : std_logic := lo;
    signal   end_of_frame        : std_logic := lo;
    signal   l_valid             : std_logic := lo;
    signal   f_valid             : std_logic := lo;
begin
    clk_gen(aclk,pixclk_freq);
    rgb                          <= (rgbRead.red & rgbRead.green &  rgbRead.blue) when (iImageTypeTest = lo) else iRgb;
    lvalid                       <= l_valid when (iImageTypeTest = lo) else ilvalid;
    fvalid                       <= f_valid when (iImageTypeTest = lo) else ifvalid;
    
    mm2rgb.valid                 <= m_axis_mm2s_tvalid;
    mm2rgb.red                   <= m_axis_mm2s_tdata(23 downto 16);
    mm2rgb.green                 <= m_axis_mm2s_tdata(15 downto 8);
    mm2rgb.blue                  <= m_axis_mm2s_tdata(7 downto 0);
    
    valid                        <= rgbRead.valid;
    red                          <= rgbRead.red;
    green                        <= rgbRead.green;
    blue                         <= rgbRead.blue;
    xCord                        <= txCord.x(11 downto 0);
    yCord                        <= txCord.y(11 downto 0);
--  enableWrite                  <= hi when (mm2rgb.valid = hi and end_of_frame = hi);
    enableWrite                  <= hi when (mm2rgb.valid = hi);
    doneTask                     <= hi when (iReadyToRead = hi and doneWrite = lo) else lo;
    endOfFrame                   <= hi when (doneWrite = hi) else lo;

ImageReadInst: imageRead
generic map (
    i_data_width          => i_data_width,
    img_frames_cnt_bmp    => img_frames_cnt_bmp,
    img_width_bmp         => img_width_bmp,
    img_height_bmp        => img_height_bmp,
    input_file            => read_bmp)
port map (                  
    clk                   => clk,
    reset                 => reset,
    readyToRead           => doneTask,
    fvalid                => f_valid,
    lvalid                => l_valid,
    oRgb                  => rgbRead,
    oCord                 => txCord,
    endOfFrame            => end_of_frame);
imageWriteInst: imageWrite
generic map (
    enImageText           => false,
    enImageIndex          => false,
    i_data_width          => i_data_width,
    img_width_bmp         => img_width_bmp,
    img_height_bmp        => img_height_bmp,
    input_file            => read_bmp,
    output_file           => read_bmp)
port map (                  
    pixclk                => m_axis_mm2s_aclk,
    enableWrite           => enableWrite,
    doneWrite             => doneWrite,
    iRgb                  => mm2rgb);
end Behavioral;