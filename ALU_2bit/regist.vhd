----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:15 01/14/2023 
-- Design Name: 
-- Module Name:    regist - Behavioral 
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

entity regist is -- 2-bit register
		port(Q : out std_logic_vector(1 downto 0);
			  clk : in std_logic;
	        D : in std_logic_vector(1 downto 0)
	        );
end regist;

architecture Behavioral of regist is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
		Q<=D;
		end if;
	end process;
end behavioral;

