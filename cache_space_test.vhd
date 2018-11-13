--
-- Entity: cache_space_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity cache_space_test is

end cache_space_test;

architecture test of cache_space_test is

component cache_space
  port(ADDRESS  : in  std_logic_vector(7 downto 0);
       IN_DATA  : in  std_logic_vector(7 downto 0);
       WRITE_EN : in  std_logic;
       READ_EN  : in  std_logic;
       FM       : in  std_logic;
       UPDATE   : in  std_logic;
       RESET    : in  std_logic;
       TMAVL    : out std_logic;
       TMAVR    : out std_logic;
       OUT_DATA : out std_logic_vector(7 downto 0));
end component;

for cache_space_1 : cache_space use entity work.cache_space(structural);
	signal address, in_data, out_data : std_logic_vector(7 downto 0);
	signal write_en, read_en, fm, update, reset, tmavl, tmavr	: std_logic;
	signal clock : std_logic;

begin

cache_space_1 : cache_space port map (address, in_data, write_en, read_en, fm, update, reset, tmavl, tmavr, out_data);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "cache_space_in.txt";
	file outfile : text is out "cache_space_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable controls				: std_logic_vector(4 downto 0);	-- [write_en, read_en, fm, update, reset]
	variable outputs				: std_logic_vector(1 downto 0); -- [tmavl, tmavr]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - address
		read (buf,value);
		address<=value;
		
		readline(infile,buf);	-- line 2 - in_data
		read (buf,value);
		in_data<=value;
		
		readline(infile,buf);	-- line 3 - [write_en, read_en, fm, update, reset]
		read (buf,controls);
		write_en<=controls(4);
		read_en<=controls(3);
		fm<=controls(2);
		update<=controls(1);
		reset<=controls(0);

		wait until falling_edge(clock);

		outputs(1) := tmavl;
		outputs(0) := tmavr;
		write(buf,outputs);
		writeline(outfile,buf);
		
		value := out_data;
		write(buf,value);
		writeline(outfile,buf);
		
		write (buf, string'(" ----------------------------------------------"));
		writeline(outfile, buf);
		
	end if;

end process io_process;

end test;