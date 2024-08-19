----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:17:53 01/14/2023 
-- Design Name: 
-- Module Name:    segment - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segment is
Port ( B0,B1,B2,B3 : in STD_LOGIC;
A,B,C,D,E,F,G : out STD_LOGIC);
end segment;
 
architecture Behavioral of segment is
 
begin
 
A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);
B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);
C <= B1 OR NOT B2 OR B3;
D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;
E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);
F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);
G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);
 
end Behavioral;



