--
-- Entity: inv_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity inv_test is

end inv_test;

architecture test of inv_test is

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

for inv_1 : inv use entity work.inv(structural);
	signal input, output : std_logic;
	signal clock : std_logic;

begin

inv_1 : inv port map (input, output);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "inv_in.txt";
	file outfile : text is out "inv_out.txt";
	variable input_var				: std_logic; 
	variable output_var				: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);
		read (buf,input_var);
		input<=input_var;

		wait until falling_edge(clock);

		output_var := output;

		write(buf,output_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;