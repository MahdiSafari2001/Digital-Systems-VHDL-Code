----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:48 11/05/2023 
-- Design Name: 
-- Module Name:    Lookahead - Behavioral 
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

entity Lookahead is
Port (
        A, B : in STD_LOGIC_VECTOR(2 downto 0);
		  Cin: in STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR(2 downto 0);
		  Cout: out STD_LOGIC
    );
end Lookahead;

architecture Behavioral of Lookahead is
signal G : STD_LOGIC_VECTOR(2 downto 0);
signal P : STD_LOGIC_VECTOR(2 downto 0);
signal C1,C2 : STD_LOGIC;
begin
	--carry generate(G) and carry propagate(P) calculation
	G(0) <= A(0) AND B(0);
   P(0) <= A(0) XOR B(0);
	G(1) <= A(1) AND B(1);
   P(1) <= A(1) XOR B(1);
	G(2) <= A(2) AND B(2);
   P(2) <= A(2) XOR B(2);
	--carry calculation
	C1 <= G(0) OR (P(0) AND Cin);
	C2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
	Cout <= P(2) AND P(1) AND P(0) AND Cin;
	--sum calculation
	Sum(0) <= P(0) XOR Cin;
	Sum(1) <= P(1) XOR C1;
	Sum(2) <= P(2) XOR C2;
end Behavioral;

