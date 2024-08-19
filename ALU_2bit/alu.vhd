----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:03 01/15/2023 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( i_a : in  STD_LOGIC;
           i_b : in  STD_LOGIC;
			  i_op : in  STD_LOGIC_VECTOR(1 downto 0);
			  clk2 : in std_logic;
           y : out  STD_LOGIC_VECTOR(6 downto 0);
end alu;
architecture Behavioral of alu is
component regist  
port(Q : out std_logic_vector(1 downto 0);
	  clk : in std_logic;
	  D : in std_logic_vector(1 downto 0)
	  );
end component;
component subtractor 
    Port ( a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           sum0 : out  STD_LOGIC;
           sum1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;
component f2 
    Port ( a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           sum0 : out  STD_LOGIC;
           sum1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;
component multiplication 
  port (A, B : in bit_vector(1 downto 0);
        P : out bit_vector(3 downto 0)
    );
end component;
component mux4_1 
    Port ( S : in  STD_LOGIC_VECTOR (1 downto 0); 
           I : in  STD_LOGIC_VECTOR (3 downto 0); 
           Y : out STD_LOGIC); 

end component;
component regist_4_bit 
port(QQ : out std_logic_vector(3 downto 0);
	  clk1 : in std_logic;
	  DD : in std_logic_vector(3 downto 0)
	  );
end component;
component bcdtoseg 
	port(x : in std_logic_vector (3 downto 0);
		  segs : out std_logic_vector (6 downto 0)
		  );
end component;

signal AA,BB: std_logic_vector(1 downto 0);
signal sub_sig,BB: std_logic_vector(3 downto 0);
begin
sub_sig(3)<='0';
p0: regist port map(D=>i_a,clk=>clk2,Q=>AA);
p1: regist port map(D=>i_a,clk=>clk2,Q=>BB);
p2: subtractor port map(a0=>AA(0),b0=>BB(0),a1=>AA(1),b1=>BB(1),sum0=>sub_sig(0),sum1=>sub_sig(1),cout=>sub_sig(2));
end Behavioral;

