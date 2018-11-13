--
-- Entity: lru_sel_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity lru_sel_test is

end lru_sel_test;

architecture test of lru_sel_test is

component lru_sel
  port(FM        : in  std_logic;
       LRU       : in  std_logic;
       TMAVL     : in  std_logic;
       TMAVR     : in  std_logic;
       OUT_LEFT  : out std_logic;
       OUT_RIGHT : out std_logic);
end component;

for lru_sel_1 : lru_sel use entity work.lru_sel(structural);
	signal fm, lru, tmavl, tmavr, out_left, out_right	: std_logic;
	signal clock : std_logic;

begin

lru_sel_1 : lru_sel port map (fm, lru, tmavl, tmavr, out_left, out_right);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "lru_sel_in.txt";
	file outfile : text is out "lru_sel_out.txt";
	variable inputs					: std_logic_vector(3 downto 0);	-- [fm, tmavl, tmavr, lru]
	variable outputs				: std_logic_vector(1 downto 0);	-- [out_left, out_right]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [fm, tmavl, tmavr, lru]
		read (buf,inputs);
		fm<=inputs(3);
		tmavl<=inputs(2);
		tmavr<=inputs(1);
		lru<=inputs(0);
		
		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);

		outputs(1) := out_left;
		outputs(0) := out_right;
		
		write(buf,outputs);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;