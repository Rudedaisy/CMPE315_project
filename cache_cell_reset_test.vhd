--
-- Entity: cache_cell_reset_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_cell_reset_test is

end cache_cell_reset_test;

architecture test of cache_cell_reset_test is

component cache_cell_reset
  port(d   : in  std_logic;
       w   : in  std_logic;
       r   : in  std_logic;
       rst : in  std_logic;
       q   : out std_logic);
end component;

for cache_cell_reset_1 : cache_cell_reset use entity work.cache_cell_reset(structural);
	signal d, w, r, rst, q	: std_logic;
	signal clock : std_logic;

begin

cache_cell_reset_1 : cache_cell_reset port map (d, w, r, rst, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "cache_cell_reset_in.txt";
	file outfile : text is out "cache_cell_reset_out.txt";
	variable inputs					: std_logic_vector(3 downto 0);	-- [d, w, r, rst]
	variable q_var					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [d, w, r, rst]
		read (buf,inputs);
		d<=inputs(3);
		w<=inputs(2);
		r<=inputs(1);
		rst<=inputs(0);

		wait until falling_edge(clock);

		q_var := q;

		write(buf,q_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;