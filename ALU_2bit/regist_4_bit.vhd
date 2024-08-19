----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:15:00 01/15/2023 
-- Design Name: 
-- Module Name:    regist_4_bit - Behavioral 
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

entity regist_4_bit is -- 4-bit register
	port(QQ : out std_logic_vector(3 downto 0);
		  clk1 : in std_logic;
		  DD : in std_logic_vector(3 downto 0)
	     );
end regist_4_bit;

architecture Behavioral of regist_4_bit is
begin
	process(clk1)
	begin
		if(rising_edge(clk1)) then
		QQ<=DD;
		end if;
	end process;
end behavioral;