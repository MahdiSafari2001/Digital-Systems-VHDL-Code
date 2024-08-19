----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:41:39 01/14/2023 
-- Design Name: 
-- Module Name:    mux4_1 - Behavioral 
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

entity mux4_1 is
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0); -- selector
           I : in  STD_LOGIC_VECTOR (3 downto 0); -- inputs
           Y : out STD_LOGIC); -- output

end mux4_1;

architecture Behavioral of mux4_1 is

begin

process (S,I)

begin


if (S <= "00") then
Y <= I(0);
elsif (S <= "01") then
Y <= I(1);
elsif (S <= "10") then
Y <= I(2);
else
Y <= I(3);

end if;
end process;
end Behavioral;
