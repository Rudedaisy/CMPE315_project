--
-- Entity: comp3x2_1_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity comp3x2_1_test is

end comp3x2_1_test;

architecture test of comp3x2_1_test is

component comp3x2_1
  port(input1 : in  std_logic_vector(2 downto 0);
       input2 : in  std_logic_vector(2 downto 0);
       output : out std_logic);
end component;

for comp3x2_1_1 : comp3x2_1 use entity work.comp3x2_1(structural);
	signal input1, input2 : std_logic_vector(2 downto 0);
	signal output : std_logic;
	signal clock : std_logic;

begin

comp3x2_1_1 : comp3x2_1 port map (input1, input2, output);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "comp3x2_1_in.txt";
	file outfile : text is out "comp3x2_1_out.txt";
	variable input_var				: std_logic_vector(2 downto 0);
	variable output_var				: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - input1
		read (buf,input_var);
		input1<=input_var;
		
		readline(infile,buf);	-- line 2 - input2
		read (buf,input_var);
		input2<=input_var;

		wait until falling_edge(clock);

		output_var := output;

		write(buf,output_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;