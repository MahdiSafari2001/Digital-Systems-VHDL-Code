----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:00:43 12/15/2022 
-- Design Name: 
-- Module Name:    bcd_adder - Behavioral 
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

entity bcd_adder is
    Port ( x0 : in  STD_LOGIC;
           y0 : in  STD_LOGIC;
           x1  : in  STD_LOGIC;
           y1 : in  STD_LOGIC;
           x2 : in  STD_LOGIC;
           y2  : in  STD_LOGIC;
           x3 : in  STD_LOGIC;
           y3 : in  STD_LOGIC;
           Cinn1 : in  STD_LOGIC; -- the input carry to the first 4-bit adder
           Coutt1 : out  STD_LOGIC; -- the output carry of 'OR' gate
			  Coutt2 : out  STD_LOGIC; -- the output carry of the second 4-bit adder
           s11 : out  STD_LOGIC;
           s22 : out  STD_LOGIC;
           s44 : out  STD_LOGIC;
           s88 : out  STD_LOGIC);
end bcd_adder;

architecture Behavioral of bcd_adder is
component f4 
    Port ( cin : in  STD_LOGIC;
           a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           a2 : in  STD_LOGIC;
           b2 : in  STD_LOGIC;
           a3 : in  STD_LOGIC;
           b3 : in  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s3 : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;
signal Z1,Z2,Z4,Z8,Carrry,couttt1: std_logic; -- 'Carry' is the output carry of the first 4-bit adder
begin

e1: f4 port map(cin=>Cinn1,a0=>x0,b0=>y0,a1=>x1,b1=>y1,a2=>x2,b2=>y2,a3=>x3,b3=>y3,s0=>Z1,s1=>Z2,s2=>Z4,s3=>Z8,co=>Carrry);
couttt1 <= (Carrry) or (Z4 and Z8) or (Z1 and Z8);
e2: f4 port map(cin=>'0',a0=>Z1,b0=>Z2,a1=>Z4,b1=>Z8,a2=>'0',b2=>couttt1,a3=>couttt1,b3=>'0',s0=>s11,s1=>s22,s2=>s44,s3=>s88,co=>Coutt2);
Coutt1<=couttt1;
end Behavioral;


