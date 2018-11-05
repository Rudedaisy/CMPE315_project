--
-- Entity: nor4_1_test
-- Architecture : vhdl poop 
-- Author: ehanson1
-- Created On: 09/09/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity nor4_1_test is

end nor4_1_test;

architecture test of nor4_1_test is

component nor4_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end component;

for nor4_1_1: nor4_1 use entity work.nor4_1(structural);

	signal norout, input1, input2, input3, input4 : std_logic;
	signal clock : std_logic;

begin

nor4_1_1 : nor4_1 port map (input1, input2, input3, input4, norout);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	variable norout_sig,input1_sig,input2_sig,input3_sig,input4_sig		: std_logic; 
	variable buf 					: line;

begin
	wait until falling_edge(clock);
	wait until rising_edge(clock);
	
	input1<='0';
	input2<='0';
	input3<='0';
	input4<='0';
	
	wait until falling_edge(clock);
	
	norout_sig := norout;
	
	write(buf,norout_sig);
	writeline(output,buf);

end process io_process;

end test;