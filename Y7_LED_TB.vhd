--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:43:57 03/11/2024
-- Design Name:   
-- Module Name:   F:/Y777/Y7_LED_TB.vhd
-- Project Name:  Y777
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Y7_LED
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- WEEK2
-- Y7 LED ON
-- 2학년 2반 2021041080 정승현
 
ENTITY Y7_LED_TB IS
END Y7_LED_TB;
 
ARCHITECTURE behavior OF Y7_LED_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Y7_LED
    PORT(
         y7 : OUT  std_logic
        );
    END COMPONENT;
    

 	--Outputs
   signal y7 : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Y7_LED PORT MAP (
          y7 => y7
        );



END;
