----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:13:36 01/15/2023 
-- Design Name: 
-- Module Name:    subtractor - Behavioral 
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

entity subtractor is
    Port ( a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           sum0 : out  STD_LOGIC;
           sum1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end subtractor;

architecture Behavioral of subtractor is
component full_addder
port(a,b,c: in std_logic;
sum,carry: out std_logic);
end component;
signal c11,s00,s11,coo,temp,temp1: std_logic; 
begin
temp<= (not b0);
temp1<= (not b1);
y1: full_addder port map(a=>a0,b=>temp,c=>'1',sum=>s00,carry=>c11);
y2: full_addder port map(a=>a1,b=>temp1,c=>c11,sum=>s11,carry=>coo);
sum0<=s00;
sum1<=s11;
cout<=coo;
end Behavioral;

