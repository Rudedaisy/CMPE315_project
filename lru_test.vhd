--
-- Entity: lru_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity lru_test is

end lru_test;

architecture test of lru_test is

component lru
  port(TMAVR      : in  std_logic;
       BLOCK_SEL  : in  std_logic_vector(7 downto 0);
       UPDATE_LRU : in  std_logic;
       FM         : in  std_logic;
       RESET      : in  std_logic;
       LRU        : out std_logic);
end component;

for lru_1 : lru use entity work.lru(structural);
	signal tmavr, update_lru, fm, reset, lru_out	: std_logic;
	signal block_sel : std_logic_vector(7 downto 0);
	signal clock : std_logic;

begin

lru_1 : lru port map (tmavr, block_sel, update_lru, fm, reset, lru_out);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "lru_in.txt";
	file outfile : text is out "lru_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable inputs					: std_logic_vector(3 downto 0);	-- [tmavr, update_lru, fm, reset]
	variable lru_var				: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - block_sel
		read (buf,value);
		block_sel<=value;
		
		readline(infile,buf);	-- line 2 - [tmavr, update_lru, fm, reset]
		read (buf,inputs);
		tmavr<=inputs(3);
		update_lru<=inputs(2);
		fm<=inputs(1);
		reset<=inputs(0);

		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);

		lru_var := lru_out;

		write(buf,lru_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;