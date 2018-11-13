--
-- Entity: cache_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_test is

end cache_test;

architecture test of cache_test is

component cache
  port(BYTE_ADR  : in  std_logic_vector(1 downto 0);
       IN_DATA   : in  std_logic_vector(7 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_EN  : in  std_logic;
       READ_EN   : in  std_logic;
       OUT_DATA  : out std_logic_vector(7 downto 0));
end component;

for cache_1 : cache use entity work.cache(structural);
	signal byte_adr : std_logic_vector(1 downto 0);
	signal in_data, out_data, block_sel : std_logic_vector(7 downto 0);
	signal cache_en, write_en, read_en	: std_logic;
	signal clock : std_logic;

begin

cache_1 : cache port map (byte_adr, in_data, block_sel, cache_en, write_en, read_en, out_data);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "cache_in.txt";
	file outfile : text is out "cache_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable adr					: std_logic_vector(1 downto 0);	-- byte_adr
	variable controls				: std_logic_vector(2 downto 0); -- [cache_en, write_en, read_en]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - block sel
		read (buf,value);
		block_sel<=value;
		
		readline(infile,buf);	-- line 2 - byte_adr
		read (buf,adr);
		byte_adr<=adr;
		
		readline(infile,buf);	-- line 3 - data_in
		read (buf,value);
		in_data<=value;
		
		readline(infile,buf);	-- line 4 - [cache_en, write_en, read_en]
		read (buf,controls);
		cache_en<=controls(2);
		write_en<=controls(1);
		read_en<=controls(0);

		wait until falling_edge(clock);

		value := out_data;

		write(buf,value);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;