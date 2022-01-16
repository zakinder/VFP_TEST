library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_package.all;
use work.vpf_records.all;
use work.ports_package.all;
entity Kernel is
generic (
    INRGB_FRAME        : boolean := false;
    RGBLP_FRAME        : boolean := false;
    RGBTR_FRAME        : boolean := false;
    SHARP_FRAME        : boolean := false;
    BLURE_FRAME        : boolean := false;
    EMBOS_FRAME        : boolean := false;
    YCBCR_FRAME        : boolean := false;
    SOBEL_FRAME        : boolean := false;
    CGAIN_FRAME        : boolean := false;
    CCGAIN_FRAME       : boolean := false;
    HSV_FRAME          : boolean := false;
    HSL_FRAME          : boolean := false;
    img_width          : integer := 2751;
    img_height         : integer := 4096;
    s_data_width       : integer := 16;
    i_data_width       : integer := 8);
port (
    clk                : in std_logic;
    rst_l              : in std_logic;
    lumThreshold       : in std_logic_vector(i_data_width-1 downto 0);
    iThreshold         : in std_logic_vector(15 downto 0); 
    txCord             : in coord;
    iRgb               : in channel;
    iFilterId          : in std_logic_vector(b_data_width-1 downto 0);
    oKcoeff            : out kernelCoeff;
    iKcoeff            : in kernelCoeff;
    oEdgeValid         : out std_logic;
    oRgb               : out colors);
end Kernel;
architecture Behavioral of Kernel is
    signal rgbSyncValid    : std_logic_vector(63 downto 0)  := x"0000000000000000";
    signal rgbMac1         : channel := (valid => lo, red => black, green => black, blue => black);
    signal rgbMac2         : channel := (valid => lo, red => black, green => black, blue => black);
    signal rgbMac3         : channel := (valid => lo, red => black, green => black, blue => black);
    constant init_channel  : channel := (valid => lo, red => black, green => black, blue => black);
    signal kCoProd         : kCoefFiltFloat;
begin
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--coef_mult
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
CoefMultInst: coef_mult
port map (
    clk            => clk,
    rst_l          => rst_l,
    iKcoeff        => iKcoeff,
    iFilterId      => iFilterId,
    oKcoeff        => oKcoeff,
    oCoeffProd     => kCoProd);
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--rgbSync
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
process (clk) begin
    if rising_edge(clk) then
        rgbSyncValid(0)   <= iRgb.valid;
        rgbSyncValid(1)   <= rgbSyncValid(0);
        rgbSyncValid(2)   <= rgbSyncValid(1);
        rgbSyncValid(3)   <= rgbSyncValid(2);
        rgbSyncValid(4)   <= rgbSyncValid(3);
        rgbSyncValid(5)   <= rgbSyncValid(4);
        rgbSyncValid(6)   <= rgbSyncValid(5);
        rgbSyncValid(7)   <= rgbSyncValid(6);
        rgbSyncValid(8)   <= rgbSyncValid(7);
        rgbSyncValid(9)   <= rgbSyncValid(8);
        rgbSyncValid(10)  <= rgbSyncValid(9);
        rgbSyncValid(11)  <= rgbSyncValid(10);
        rgbSyncValid(12)  <= rgbSyncValid(11);
        rgbSyncValid(13)  <= rgbSyncValid(12);
        rgbSyncValid(14)  <= rgbSyncValid(13);
        rgbSyncValid(15)  <= rgbSyncValid(14);
        rgbSyncValid(16)  <= rgbSyncValid(15);
        rgbSyncValid(17)  <= rgbSyncValid(16);
        rgbSyncValid(18)  <= rgbSyncValid(17);
        rgbSyncValid(19)  <= rgbSyncValid(18);
        rgbSyncValid(20)  <= rgbSyncValid(19);
        rgbSyncValid(21)  <= rgbSyncValid(20);
        rgbSyncValid(22)  <= rgbSyncValid(21);
        rgbSyncValid(23)  <= rgbSyncValid(22);
        rgbSyncValid(24)  <= rgbSyncValid(23);
        rgbSyncValid(25)  <= rgbSyncValid(24);
        rgbSyncValid(26)  <= rgbSyncValid(25);
        rgbSyncValid(27)  <= rgbSyncValid(26);
        rgbSyncValid(28)  <= rgbSyncValid(27);
        rgbSyncValid(29)  <= rgbSyncValid(28);
        rgbSyncValid(30)  <= rgbSyncValid(29);
        rgbSyncValid(31)  <= rgbSyncValid(30);
        rgbSyncValid(32)  <= rgbSyncValid(31);
        rgbSyncValid(33)  <= rgbSyncValid(32);
        rgbSyncValid(34)  <= rgbSyncValid(33);
        rgbSyncValid(35)  <= rgbSyncValid(34);
        rgbSyncValid(36)  <= rgbSyncValid(35);
        rgbSyncValid(37)  <= rgbSyncValid(36);
        rgbSyncValid(38)  <= rgbSyncValid(37);
        rgbSyncValid(39)  <= rgbSyncValid(38);
        rgbSyncValid(40)  <= rgbSyncValid(39);
        rgbSyncValid(41)  <= rgbSyncValid(40);
        rgbSyncValid(42)  <= rgbSyncValid(41);
        rgbSyncValid(43)  <= rgbSyncValid(42);
        rgbSyncValid(44)  <= rgbSyncValid(43);
        rgbSyncValid(45)  <= rgbSyncValid(44);
        rgbSyncValid(46)  <= rgbSyncValid(45);
        rgbSyncValid(47)  <= rgbSyncValid(46);
        rgbSyncValid(48)  <= rgbSyncValid(47);
        rgbSyncValid(49)  <= rgbSyncValid(48);
        rgbSyncValid(50)  <= rgbSyncValid(49);
        rgbSyncValid(51)  <= rgbSyncValid(50);
        rgbSyncValid(52)  <= rgbSyncValid(51);
        rgbSyncValid(53)  <= rgbSyncValid(52);
        rgbSyncValid(54)  <= rgbSyncValid(53);
        rgbSyncValid(55)  <= rgbSyncValid(54);
        rgbSyncValid(56)  <= rgbSyncValid(55);
        rgbSyncValid(57)  <= rgbSyncValid(56);
        rgbSyncValid(58)  <= rgbSyncValid(57);
        rgbSyncValid(59)  <= rgbSyncValid(58);
        rgbSyncValid(60)  <= rgbSyncValid(59);
        rgbSyncValid(61)  <= rgbSyncValid(60);
        rgbSyncValid(62)  <= rgbSyncValid(61);
        rgbSyncValid(63)  <= rgbSyncValid(62);
    end if; 
end process;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--taps_controller
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
TPDATAWIDTH3_ENABLED: if ((SHARP_FRAME = TRUE) or (BLURE_FRAME = TRUE) or (EMBOS_FRAME = TRUE)) generate
    signal tp0        : std_logic_vector(23 downto 0) := (others => '0');
    signal tp1        : std_logic_vector(23 downto 0) := (others => '0');
    signal tp2        : std_logic_vector(23 downto 0) := (others => '0');
    signal tpValid    : std_logic  := lo;
begin
TapsControllerInst: taps_controller
generic map(
    img_width    => img_width,
    tpDataWidth  => 24)
port map(
    clk          => clk,
    rst_l        => rst_l,
    iRgb         => iRgb,
    tpValid      => tpValid,
    tp0          => tp0,
    tp1          => tp1,
    tp2          => tp2);
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac1.red   <= (others => '0');
        rgbMac1.green <= (others => '0');
        rgbMac1.blue  <= (others => '0');
        rgbMac1.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac1.red   <= tp0(23 downto 16);
        rgbMac1.green <= tp1(23 downto 16);
        rgbMac1.blue  <= tp2(23 downto 16);
        rgbMac1.valid <= tpValid;
    end if; 
end process;
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac2.red   <= (others => '0');
        rgbMac2.green <= (others => '0');
        rgbMac2.blue  <= (others => '0');
        rgbMac2.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac2.red   <= tp0(15 downto 8);
        rgbMac2.green <= tp1(15 downto 8);
        rgbMac2.blue  <= tp2(15 downto 8);
        rgbMac2.valid <= tpValid;
    end if; 
end process;
process (clk,rst_l) begin
    if (rst_l = lo) then
        rgbMac3.red   <= (others => '0');
        rgbMac3.green <= (others => '0');
        rgbMac3.blue  <= (others => '0');
        rgbMac3.valid <= lo;
    elsif rising_edge(clk) then 
        rgbMac3.red   <= tp0(7 downto 0);
        rgbMac3.green <= tp1(7 downto 0);
        rgbMac3.blue  <= tp2(7 downto 0);
        rgbMac3.valid <= tpValid;
    end if; 
end process;
end generate TPDATAWIDTH3_ENABLED;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: YCBCR
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
YCBCR_FRAME_ENABLE: if (YCBCR_FRAME = true) generate
signal ycbcr       : channel;
signal ycbcrSyn    : channel;
signal kCoeffYcbcr : kernelCoeDWord;
begin
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoeffYcbcr.kSet = kCoefYcbcrIndex) then
            kCoeffYcbcr <= kCoProd.kCoeffYcbcr;
        end if;
    end if; 
end process;
Kernel_Ycbcr_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => YCBCR_FRAME,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => iRgb,
    kCoeff         => kCoeffYcbcr,
    oRgb           => ycbcr);
    ycbcrSyn.red     <=  ycbcr.red;
    ycbcrSyn.blue    <=  ycbcr.blue;
    ycbcrSyn.green   <=  ycbcr.green;
    ycbcrSyn.valid   <=  rgbSyncValid(9);
SyncFramesInst: sync_frames
generic map (
    pixelDelay   => 6)
port map(            
    clk      => clk,
    reset    => rst_l,
    iRgb     => ycbcrSyn,
    oRgb     => oRgb.ycbcr);
end generate YCBCR_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: CGAIN
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
CGAIN_FRAME_ENABLE: if (CGAIN_FRAME = true or CCGAIN_FRAME = true) generate
signal c1gain          : channel;
signal cgain1Syn       : channel;
signal cgain2Syn       : channel;
signal c2gain          : channel;
signal kCofC1gain      : kernelCoeDWord;
signal kCofC2gain      : kernelCoeDWord;
begin
CGAIN_FRAME_KSET_ENABLE: if (CGAIN_FRAME = true and CCGAIN_FRAME = false) generate
kCoeffCgainP:process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoeffCgain.kSet = kCoefCgainIndex) then
            kCofC1gain <= kCoProd.kCoeffCgain;
        end if;
    end if; 
end process kCoeffCgainP;
Kernel1CgainInst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => CGAIN_FRAME,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => iRgb,
    kCoeff         => kCofC1gain,
    oRgb           => c1gain);
    cgain1Syn.red   <=  c1gain.red;
    cgain1Syn.blue  <=  c1gain.blue;
    cgain1Syn.green <=  c1gain.green;
    cgain1Syn.valid <=  rgbSyncValid(28);--rgbSyncValid(9);
SyncFramesInst: sync_frames
generic map (
    pixelDelay   => 6)
port map(            
    clk      => clk,
    reset    => rst_l,
    iRgb     => cgain1Syn,
    oRgb     => oRgb.cgain);
end generate CGAIN_FRAME_KSET_ENABLE;
CCGAIN_FRAME_KSET_ENABLE: if (CGAIN_FRAME = false and CCGAIN_FRAME = true) generate
kCoeffCcgainP:process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoef1Cgain.kSet = kCoefCgai1Index) then
            kCofC2gain <= kCoProd.kCoef1Cgain;
        end if;
    end if;
end process kCoeffCcgainP;
Kernel2CgainInst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => CGAIN_FRAME,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => iRgb,
    kCoeff         => kCofC2gain,
    oRgb           => c2gain);
    cgain2Syn.red   <=  c2gain.red;
    cgain2Syn.blue  <=  c2gain.blue;
    cgain2Syn.green <=  c2gain.green;
    cgain2Syn.valid <=  rgbSyncValid(9);
SyncFramesInst: sync_frames
generic map (
    pixelDelay   => 6)
port map(            
    clk      => clk,
    reset    => rst_l,
    iRgb     => cgain2Syn,
    oRgb     => oRgb.cgain);
end generate CCGAIN_FRAME_KSET_ENABLE;
end generate CGAIN_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: SHARP
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
SHARP_FRAME_ENABLE: if (SHARP_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffSharp    : kernelCoeDWord;
begin
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoeffSharp.kSet = kCoefSharpIndex) then
            kCoeffSharp <= kCoProd.kCoeffSharp;
        end if;
    end if; 
end process;
Kernel_Sharp_Red_Inst: kernel_core
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffSharp,
    oRgb           => oRed);
Kernel_Sharp_Green_Inst: kernel_core
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffSharp,
    oRgb           => oGreen);
Kernel_Sharp_Blue_Inst: kernel_core
generic map(
    SHARP_FRAME   => SHARP_FRAME,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffSharp,
    oRgb           => oBlue);
    oRgb.sharp.red    <=  oRed.red;
    oRgb.sharp.green  <=  oGreen.red;
    oRgb.sharp.blue   <=  oBlue.red;
    oRgb.sharp.valid  <=  rgbSyncValid(34);--rgbSyncValid(9);
end generate SHARP_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: BLURE
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
BLURE_FRAME_ENABLE: if (BLURE_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffBlure    : kernelCoeDWord;
begin
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoeffBlure.kSet = kCoefBlureIndex) then
            kCoeffBlure <= kCoProd.kCoeffBlure;
        end if;
    end if; 
end process;
Kernel_Blur_Red_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffBlure,
    oRgb           => oRed);
Kernel_Blur_Green_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffBlure,
    oRgb           => oGreen);
Kernel_Blur_Blue_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => BLURE_FRAME,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffBlure,
    oRgb           => oBlue);
    oRgb.blur.red    <=  oRed.red;
    oRgb.blur.green  <=  oGreen.red;
    oRgb.blur.blue   <=  oBlue.red;
    oRgb.blur.valid  <=  rgbSyncValid(39);--rgbSyncValid(14);
end generate BLURE_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: EMBOS
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
EMBOS_FRAME_ENABLE: if (EMBOS_FRAME = true) generate
signal oRed           : channel;
signal oGreen         : channel;
signal oBlue          : channel;
signal kCoeffEmbos    : kernelCoeDWord;
begin
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoeffEmbos.kSet = kCoefEmbosIndex) then
            kCoeffEmbos <= kCoProd.kCoeffEmbos;
        end if;
    end if; 
end process;
Kernel_Blur_Red_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac1,
    kCoeff         => kCoeffEmbos,
    oRgb           => oRed);
Kernel_Blur_Green_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac2,
    kCoeff         => kCoeffEmbos,
    oRgb           => oGreen);
Kernel_Blur_Blue_Inst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => EMBOS_FRAME,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => false,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => rgbMac3,
    kCoeff         => kCoeffEmbos,
    oRgb           => oBlue);
    oRgb.embos.red    <=  oRed.red;
    oRgb.embos.green  <=  oGreen.red;
    oRgb.embos.blue   <=  oBlue.red;
    oRgb.embos.valid  <=  rgbSyncValid(36);--rgbSyncValid(11);
end generate EMBOS_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: SOBEL
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
SOBEL_FRAME_ENABLE: if (SOBEL_FRAME = true) generate
-----------------------------------------------------------------------------------------------
signal osobelX        : channel;
signal osobelY        : channel;
signal sobel          : channel;
signal kCoefXSobel    : kernelCoeDWord;
signal kCoefYSobel    : kernelCoeDWord;
signal mx             : unsigned(15 downto 0)         := (others => '0');
signal my             : unsigned(15 downto 0)         := (others => '0');
signal sxy            : unsigned(15 downto 0)         := (others => '0');
signal sqr            : std_logic_vector(31 downto 0) := (others => '0');
signal sbof           : std_logic_vector(31 downto 0) := (others => '0');
signal sobelThreshSet : std_logic_vector(15 downto 0) :=x"006E"; --006E
signal sobelThreshold : unsigned(15 downto 0)         :=x"0000";
signal tp0            : std_logic_vector(7 downto 0)  := (others => '0');
signal tp1            : std_logic_vector(7 downto 0)  := (others => '0');
signal tp2            : std_logic_vector(7 downto 0)  := (others => '0');
signal tpValid        : std_logic := lo;
signal ovalid         : std_logic := lo;
begin
-----------------------------------------------------------------------------------------------
-- taps_controller
-----------------------------------------------------------------------------------------------
TapsControllerInst: taps_controller
generic map(
    img_width    => img_width,
    tpDataWidth  => 8)
port map(
    clk          => clk,
    rst_l        => rst_l,
    iRgb         => iRgb,
    tpValid      => tpValid,
    tp0          => tp0,
    tp1          => tp1,
    tp2          => tp2);
-----------------------------------------------------------------------------------------------
-- Taps To Rgb
-----------------------------------------------------------------------------------------------
    sobel.red   <= tp0;
    sobel.green <= tp1;
    sobel.blue  <= tp2;
    sobel.valid <= tpValid;
-----------------------------------------------------------------------------------------------
-- Coeff Init Updates
-----------------------------------------------------------------------------------------------
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoefXSobel.kSet = kCoefSobeXIndex) then
            kCoefXSobel <= kCoProd.kCoefXSobel;
        end if;
    end if; 
end process;
process (clk) begin
    if (rising_edge (clk)) then
        if (kCoProd.kCoefYSobel.kSet = kCoefSobeYIndex) then
            kCoefYSobel <= kCoProd.kCoefYSobel;
        end if;
    end if; 
end process;
KernelSobelXInst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => SOBEL_FRAME,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => sobel,
    kCoeff         => kCoefXSobel,
    oRgb           => osobelX);
KernelSobelYInst: kernel_core
generic map(
    SHARP_FRAME   => false,
    BLURE_FRAME   => false,
    EMBOS_FRAME   => false,
    YCBCR_FRAME   => false,
    SOBEL_FRAME   => SOBEL_FRAME,
    CGAIN_FRAME   => false,
    img_width     => img_width,
    i_data_width  => i_data_width)
port map(
    clk            => clk,
    rst_l          => rst_l,
    iRgb           => sobel,
    kCoeff         => kCoefYSobel,
    oRgb           => osobelY);
sobelDomainsValueP:process (clk) begin
    if rising_edge(clk) then
        mx  <= (unsigned(osobelX.red) * unsigned(osobelX.red));
        my  <= (unsigned(osobelY.red) * unsigned(osobelY.red));
    end if;
end process sobelDomainsValueP;
sumValueP:process (clk) begin
    if rising_edge(clk) then
        sxy <= (mx + my);
    end if;
end process sumValueP;
squareRootValueP:process (clk) begin
    if rising_edge(clk) then
        sqr <= std_logic_vector(resize(unsigned(sxy), sqr'length));
    end if;
end process squareRootValueP;
squareRootTopInst: squareRootTop
port map(
    clk        => clk,
    ivalid     => rgbSyncValid(14),
    idata      => sqr,
    ovalid     => ovalid,
    odata      => sbof);
    sobelThreshold <= unsigned(std_logic_vector(sbof(15 downto 0)));
    sobelThreshSet <= iThreshold;
sobelOutP:process (clk) begin
    if rising_edge(clk) then
        if (sobelThreshold > unsigned(sobelThreshSet)) then
            oEdgeValid       <= hi;
            oRgb.sobel.red   <= black;
            oRgb.sobel.green <= black;
            oRgb.sobel.blue  <= black;
        else
            oEdgeValid       <= lo;
            oRgb.sobel.red   <= white;
            oRgb.sobel.green <= white;
            oRgb.sobel.blue  <= white;
        end if;
            oRgb.sobel.valid <= rgbSyncValid(63);--rgbSyncValid(15);
    end if;
end process sobelOutP;
end generate SOBEL_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: RGB
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
INRGB_FRAME_ENABLE: if (INRGB_FRAME = true) generate
begin
    oRgb.inrgb <= iRgb;
end generate INRGB_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: HSV
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
HSV_FRAME_ENABLE: if (HSV_FRAME = true) generate
    signal hsvColor    : hsvChannel;
begin
hsvInst: hsv_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oHsv               => hsvColor);
    oRgb.hsv.red       <= hsvColor.h;
    oRgb.hsv.green     <= hsvColor.s;
    oRgb.hsv.blue      <= hsvColor.v;
    oRgb.hsv.valid     <= hsvColor.valid;
end generate HSV_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: HSL
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
HSL_FRAME_ENABLE: if (HSL_FRAME = true) generate
signal hslColor    : channel;
begin
hslInst: hsl_c
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oHsl               => hslColor);
    oRgb.hsl            <= hslColor;
end generate HSL_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: RGBTRIM
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
RGBTRIM_FRAME_ENABLE: if (RGBTR_FRAME = true) generate
begin
ColorTrimInst: color_trim
generic map(
    i_data_width       => i_data_width)
port map(   
    clk                => clk,
    reset              => rst_l,
    iRgb               => iRgb,
    oRgb               => oRgb.colorTrm);
end generate RGBTRIM_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FILTERS: RGBLUMP
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
RGBLUMP_FRAME_ENABLE: if (RGBLP_FRAME = true) generate
begin
SegmentColorsInst: segment_colors
port map(   
    clk                => clk,
    reset              => rst_l,
    lumThreshold       => lumThreshold,
    iRgb               => iRgb,
    oRgb               => oRgb.colorLmp);
end generate RGBLUMP_FRAME_ENABLE;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--FRAMES_DISABLED
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
RGBLUMP_FRAME_DISABLED: if (RGBLP_FRAME = false) generate
    oRgb.colorLmp   <= init_channel;
end generate RGBLUMP_FRAME_DISABLED;
RGBTRIM_FRAME_DISABLED: if (RGBTR_FRAME = false) generate
    oRgb.colorTrm   <= init_channel;
end generate RGBTRIM_FRAME_DISABLED;
INRGB_FRAME_DISABLED: if (INRGB_FRAME = false) generate
    oRgb.inrgb   <= init_channel;
end generate INRGB_FRAME_DISABLED;
YCBCR_FRAME_DISABLED: if (YCBCR_FRAME = false) generate
    oRgb.ycbcr   <= init_channel;
end generate YCBCR_FRAME_DISABLED;
SHARP_FRAME_DISABLED: if (SHARP_FRAME = false) generate
    oRgb.sharp   <= init_channel;
end generate SHARP_FRAME_DISABLED;
BLURE_FRAME_DISABLED: if (BLURE_FRAME = false) generate
    oRgb.blur  <= init_channel;
end generate BLURE_FRAME_DISABLED;
EMBOS_FRAME_DISABLED: if (EMBOS_FRAME = false) generate
    oRgb.embos   <= init_channel;
end generate EMBOS_FRAME_DISABLED;
SOBEL_FRAME_DISABLED: if (SOBEL_FRAME = false) generate
    oRgb.sobel   <= init_channel;
end generate SOBEL_FRAME_DISABLED;
CGAIN_FRAME_DISABLED: if (CGAIN_FRAME = false) generate
    oRgb.cgain   <= init_channel;
end generate CGAIN_FRAME_DISABLED;
HSL_FRAME_DISABLED: if (HSL_FRAME = false) generate
    oRgb.hsl     <= init_channel;
end generate HSL_FRAME_DISABLED;
HSV_FRAME_DISABLED: if (HSV_FRAME = false) generate
    oRgb.hsv     <= init_channel;
end generate HSV_FRAME_DISABLED;
end Behavioral;