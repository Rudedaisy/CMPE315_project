--
-- Entity: cache_cell_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_cell_test is

end cache_cell_test;

architecture test of cache_cell_test is

component cache_cell
  port(d : in  std_logic;
       w : in  std_logic;
       r : in  std_logic;
       q : out std_logic);
end component;

for cache_cell_1 : cache_cell use entity work.cache_cell(structural);
	signal d, w, r, q	: std_logic;
	signal clock : std_logic;

begin

cache_cell_1 : cache_cell port map (d, w, r, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "cache_cell_in.txt";
	file outfile : text is out "cache_cell_out.txt";
	variable inputs					: std_logic_vector(2 downto 0);	-- [d, w, r]
	variable q_var					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [d, w, r]
		read (buf,inputs);
		d<=inputs(2);
		w<=inputs(1);
		r<=inputs(0);

		wait until falling_edge(clock);

		q_var := q;

		write(buf,q_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;