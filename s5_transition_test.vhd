--
-- Entity: s5_transition_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity s5_transition_test is

end s5_transition_test;

architecture test of s5_transition_test is

component s5_transition
	port (
		count	 : in  std_logic_vector(3 downto 0);
		clk	 	 : in  std_logic;
		leave_s5 : out std_logic;
		not_leave_s5   : out std_logic);
end component;


for s5_transition_1: s5_transition use entity work.s5_transition(structural);

	signal count : std_logic_vector(3 downto 0);
	signal clk, leave_s5, not_leave_s5 : std_logic;
	signal clock : std_logic;

begin

s5_transition_1 : s5_transition port map (count, clk, leave_s5, not_leave_s5);

clocking : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "s5_transition_in.txt";
	file outfile : text is out "s5_transition_out.txt";
	variable inputs		: std_logic_vector(4 downto 0); -- [count3, count2, count1, count0, clk]
	variable outputs	: std_logic_vector(1 downto 0);
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [count3, count2, count1, count0, clk]
		read (buf,inputs);
		count<=inputs(4 downto 1);
		clk<=inputs(0);
	
		wait until falling_edge(clock);
	
		outputs(1) := leave_s5;
		outputs(0) := not_leave_s5;
	
		write(buf,outputs);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;