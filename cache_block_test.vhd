--
-- Entity: cache_block_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_block_test is

end cache_block_test;

architecture test of cache_block_test is

component cache_block
  port(adr : in  std_logic_vector(1 downto 0);
       d   : in  std_logic_vector(7 downto 0);
       w   : in  std_logic;
       r   : in  std_logic;
       q   : out std_logic_vector(7 downto 0));
end component;

for cache_block_1 : cache_block use entity work.cache_block(structural);
	signal adr : std_logic_vector(1 downto 0);
	signal d, q : std_logic_vector(7 downto 0);
	signal w, r	: std_logic;
	signal clock : std_logic;

begin

cache_block_1 : cache_block port map (adr, d, w, r, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "cache_block_in.txt";
	file outfile : text is out "cache_block_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable inputs					: std_logic_vector(1 downto 0);	-- [w, r] or adr
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - adr
		read (buf,inputs);
		adr<=inputs;
		
		readline(infile,buf);	-- line 2 - d
		read (buf,value);
		d<=value;
		
		readline(infile,buf);	-- line 3 - [w, r]
		read (buf,inputs);
		w<=inputs(1);
		r<=inputs(0);

		wait until falling_edge(clock);

		value := q;

		write(buf,value);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;