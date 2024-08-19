----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:27 01/14/2023 
-- Design Name: 
-- Module Name:    multiplication - Behavioral 
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

entity multiplication is 
  port (A, B : in bit_vector(1 downto 0);
        P : out bit_vector(3 downto 0)
    );
end multiplication;

architecture behavioral of multiplication is
begin
	process(A,B) is
	begin
		case A is
			when "00" =>
				if B="00" then P<="0000";
				elsif B="01" then P<="0000";
				elsif B="10" then P<="0000";
				else P<="0000";
				end if;
			when "01" =>
				if B="00" then P<="0000";
				elsif B="01" then P<="0001";
				elsif B="10" then P<="0010";
				else P<="0011";
				end if;
			when "10" =>
				if B="00" then P<="0000";
				elsif B="01" then P<="0010";
				elsif B="10" then P<="0100";
				else P<="0110";
				end if;
			when "11" =>
				if B="00" then P<="0000";
				elsif B="01" then P<="0011";
				elsif B="10" then P<="0110";
				else P<="1001";
				end if;
		end case;
end process;
end architecture;

