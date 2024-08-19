----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:50 01/15/2023 
-- Design Name: 
-- Module Name:    alu_2_bit - Behavioral 
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

entity alu_2_bit is
	port(i_a,i_b: in std_logic_vector(1 downto 0); -- inputs
		  i_op: in std_logic_vector(1 downto 0); -- selector
		  clk2: in std_logic;
		  seven: out std_logic_vector(6 downto 0) -- seven segment output
        );		  
end alu_2_bit;

architecture Behavioral of alu_2_bit is
component regist is -- 2-bit register
port(Q : out std_logic_vector(1 downto 0);
	  clk : in std_logic;
	  D : in std_logic_vector(1 downto 0)
	  );
end component;
component regist_4_bit is -- 4-bit register
	port(QQ : out std_logic_vector(3 downto 0);
		  clk1 : in std_logic;
		  DD : in std_logic_vector(3 downto 0)
	     );
end component;
component f2 is
    Port ( Cin : in  STD_LOGIC;
			  a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           sum0 : out  STD_LOGIC;
           sum1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;
component multiplication is 
  port (A, B : in bit_vector(1 downto 0);
        P : out bit_vector(3 downto 0)
    );
end component;
component bcdtoseg is
	port(x : in std_logic_vector (3 downto 0);
		  segs : out std_logic_vector (6 downto 0)
		  );
end component;

signal AA,BB: std_logic_vector(1 downto 0);
signal reg4_sig: std_logic_vector(3 downto 0); -- inputs to the 4-bit register
signal reg_4_sig: std_logic_vector(3 downto 0); -- outputs of the 4-bit register
signal seven1: std_logic_vector(6 downto 0);
begin
p0: regist port map(Q=>AA,clk=>clk2,D=>i_a); --REG1
p1: regist port map(Q=>BB,clk=>clk2,D=>i_b); --REG2
process(clk2,i_op)
	begin
	if (clk2'event and clk2='1') then
		case i_op is
				when "00" => --i_a - i_b
				  p2: f2 port map(Cin=>'1',a0=>AA(0),b0=>(not BB(0)),a1=>AA(1),b1=>(not BB(1)),sum0=>reg4_sig(0),sum1=>reg4_sig(1),cout=>reg4_sig(2));
				  reg4_sig(3)<='0';
		      when "01" => -- AND bit by bit
				  reg4_sig(0)<=AA(0) and BB(0); reg4_sig(1)<=AA(1) and BB(1); reg4_sig(2)<='0'; reg4_sig(3)<='0';
				when "10" => --i_a + i_b
				  p3: f2 port map(Cin=>'0',a0=>AA(0),b0=> BB(0),a1=>AA(1),b1=> BB(1),sum0=>reg4_sig(0),sum1=>reg4_sig(1),cout=>reg4_sig(2));
				  reg4_sig(3)<='0';
				when others => --i_a * i_b
				  p4: multiplication port map(A=>AA,B=>BB,P=>reg4_sig);
		end case;
	end if;
end process;
p5: regist_4_bit port map(QQ=>reg_4_sig,clk1=>clk2,DD=>reg4_sig);
p6: bcdtoseg port map(x=>reg_4_sig,segs=>seven1);
seven<=seven1;
end Behavioral;

