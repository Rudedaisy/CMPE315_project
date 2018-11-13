--
-- Entity: tag_block_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity tag_block_test is

end tag_block_test;

architecture test of tag_block_test is

component tag_block
  port(d : in  std_logic_vector(2 downto 0);
       w : in  std_logic;
       r : in  std_logic;
       q : out std_logic_vector(2 downto 0));
end component;

for tag_block_1 : tag_block use entity work.tag_block(structural);
	signal d, q : std_logic_vector(2 downto 0);
	signal w, r	: std_logic;
	signal clock : std_logic;

begin

tag_block_1 : tag_block port map (d, w, r, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "tag_block_in.txt";
	file outfile : text is out "tag_block_out.txt";
	variable tag					: std_logic_vector(2 downto 0);
	variable inputs					: std_logic_vector(1 downto 0);	-- [w, r]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - tag
		read (buf,tag);
		d<=tag;
		
		readline(infile,buf);	-- line 2 - [w, r]
		read (buf,inputs);
		w<=inputs(1);
		r<=inputs(0);

		wait until falling_edge(clock);

		tag := q;

		write(buf,tag);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;