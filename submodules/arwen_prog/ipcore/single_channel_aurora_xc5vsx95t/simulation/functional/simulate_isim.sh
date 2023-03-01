   
################################################################################
##$Date: 2010/02/02 11:56:47 $
##$Revision: 1.3 $
################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /
## \   \   \/     Vendor : Xilinx
##  \   \         Version : 2.1
##  /   /         Application : RocketIO GTP Transceiver Wizard
## /___/   /\     Filename : simulate_isim.sh
## \   \  /  \
##  \___\/\___\
##
##
## Script SIMULATE_ISIM.SH
## Generated by Xilinx RocketIO GTP Transceiver Wizard
## 
## 
## (c) Copyright 2006-2010 Xilinx, Inc. All rights reserved.
## 
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
## 
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
## 
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
## 
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES. 


##***************************** Beginning of Script ***************************
     
    
    
## Create and map work directory
vlib work
vmap work work

##MGT Wrapper
vhpcomp -work work  ../../../single_channel_aurora_xc5vsx95t_tile.vhd;
vhpcomp -work work  ../../../single_channel_aurora_xc5vsx95t.vhd;


vhpcomp -work work  ../../example_design/mgt_usrclk_source_pll.vhd;


##Example Design modules
vhpcomp -work work  ../../example_design/frame_gen.vhd;
vhpcomp -work work  ../../example_design/frame_check.vhd;
vhpcomp -work work  ../../example_design/single_channel_aurora_xc5vsx95t_top.vhd;
vhpcomp -work work  ../demo_tb.vhd;

##Other modules
vhpcomp -work work ../sim_reset_mgt_model.vhd;

##Load Design
fuse -initfile ${XILINX}/vhdl/hdp/lin/xilinxsim.ini work.DEMO_TB -L unisim -L secureip -o demo_tb.exe

./demo_tb.exe -tclbatch wave_isim.tcl -wdb wave_isim


