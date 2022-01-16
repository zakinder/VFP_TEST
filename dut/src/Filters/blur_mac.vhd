--02092019 [02-09-2019]
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_package.all;
use work.vpf_records.all;
use work.ports_package.all;
entity blur_mac is
port (
    clk            : in std_logic;
    rst_l          : in std_logic;
    vTap0x         : in std_logic_vector(7 downto 0);
    vTap1x         : in std_logic_vector(7 downto 0);
    vTap2x         : in std_logic_vector(7 downto 0);
    DataO          : out std_logic_vector(11 downto 0));
end entity;
architecture arch of blur_mac is
---------------------------------------------------------------------------------
    constant i_data_width : integer := 8;
    type detap is record
        vTap0x  : unsigned(i_data_width downto 0);
        vTap1x  : unsigned(i_data_width downto 0);
        vTap2x  : unsigned(i_data_width downto 0);
    end record;
    type s_pixel is record
        m1      : unsigned (16 downto 0);
        m2      : unsigned (16 downto 0);
        m3      : unsigned (16 downto 0);
        mac     : unsigned (i_data_width+3 downto 0);
    end record;
---------------------------------------------------------------------------------
    signal mac1X       : s_pixel;
    signal mac2X       : s_pixel;
    signal mac3X       : s_pixel;
    signal tpd1        : detap;
    signal tpd2        : detap;
    signal tpd3        : detap;
    signal Data        : unsigned(i_data_width+3 downto 0);
---------------------------------------------------------------------------------
begin
  TAP_DELAY : process (clk) begin

    if rising_edge(clk) then
    if rst_l = '0' then
        tpd1.vTap0x    <= (others => '0');
        tpd1.vTap1x    <= (others => '0');
        tpd1.vTap2x    <= (others => '0');
        tpd2.vTap0x    <= (others => '0');
        tpd2.vTap1x    <= (others => '0');
        tpd2.vTap2x    <= (others => '0'); 
        tpd3.vTap0x    <= (others => '0');
        tpd3.vTap1x    <= (others => '0');
        tpd3.vTap2x    <= (others => '0');
    else
       tpd1.vTap0x     <= unsigned('0' & vTap0x);
       tpd1.vTap1x     <= unsigned('0' & vTap1x);
       tpd1.vTap2x     <= unsigned('0' & vTap2x);
       tpd2.vTap0x     <= tpd1.vTap0x;
       tpd2.vTap1x     <= tpd1.vTap1x;
       tpd2.vTap2x     <= tpd1.vTap2x;
       tpd3.vTap0x     <= tpd2.vTap0x;
       tpd3.vTap1x     <= tpd2.vTap1x;
       tpd3.vTap2x     <= tpd2.vTap2x;
    end if;
    end if;
  end process TAP_DELAY;
  --1st Row Pixels
  MAC_X_A : process (clk) begin
    if rising_edge(clk) then
		mac1X.m1    <= (tpd1.vTap0x * blur_macKernel_9);--1st Row 1st pixel
		mac1X.m2    <= (tpd2.vTap0x * blur_macKernel_8);--1st Row 2nd pixel
		mac1X.m3    <= (tpd3.vTap0x * blur_macKernel_7);--1st Row 3rd pixel
		mac1X.mac   <= mac1X.m1(i_data_width+3 downto 0) + mac1X.m2(i_data_width+3 downto 0) + mac1X.m3(i_data_width+3 downto 0);
    end if;
  end process MAC_X_A;
  MAC_X_B : process (clk) begin
    if rising_edge(clk) then
		mac2X.m1    <= (tpd1.vTap1x * blur_macKernel_6);--2nd Row 1st pixel
		mac2X.m2    <= (tpd2.vTap1x * blur_macKernel_5);--2nd Row 2nd pixel
		mac2X.m3    <= (tpd3.vTap1x * blur_macKernel_4);--2nd Row 3rd pixel
		mac2X.mac   <= mac2X.m1(i_data_width+3 downto 0) + mac2X.m2(i_data_width+3 downto 0) + mac2X.m3(i_data_width+3 downto 0);
    end if;
  end process MAC_X_B;
  MAC_X_C : process (clk) begin
    if rising_edge(clk) then
		mac3X.m1    <= (tpd1.vTap2x * blur_macKernel_3);--3rd Row 1st pixel
		mac3X.m2    <= (tpd2.vTap2x * blur_macKernel_2);--3rd Row 2nd pixel
		mac3X.m3    <= (tpd3.vTap2x * blur_macKernel_1);--3rd Row 3rd pixel
		mac3X.mac   <= mac3X.m1(i_data_width+3 downto 0) + mac3X.m2(i_data_width+3 downto 0) + mac3X.m3(i_data_width+3 downto 0);
    end if;
  end process MAC_X_C;
  PA_X : process (clk, rst_l) begin
    if rst_l = '0' then
		Data <= (others => '0');
    elsif rising_edge(clk) then
		Data <= mac1X.mac + mac2X.mac + mac3X.mac;
    end if;
  end process PA_X;
  DataO <= std_logic_vector(Data(11 downto 0));
end architecture;