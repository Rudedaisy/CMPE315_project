--
-- Entity: s0_transition_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity s0_transition_test is

end s0_transition_test;

architecture test of s0_transition_test is

component s0_transition
	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end component;


for s0_transition_1: s0_transition use entity work.s0_transition(structural);

	signal busy, rd_wr, tmavl, tmavr : std_logic;
	signal s_next : std_logic_vector(2 downto 0);
	signal clock : std_logic;

begin

s0_transition_1 : s0_transition port map (busy, rd_wr, tmavl, tmavr, s_next);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "s0_transition_in.txt";
	file outfile : text is out "s0_transition_out.txt";
	variable inputs		: std_logic_vector(3 downto 0); -- [busy, rd_wr, tmavl, tmavr]
	variable s_next_var	: std_logic_vector(2 downto 0);
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [busy, rd_wr, tmavl, tmavr]
		read (buf,inputs);
		busy<=inputs(3);
		rd_wr<=inputs(2);
		tmavl<=inputs(1);
		tmavr<=inputs(0);
	
		wait until falling_edge(clock);
	
		s_next_var := s_next;
	
		write(buf,s_next_var);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;