--
-- Entity: mux2_1_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux2_1_test is

end mux2_1_test;

architecture test of mux2_1_test is

component mux2_1
	port (
		input1	 : in  std_logic;
		input2	 : in  std_logic;
		sel		 : in  std_logic;
		output   : out std_logic);
end component;

for mux2_1_1 : mux2_1 use entity work.mux2_1(structural);
	signal input1, input2, sel	: std_logic;
	signal output : std_logic;
	signal clock : std_logic;

begin

mux2_1_1 : mux2_1 port map (input1, input2, sel, output);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "mux2_1_in.txt";
	file outfile : text is out "mux2_1_out.txt";
	variable inputs					: std_logic_vector(2 downto 0); -- [input1, input2, sel]
	variable out_sig				: std_logic;	
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- [input1, input2, sel]
		read (buf,inputs);
		input1<=inputs(2);
		input2<=inputs(1);
		sel<=inputs(0);

		wait until falling_edge(clock);

		out_sig := output;

		write(buf,out_sig);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;