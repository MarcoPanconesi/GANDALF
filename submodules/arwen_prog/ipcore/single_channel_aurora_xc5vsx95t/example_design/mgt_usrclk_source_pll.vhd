------------------------------------------------------------------------------/
--$Date: 2009/11/26 05:47:36 $
--$Revision: 1.1 $
------------------------------------------------------------------------------/
--   ____  ____
--  /   /\/   /
-- /___/  \  /
-- \   \   \/     Vendor : Xilinx
--  \   \         Version : 2.1
--  /   /         Application : RocketIO GTP Transceiver Wizard
-- /___/   /\     Filename : mgt_usrclk_source_pll.vhd
-- \   \  /  \
--  \___\/\___\
--
--
-- Module MGT_USRCLK_SOURCE_PLL (for use with GTP Transceivers)
-- Generated by Xilinx RocketIO GTP Transceiver Wizard
-- 
-- 
-- (c) Copyright 2006-2010 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--***********************************Entity Declaration*******************************
entity MGT_USRCLK_SOURCE_PLL is
generic
(
    MULT                : integer           := 2;
    DIVIDE              : integer           := 2;    
    CLK_PERIOD          : real              := 12.86;    
    OUT0_DIVIDE         : integer           := 2;
    OUT1_DIVIDE         : integer           := 2;
    OUT2_DIVIDE         : integer           := 2;
    OUT3_DIVIDE         : integer           := 2;
    SIMULATION_P        : integer           := 1;
    LOCK_WAIT_COUNT     : std_logic_vector  := "1000001000110101"
);
port
( 
    CLK0_OUT           : out std_logic;
    CLK1_OUT           : out std_logic;
    CLK2_OUT           : out std_logic;
    CLK3_OUT           : out std_logic;
    CLK_IN             : in  std_logic;
    PLL_LOCKED_OUT     : out std_logic;
    PLL_RESET_IN       : in  std_logic
);

    attribute X_CORE_INFO : string;
    attribute X_CORE_INFO of MGT_USRCLK_SOURCE_PLL : entity is "v5_gtpwizard_v2_1, Coregen v12.1";

end MGT_USRCLK_SOURCE_PLL;

architecture RTL of MGT_USRCLK_SOURCE_PLL is
--*********************************Wire Declarations**********************************

    signal   tied_to_ground_vec_i :   std_logic_vector(15 downto 0);
    signal   tied_to_ground_i     :   std_logic;
    signal   tied_to_vcc_i        :   std_logic;
    signal   clkout0_i            :   std_logic;
    signal   clkout1_i            :   std_logic;
    signal   clkout2_i            :   std_logic;
    signal   clkout3_i            :   std_logic;    
    signal   clkfbout_i           :   std_logic;
    signal   pll_lk_out           :   std_logic;
    
--*********************************Register Declarations********************************** 
    
    signal   lock_wait_counter    :   std_logic_vector(15 downto 0);
    signal   pll_locked_out_r     :   std_logic;
    signal   time_elapsed         :   std_logic;

begin

--*********************************** Beginning of Code *******************************

    --  Static signal Assigments    
    tied_to_ground_i         <= '0';
    tied_to_ground_vec_i     <= (others=>'0');
    tied_to_vcc_i            <= '1';

    -- Instantiate a DCM module to divide the reference clock. Uses internal feedback
    -- for improved jitter performance, and to avoid consuming an additional BUFG
    pll_adv_i  : PLL_ADV
    generic map
    (
         CLKFBOUT_MULT   =>  MULT,
         DIVCLK_DIVIDE   =>  DIVIDE,
         CLKFBOUT_PHASE  =>  0.0,
         CLKIN1_PERIOD   =>  CLK_PERIOD,
         CLKIN2_PERIOD   =>  10.0,          -- Not used
         CLKOUT0_DIVIDE  =>  OUT0_DIVIDE,
         CLKOUT0_PHASE   =>  0.0,
         CLKOUT1_DIVIDE  =>  OUT1_DIVIDE,
         CLKOUT1_PHASE   =>  0.0,
         CLKOUT2_DIVIDE  =>  OUT2_DIVIDE,
         CLKOUT2_PHASE   =>  0.0,
         CLKOUT3_DIVIDE  =>  OUT3_DIVIDE,
         CLKOUT3_PHASE   =>  0.0         
    )
    port map
    (
         CLKIN1          =>  CLK_IN,
         CLKIN2          =>  tied_to_ground_i,
         CLKINSEL        =>  tied_to_vcc_i,
         CLKFBIN         =>  clkfbout_i,
         CLKOUT0         =>  clkout0_i,
         CLKOUT1         =>  clkout1_i,
         CLKOUT2         =>  clkout2_i,
         CLKOUT3         =>  clkout3_i,
         CLKOUT4         =>  open,
         CLKOUT5         =>  open,
         CLKFBOUT        =>  clkfbout_i,
         CLKFBDCM        =>  open,
         CLKOUTDCM0      =>  open,
         CLKOUTDCM1      =>  open,
         CLKOUTDCM2      =>  open,
         CLKOUTDCM3      =>  open,
         CLKOUTDCM4      =>  open,
         CLKOUTDCM5      =>  open,
         DO              =>  open,
         DRDY            =>  open,
         DADDR           =>  tied_to_ground_vec_i(4 downto 0),
         DCLK            =>  tied_to_ground_i,
         DEN             =>  tied_to_ground_i,
         DI              =>  tied_to_ground_vec_i(15 downto 0),
         DWE             =>  tied_to_ground_i,
         REL             =>  tied_to_ground_i,
         LOCKED          =>  pll_lk_out,
         RST             =>  PLL_RESET_IN
    );
    
    
    clkout0_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK0_OUT, 
        I      =>    clkout0_i
    ); 


    clkout1_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK1_OUT,
        I      =>    clkout1_i
    );
    
    
    clkout2_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK2_OUT, 
        I      =>    clkout2_i
    ); 


    clkout3_bufg_i  :  BUFG   
    port map
    (
        O      =>    CLK3_OUT,
        I      =>    clkout3_i
    );    

    lockwait_count : if SIMULATION_P = 1 generate
    
    -- lock not valid until 100us after PLL is released from reset
    process(CLK_IN, PLL_RESET_IN) 
    begin
        if (PLL_RESET_IN = '1') then
            lock_wait_counter <= "0000000000000000"; 
            pll_locked_out_r <= '0';
            time_elapsed <= '0';
        elsif (CLK_IN'event and CLK_IN = '1') then
            if ((lock_wait_counter = LOCK_WAIT_COUNT) or (time_elapsed = '1')) then
                pll_locked_out_r <= pll_lk_out;
                time_elapsed <= '1';
            else 
                lock_wait_counter <= lock_wait_counter + 1;
            end if;
        end if;
    end process;
    
    PLL_LOCKED_OUT <= pll_locked_out_r;
    
    end generate lockwait_count; -- end SIMULATION_P=1 generate section

    no_lockwait_count : if SIMULATION_P = 0 generate

    PLL_LOCKED_OUT <= pll_lk_out;

    end generate no_lockwait_count; -- End generate for SIMULATION_P  

end RTL;
 
