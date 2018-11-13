--
-- Entity: or2_1_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity or2_1_test is

end or2_1_test;

architecture test of or2_1_test is

component or2_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end component;

for or2_1_1 : or2_1 use entity work.or2_1(structural);
	signal input1, input2, input3, output : std_logic;
	signal clock : std_logic;

begin

or2_1_1 : or2_1 port map (input1, input2, output);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "or2_1_in.txt";
	file outfile : text is out "or2_1_out.txt";
	variable inputs					: std_logic_vector(1 downto 0); 
	variable output_var				: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);
		read (buf,inputs);
		input1<=inputs(1);
		input2<=inputs(0);

		wait until falling_edge(clock);

		output_var := output;

		write(buf,output_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;