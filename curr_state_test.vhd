--
-- Entity: curr_state_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity curr_state_test is

end curr_state_test;

architecture test of curr_state_test is

component curr_state
	port (
		s_next	 : in  std_logic_vector(2 downto 0);
		rst		 : in  std_logic;
		not_clk	 : in  std_logic;
		s_curr   : out std_logic_vector(5 downto 0));
end component;


for curr_state_1: curr_state use entity work.curr_state(structural);

	signal s_next : std_logic_vector(2 downto 0);
	signal rst : std_logic;
	signal s_curr : std_logic_vector(5 downto 0);
	signal clock, not_clock : std_logic;

begin

curr_state_1 : curr_state port map (s_next, rst, not_clock, s_curr);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		not_clock<='1','0' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "curr_state_in.txt";
	file outfile : text is out "curr_state_out.txt";
	variable inputs			: std_logic_vector(3 downto 0); -- [s_next2, s_next1, s_next0, rst]
	variable s_curr_var		: std_logic_vector(5 downto 0);
	variable buf 			: line;

begin
	wait until falling_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [s_next2, s_next1, s_next0, rst]
		read (buf,inputs);
		s_next<=inputs(3 downto 1);
		rst<=inputs(0);
	
		wait until rising_edge(clock);
		wait until falling_edge(clock);
		wait until rising_edge(clock);
	
		s_curr_var := s_curr;
	
		write(buf,s_curr_var);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;