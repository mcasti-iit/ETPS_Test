----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2020 12:32:36
-- Design Name: 
-- Module Name: ETDP_Test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;

library unisim;
   use unisim.vcomponents.all;
   
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use ieee.numeric_std.all;

-- entity ETDP_Test is
entity fmchc_python1300c_wrapper is
	port (                                                                                    -- ETDP net name    -- *** PYTHON CHIP SIDE *************************************************
    -- Pyhton Right                                                                         -- Pyhton Right     -- * PIN              DIR     FUNCTION
    R_DATA0_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP0_S0        -- * doutn0           Output  LVDS Data Output Channel #0 (Positive)
    R_DATA0_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN0_S0        -- * doutn0           Output  LVDS Data Output Channel #0 (Negative)
    R_DATA1_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP1_S0        -- * doutn0           Output  LVDS Data Output Channel #1 (Positive)
    R_DATA1_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN1_S0        -- * doutn0           Output  LVDS Data Output Channel #1 (Negative)
    R_DATA2_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP2_S0        -- * doutn0           Output  LVDS Data Output Channel #2 (Positive)
    R_DATA2_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN2_S0        -- * doutn0           Output  LVDS Data Output Channel #2 (Negative)
    R_DATA3_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP3_S0        -- * doutn0           Output  LVDS Data Output Channel #3 (Positive)
    R_DATA3_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN3_S0        -- * doutn0           Output  LVDS Data Output Channel #3 (Negative)
    R_SYNC_P            : in  std_logic;  -- Sync data from sensor                          -- SYNCP_S0         -- * syncp            Output  LVDS Sync Channel Output (Positive)
    R_SYNC_N            : in  std_logic;  -- Sync data from sensor                          -- SYNCN_S0         -- * syncn            Output  LVDS Sync Channel Output (Negative)
    R_DATA_CLKIN_P      : in  std_logic;  -- Input clock (p) for data and sync              -- CLK_OUTP_S0      -- * clock_outp       Output  LVDS Clock Output (Positive)
    R_DATA_CLKIN_N      : in  std_logic;  -- Input clock (n) for data and sync              -- CLK_OUTN_S0      -- * clock_outn       Output  LVDS Clock Output (Negative)
                                                                                                                -- *   
--    R_LVDS_CLKOUT_P     : out std_logic;  -- LVDS Clock output (p) for Python Chip          -- LVDS_CLKINP_S0   -- * lvds_clock_inp   Input   LVDS Clock Input (Positive)
--    R_LVDS_CLKOUT_N     : out std_logic;  -- LVDS Clock output (n) for Python Chip          -- LVDS_CLKINN_S0   -- * lvds_clock_inn   Input   LVDS Clock Input (Negative)
    R_CMOS_CLKOUT       : out std_logic;  -- CMOS Clock output for Python Chip              -- CLK_PLL_S0_ADJ   -- * clk_pll          Input   Reference Clock Input for PLL
    R_TRIGGER0          : out std_logic;  -- Trigger signal 0 for Pyhton                    -- TRIGGER0_S0_ADJ  -- * trigger0         Input   Trigger Input #0
    R_RSTOUT_N          : out std_logic;  -- reset signal for Python                        -- RST_S0_ADJ       -- * reset_n          Input   Sensor Reset (Active Low)
    R_MON0              : in  std_logic;  -- Monitor signal 0 from Python                   -- MON0_S0_ADJ      -- * monitor0         Output  Monitor Output #0
    R_MON1              : in  std_logic;  -- Monitor signal 1 from Python                   -- MON1_S0_ADJ      -- * monitor1         Output  Monitor Output #1
    R_SPARE_PYE         : out std_logic;  -- SPARE                                          -- SPARE_PYE_S0_ADJ -- *   
    R_SCK               : out std_logic;  -- SPI Clock                                      -- SCK_S0_ADJ       -- * sck              Input   SPI Clock
    R_MOSI              : out std_logic;  -- SPI Data output                                -- MOSI_S0_ADJ      -- * mosi             Input   SPI Master Out - Slave In
    R_MISO              : in  std_logic;  -- SPI Data input                                 -- MISO_S0_ADJ      -- * miso             Output  SPI Master In - Slave Out
    R_SEL_N             : out std_logic;  -- SPI Sel (active low)                           -- NSEL_S0_ADJ      -- * ss_n             Input   SPI Slave Select (Active Low)

    R_SPARE_TP          : out std_logic;  -- Spare Test Point (before buffer)               -- SPARE_TP_S0         
    R_SPARE_BUF         : out std_logic;  -- Spare Test Point (after buffer)                -- SPARE_BUF_S0_ADJ    
    R_OE_N              : out std_logic;  -- Output Enable for Output Buffer                -- OEn_S0              
    R_OE1_N             : out std_logic;  -- Output Enable for Input Buffer                 -- OE1n_S0             
    R_OE2_N             : out std_logic;  -- Output Enable for Input Buffer                 -- OE2n_S0             
    R_CMOS_CLKOUT_GND   : out std_logic;  -- Ground pair for CLK_PLL_S0 (510 ohm pulldown)  -- CLK_PLL_S0_GND      
    R_SCK_GND           : out std_logic;  -- Ground pair for SCK_S0 (510 ohm pulldown)      -- SCK_S0_GND          
    R_DIR_OB            : out std_logic;  -- Direction for Output Buffer                    -- DIR_S0              
    R_DIR1_IB           : out std_logic;  -- Direction for Input Buffer                     -- DIR1_S0             
    R_DIR2_IB           : out std_logic;  -- Direction for Input Buffer                     -- DIR2_S0             

    -- Pyhton Left                                                                          -- -- Pyhton Left      -- * PIN              DIR     FUNCTION
--    L_DATA0_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP0_S1           -- * doutn0           Output  LVDS Data Output Channel #0 (Positive)
--    L_DATA0_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN0_S1           -- * doutn0           Output  LVDS Data Output Channel #0 (Negative)
--    L_DATA1_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP1_S1           -- * doutn0           Output  LVDS Data Output Channel #1 (Positive)
--    L_DATA1_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN1_S1           -- * doutn0           Output  LVDS Data Output Channel #1 (Negative)
--    L_DATA2_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP2_S1           -- * doutn0           Output  LVDS Data Output Channel #2 (Positive)
--    L_DATA2_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN2_S1           -- * doutn0           Output  LVDS Data Output Channel #2 (Negative)
--    L_DATA3_P           : in  std_logic;  -- Image data from sensor                         -- DOUTP3_S1           -- * doutn0           Output  LVDS Data Output Channel #3 (Positive)
--    L_DATA3_N           : in  std_logic;  -- Image data from sensor                         -- DOUTN3_S1           -- * doutn0           Output  LVDS Data Output Channel #3 (Negative)
--    L_SYNC_P            : in  std_logic;  -- Sync data from sensor                          -- SYNCP_S1            -- * syncp            Output  LVDS Sync Channel Output (Positive)
--    L_SYNC_N            : in  std_logic;  -- Sync data from sensor                          -- SYNCN_S1            -- * syncn            Output  LVDS Sync Channel Output (Negative)
--    L_DATA_CLKIN_P      : out std_logic;  -- Input clock (p) for data and sync              -- CLK_OUTP_S1         -- * clock_outp       Output  LVDS Clock Output (Positive)
--    L_DATA_CLKIN_N      : out std_logic;  -- Input clock (n) for data and sync              -- CLK_OUTN_S1         -- * clock_outn       Output  LVDS Clock Output (Negative)
--                                                                                                          
--    L_LVDS_CLKOUT_P     : out std_logic;  -- LVDS Clock output (p) for Python Chip          -- LVDS_CLKINP_S1      -- * lvds_clock_inp   Input   LVDS Clock Input (Positive)
--    L_LVDS_CLKOUT_N     : out std_logic;  -- LVDS Clock output (n) for Python Chip          -- LVDS_CLKINN_S1      -- * lvds_clock_inn   Input   LVDS Clock Input (Negative)
--    L_CMOS_CLKOUT       : out std_logic;  -- CMOS Clock output for Python Chip              -- CLK_PLL_S1_ADJ      -- * clk_pll          Input   Reference Clock Input for PLL
--    L_TRIGGER0          : out std_logic;  -- Trigger signal 0 for Pyhton                    -- TRIGGER0_S1_ADJ     -- * trigger0         Input   Trigger Input #0
--    L_RSTOUT_N          : out std_logic;  -- reset signal for Python                        -- RST_S1_ADJ          -- * reset_n          Input   Sensor Reset (Active Low)
--    L_MON0              : in  std_logic;  -- Monitor signal 0 from Python                   -- MON0_S1_ADJ         -- * monitor0         Output  Monitor Output #0
--    L_MON1              : in  std_logic;  -- Monitor signal 1 from Python                   -- MON1_S1_ADJ         -- * monitor1         Output  Monitor Output #1
--    L_SPARE_PYE         : out std_logic;  -- SPARE                                          -- SPARE_PYE_S1_ADJ    -- *   
--    L_SCK               : out std_logic;  -- SPI Clock                                      -- SCK_S1_ADJ          -- * sck              Input   SPI Clock
--    L_MOSI              : out std_logic;  -- SPI Data output                                -- MOSI_S1_ADJ         -- * mosi             Input   SPI Master Out - Slave In
--    L_MISO              : in  std_logic;  -- SPI Data input                                 -- MISO_S1_ADJ         -- * miso             Output  SPI Master In - Slave Out
--    L_SEL_N             : out std_logic;  -- SPI Sel (active low)                           -- NSEL_S1_ADJ         -- * ss_n             Input   SPI Slave Select (Active Low)
--
--    L_SPARE_TP          : out std_logic;  -- Spare Test Point (before buffer)               -- SPARE_TP_SI         
--    L_SPARE_BUF         : out std_logic;  -- Spare Test Point (after buffer)                -- SPARE_BUF_S1_ADJ    
--    L_OE_N              : out std_logic;  -- Output Enable for Output Buffer                -- OEn_S1              
--    L_OE1_N             : out std_logic;  -- Output Enable for Input Buffer                 -- OE1n_S1             
--    L_OE2_N             : out std_logic;  -- Output Enable for Input Buffer                 -- OE2n_S1             
--    L_CMOS_CLKOUT_GND   : out std_logic;  -- Ground pair for CLK_PLL_S0 (510 ohm pulldown)  -- CLK_PLL_S1_GND      
--    L_SCK_GND           : out std_logic;  -- Ground pair for SCK_S0 (510 ohm pulldown)      -- SCK_S1_GND          
--    L_DIR_OB            : out std_logic;  -- Direction for Output Buffer                    -- DIR_S1              
--    L_DIR1_IB           : out std_logic;  -- Direction for Input Buffer                     -- DIR1_S1             
--    L_DIR2_IB           : out std_logic;  -- Direction for Input Buffer                     -- DIR2_S1             
    
    -- DDR
    DDR_addr            : inout std_logic_vector ( 14 downto 0 );
    DDR_ba              : inout std_logic_vector ( 2 downto 0 );
    DDR_cas_n           : inout std_logic;
    DDR_ck_n            : inout std_logic;
    DDR_ck_p            : inout std_logic;
    DDR_cke             : inout std_logic;
    DDR_cs_n            : inout std_logic;
    DDR_dm              : inout std_logic_vector ( 3 downto 0 );
    DDR_dq              : inout std_logic_vector ( 31 downto 0 );
    DDR_dqs_n           : inout std_logic_vector ( 3 downto 0 );
    DDR_dqs_p           : inout std_logic_vector ( 3 downto 0 );
    DDR_odt             : inout std_logic;
    DDR_ras_n           : inout std_logic;
    DDR_reset_n         : inout std_logic;
    DDR_we_n            : inout std_logic;
    
    -- FIXED I/O
    FIXED_IO_ddr_vrn    : inout std_logic;
    FIXED_IO_ddr_vrp    : inout std_logic;
    FIXED_IO_mio        : inout std_logic_vector ( 53 downto 0 );
    FIXED_IO_ps_clk     : inout std_logic;
    FIXED_IO_ps_porb    : inout std_logic;
    FIXED_IO_ps_srstb   : inout std_logic
		);
end fmchc_python1300c_wrapper;

architecture Behavioral of fmchc_python1300c_wrapper is

component ETDP_Test_bd_wrapper is
  port (
    CAM_clk_out_n : in STD_LOGIC;
    CAM_clk_out_p : in STD_LOGIC;
    CAM_clk_pll : out STD_LOGIC;
    CAM_data_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CAM_data_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CAM_monitor : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CAM_reset_n : out STD_LOGIC;
    CAM_sync_n : in STD_LOGIC;
    CAM_sync_p : in STD_LOGIC;
    CAM_trigger : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXIS_0_tlast : out STD_LOGIC;
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tuser : out STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    SPI_spi_miso : in STD_LOGIC;
    SPI_spi_mosi : out STD_LOGIC;
    SPI_spi_sclk : out STD_LOGIC;
    SPI_spi_ssel_n : out STD_LOGIC;
    m_axis_aclk : out STD_LOGIC
  );
end component;

signal CAM_data_n  : STD_LOGIC_VECTOR ( 3 downto 0 );
signal CAM_data_p  : STD_LOGIC_VECTOR ( 3 downto 0 );
signal CAM_monitor : STD_LOGIC_VECTOR ( 1 downto 0 );
signal CAM_reset_n : STD_LOGIC;
signal CAM_sync_n  : STD_LOGIC;
signal CAM_sync_p  : STD_LOGIC;
signal CAM_trigger : STD_LOGIC_VECTOR ( 2 downto 0 );


begin


-- ibufgds_1_i : IBUFGDS 
--   port map (
--     O => ,
--     I => ,
--     IB => 
--     );
-- 
-- obufds_1_i: OBUFDS
--   port map (
--     I => ,
--     O => ,
--     OB => 
--     );


                                                                                                                -- *   
                 
R_OE_N            <=  '0'; -- : out std_logic;  -- Output Enable for Output Buffer                -- OEn_S0              
R_OE1_N           <=  '0'; -- : out std_logic;  -- Output Enable for Input Buffer                 -- OE1n_S0             
R_OE2_N           <=  '0'; -- : out std_logic;  -- Output Enable for Input Buffer                 -- OE2n_S0             
R_CMOS_CLKOUT_GND <=  '0'; -- : out std_logic;  -- Ground pair for CLK_PLL_S0 (510 ohm pulldown)  -- CLK_PLL_S0_GND      
R_SCK_GND         <=  '0'; -- : out std_logic;  -- Ground pair for SCK_S0 (510 ohm pulldown)      -- SCK_S0_GND          
R_DIR_OB          <=  '1'; -- : out std_logic;  -- Direction for Output Buffer                    -- DIR_S0              
R_DIR1_IB         <=  '0'; -- : out std_logic;  -- Direction for Input Buffer                     -- DIR1_S0             
R_DIR2_IB         <=  '0'; -- : out std_logic;  -- Direction for Input Buffer                     -- DIR2_S0  
R_SPARE_PYE       <=  '0'; -- : out std_logic;  -- SPARE                                       -- SPARE_PYE_S0_ADJ -- *   
R_SPARE_TP        <=  '0'; -- : out std_logic;  -- Spare Test Point (before buffer)            -- SPARE_TP_S0         
R_SPARE_BUF       <=  '0'; -- : out std_logic;  -- Spare Test Point (after buffer)             -- SPARE_BUF_S0_ADJ    

CAM_data_n <= R_DATA3_N & R_DATA2_N & R_DATA1_N & R_DATA0_N;
CAM_data_p <= R_DATA3_P & R_DATA2_P & R_DATA1_P & R_DATA0_P;
CAM_monitor <= R_MON1 & R_MON0;
R_TRIGGER0 <= CAM_trigger(0);

ETDP_Test_bd : ETDP_Test_bd_wrapper 
  port map (
    CAM_clk_out_n       => R_DATA_CLKIN_N   , -- in STD_LOGIC;
    CAM_clk_out_p       => R_DATA_CLKIN_P   , -- in STD_LOGIC;
    CAM_clk_pll         => R_CMOS_CLKOUT    , -- out STD_LOGIC;
    CAM_data_n          => CAM_data_n       , -- in STD_LOGIC_VECTOR ( 3 downto 0 );
    CAM_data_p          => CAM_data_p       , -- in STD_LOGIC_VECTOR ( 3 downto 0 );
    CAM_monitor         => CAM_monitor      , -- in STD_LOGIC_VECTOR ( 1 downto 0 );
    CAM_reset_n         => R_RSTOUT_N       , -- out STD_LOGIC;
    CAM_sync_n          => R_SYNC_N         , -- in STD_LOGIC;
    CAM_sync_p          => R_SYNC_P         , -- in STD_LOGIC;
    CAM_trigger         => CAM_trigger      , -- out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr            => DDR_addr         , -- inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba              => DDR_ba           , -- inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n           => DDR_cas_n        , -- inout STD_LOGIC;
    DDR_ck_n            => DDR_ck_n         , -- inout STD_LOGIC;
    DDR_ck_p            => DDR_ck_p         , -- inout STD_LOGIC;
    DDR_cke             => DDR_cke          , -- inout STD_LOGIC;
    DDR_cs_n            => DDR_cs_n         , -- inout STD_LOGIC;
    DDR_dm              => DDR_dm           , -- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq              => DDR_dq           , -- inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n           => DDR_dqs_n        , -- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p           => DDR_dqs_p        , -- inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt             => DDR_odt          , -- inout STD_LOGIC;
    DDR_ras_n           => DDR_ras_n        , -- inout STD_LOGIC;
    DDR_reset_n         => DDR_reset_n      , -- inout STD_LOGIC;
    DDR_we_n            => DDR_we_n         , -- inout STD_LOGIC;
    FIXED_IO_ddr_vrn    => FIXED_IO_ddr_vrn , -- inout STD_LOGIC;
    FIXED_IO_ddr_vrp    => FIXED_IO_ddr_vrp , -- inout STD_LOGIC;
    FIXED_IO_mio        => FIXED_IO_mio     , -- inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk     => FIXED_IO_ps_clk  , -- inout STD_LOGIC;
    FIXED_IO_ps_porb    => FIXED_IO_ps_porb , -- inout STD_LOGIC;
    FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb, -- inout STD_LOGIC;
    M_AXIS_0_tdata      => open, -- out STD_LOGIC_VECTOR ( 15 downto 0 );
    M_AXIS_0_tlast      => open, -- out STD_LOGIC;
    M_AXIS_0_tready     => '0', -- in STD_LOGIC;
    M_AXIS_0_tuser      => open, -- out STD_LOGIC;
    M_AXIS_0_tvalid     => open, -- out STD_LOGIC;
    SPI_spi_miso        => R_MISO, -- in STD_LOGIC;
    SPI_spi_mosi        => R_MOSI, -- out STD_LOGIC;
    SPI_spi_sclk        => R_SCK, -- out STD_LOGIC;
    SPI_spi_ssel_n      => R_SEL_N, -- out STD_LOGIC;
    m_axis_aclk         => open  -- out STD_LOGIC
  );

end Behavioral;
