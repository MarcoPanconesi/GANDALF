--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.2
--  \   \         Application : xaw2vhdl
--  /   /         Filename : clock_pll.vhd
-- /___/   /\     Timestamp : 02/08/2011 11:42:09
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-st I:/xilinxProjects/svn_checkout/trunk/GbaseDesign/ipcore_dir/clock_pll.xaw I:/xilinxProjects/svn_checkout/trunk/GbaseDesign/ipcore_dir/clock_pll
--Design Name: clock_pll
--Device: xc5vsx95t-2ff1136
--
-- Module clock_pll
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST
-- For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT0 = 0.255 ns
-- For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT2 = 0.207 ns
-- For block PLL_ADV_INST, Estimated PLL Jitter for CLKOUT3 = 0.182 ns

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clock_pll is
   port ( CLKIN1_IN  : in    std_logic; 
          RST_IN     : in    std_logic; 
          CLK_40MHZ  : out   std_logic; 
          CLK_120MHZ : out   std_logic; 
		  CLK_200MHZ : out   std_logic; 
          CLK_240MHZ : out   std_logic; 
          LOCKED_OUT : out   std_logic);
end clock_pll;

architecture BEHAVIORAL of clock_pll is
   signal CLKFBOUT_CLKFBIN : std_logic;
   signal CLKOUT0_BUF      : std_logic;
   signal CLKOUT1_BUF      : std_logic;	
   signal CLKOUT2_BUF      : std_logic;
   signal CLKOUT3_BUF      : std_logic;
   signal GND_BIT          : std_logic;
   signal GND_BUS_5        : std_logic_vector (4 downto 0);
   signal GND_BUS_16       : std_logic_vector (15 downto 0);
   signal VCC_BIT          : std_logic;
begin
   GND_BIT <= '0';
   GND_BUS_5(4 downto 0) <= "00000";
   GND_BUS_16(15 downto 0) <= "0000000000000000";
   VCC_BIT <= '1';
   CLKOUT0_BUFG_INST : BUFG
      port map (I=>CLKOUT0_BUF,
                O=>CLK_40MHZ);
					 
   CLKOUT1_BUFG_INST : BUFG
      port map (I=>CLKOUT1_BUF,
                O=>CLK_200MHZ);					 
   
   CLKOUT2_BUFG_INST : BUFG
      port map (I=>CLKOUT2_BUF,
                O=>CLK_120MHZ);
   
   CLKOUT3_BUFG_INST : BUFG
      port map (I=>CLKOUT3_BUF,
                O=>CLK_240MHZ);
   
   PLL_ADV_INST : PLL_ADV
   generic map( 
   			BANDWIDTH => "OPTIMIZED",
            CLKIN1_PERIOD => 25.000,
            CLKIN2_PERIOD => 10.000,
            CLKOUT0_DIVIDE => 30,
			CLKOUT1_DIVIDE => 6,
            CLKOUT2_DIVIDE => 10,
            CLKOUT3_DIVIDE => 5,
            CLKOUT0_PHASE => 0.000,
			CLKOUT1_PHASE => 0.000,
            CLKOUT2_PHASE => 0.000,
            CLKOUT3_PHASE => 0.000,
            CLKOUT0_DUTY_CYCLE => 0.500,
			CLKOUT1_DUTY_CYCLE => 0.500,
            CLKOUT2_DUTY_CYCLE => 0.500,
            CLKOUT3_DUTY_CYCLE => 0.500,
            COMPENSATION => "SYSTEM_SYNCHRONOUS",
            DIVCLK_DIVIDE => 1,
            CLKFBOUT_MULT => 30,
            CLKFBOUT_PHASE => 0.0,
            REF_JITTER => 0.04             -- era 0.00500
            
--    		BANDWIDTH => "OPTIMIZED",
--            CLKIN1_PERIOD => 25.000,
--            CLKIN2_PERIOD => 10.000,
--            CLKOUT0_DIVIDE => 12,
--            CLKOUT2_DIVIDE => 4,
--            CLKOUT3_DIVIDE => 2,
--            CLKOUT0_PHASE => 0.000,
--            CLKOUT2_PHASE => 0.000,
--            CLKOUT3_PHASE => 0.000,
--            CLKOUT0_DUTY_CYCLE => 0.500,
--            CLKOUT2_DUTY_CYCLE => 0.500,
--            CLKOUT3_DUTY_CYCLE => 0.500,
--            COMPENSATION => "SYSTEM_SYNCHRONOUS",
--            DIVCLK_DIVIDE => 1,
--            CLKFBOUT_MULT => 12,
--            CLKFBOUT_PHASE => 0.0,
--            REF_JITTER => 0.000       
--            
            )
      port map (CLKFBIN=>CLKFBOUT_CLKFBIN,
                CLKINSEL=>VCC_BIT,
                CLKIN1=>CLKIN1_IN,
                CLKIN2=>GND_BIT,
                DADDR(4 downto 0)=>GND_BUS_5(4 downto 0),
                DCLK=>GND_BIT,
                DEN=>GND_BIT,
                DI(15 downto 0)=>GND_BUS_16(15 downto 0),
                DWE=>GND_BIT,
                REL=>GND_BIT,
                RST=>RST_IN,
                CLKFBDCM=>open,
                CLKFBOUT=>CLKFBOUT_CLKFBIN,
                CLKOUTDCM0=>open,
                CLKOUTDCM1=>open,
                CLKOUTDCM2=>open,
                CLKOUTDCM3=>open,
                CLKOUTDCM4=>open,
                CLKOUTDCM5=>open,
                CLKOUT0=>CLKOUT0_BUF,
                CLKOUT1=>CLKOUT1_BUF,
                CLKOUT2=>CLKOUT2_BUF,
                CLKOUT3=>CLKOUT3_BUF,
                CLKOUT4=>open,
                CLKOUT5=>open,
                DO=>open,
                DRDY=>open,
                LOCKED=>LOCKED_OUT);
   
end BEHAVIORAL;


