--
-- Entity: dlatch_reset_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity dlatch_reset_test is

end dlatch_reset_test;

architecture test of dlatch_reset_test is

component dlatch_reset
  port(d    : in  std_logic;
       clk  : in  std_logic;
       rst  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

for dlatch_reset_1 : dlatch_reset use entity work.dlatch_reset(structural);
	signal d, rst, q, qbar	: std_logic;
	signal clock : std_logic;

begin

dlatch_reset_1 : dlatch_reset port map (d, clock, rst, q, qbar);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "dlatch_reset_in.txt";
	file outfile : text is out "dlatch_reset_out.txt";
	variable inputs					: std_logic_vector(1 downto 0);	-- [d, rst]
	variable outputs				: std_logic_vector(1 downto 0);	-- [q, qbar]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [d, rst]
		read (buf,inputs);
		d<=inputs(1);
		rst<=inputs(0);

		outputs(1) := q;
		outputs(0) := qbar;
		write(buf,outputs);
		writeline(outfile,buf);
		
		wait until falling_edge(clock);

		outputs(1) := q;
		outputs(0) := qbar;
		
		write(buf,outputs);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;