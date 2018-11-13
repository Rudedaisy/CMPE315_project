--
-- Entity: tag_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity tag_test is

end tag_test;

architecture test of tag_test is

component tag
  port(IN_TAG    : in  std_logic_vector(2 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_TAG : in  std_logic;
       TAG_MATCH : out std_logic);
end component;

for tag_1 : tag use entity work.tag(structural);
	signal in_tag : std_logic_vector(2 downto 0);
	signal block_sel : std_logic_vector(7 downto 0);
	signal cache_en, write_tag, tag_match	: std_logic;
	signal clock : std_logic;

begin

tag_1 : tag port map (in_tag, block_sel, cache_en, write_tag, tag_match);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "tag_in.txt";
	file outfile : text is out "tag_out.txt";
	variable tag					: std_logic_vector(2 downto 0);
	variable block_sel_var			: std_logic_vector(7 downto 0);
	variable inputs					: std_logic_vector(1 downto 0);	-- [cache_en, write_tag]
	variable tag_match_var			: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - block_sel
		read (buf,block_sel_var);
		block_sel<=block_sel_var;
		
		readline(infile,buf);	-- line 2 - tag
		read (buf,tag);
		in_tag<=tag;
		
		readline(infile,buf);	-- line 3 - [cache_en, write_tag]
		read (buf,inputs);
		cache_en<=inputs(1);
		write_tag<=inputs(0);

		wait until falling_edge(clock);

		tag_match_var := tag_match;

		write(buf,tag_match_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;