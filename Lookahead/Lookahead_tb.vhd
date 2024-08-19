--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:35:53 11/05/2023
-- Design Name:   
-- Module Name:   C:/Users/asus/Desktop/My Project/MyProject/Lookahead_tb.vhd
-- Project Name:  MyProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lookahead
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Lookahead_tb IS
END Lookahead_tb;
 
ARCHITECTURE behavior OF Lookahead_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lookahead
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(2 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(2 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lookahead PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc1: process
   begin		
   wait for 200 ns;
	A(0) <= not A(0); 
   end process;
	
	 stim_proc2: process
   begin		
   wait for 150 ns;
	A(1) <= not A(1); 
   end process;
	
	 stim_proc3: process
   begin		
   wait for 100 ns;
	A(2) <= not A(2); 
   end process;
	
	 stim_proc4: process
   begin		
   wait for 50 ns;
	B(0) <= not B(0); 
   end process;
	
	 stim_proc5: process
   begin		
   wait for 25 ns;
	B(1) <= not B(1); 
   end process;
	
	 stim_proc6: process
   begin		
   wait for 12.5 ns;
	B(2) <= not B(2); 
   end process;
	
	 stim_proc7: process
   begin		
   wait for 100 ns;
	Cin <= not Cin; 
   end process;
END;
