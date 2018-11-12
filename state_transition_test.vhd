--
-- Entity: state_transition_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 10/31/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_transition_test is

end state_transition_test;

architecture test of state_transition_test is

component state_transition
	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic; 
		clk		 : in  std_logic;
		count	 : in  std_logic_vector(3 downto 0);
		is_s0	 : in  std_logic; 
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end component;

for state_transition_1 : state_transition use entity work.state_transition(structural);
	signal busy, rd_wr, tmavl, tmavr, is_s0, is_s4, is_s5 : std_logic;
	signal count : std_logic_vector(3 downto 0);
	signal s_next : std_logic_vector(2 downto 0);
	signal clock : std_logic;

begin

state_transition_1 : state_transition port map (busy, rd_wr, tmavl, tmavr, clock, count, is_s0, is_s4, is_s5, s_next);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "state_transition_in.txt";
	file outfile : text is out "state_transition_out.txt";
	variable inputs					: std_logic_vector(3 downto 0);	-- [busy, rd_wr, tmavl, tmavr]
	variable count_var				: std_logic_vector(3 downto 0);	
	variable states					: std_logic_vector(2 downto 0); -- [is_s0, is_s4, is_s5]
	variable s_next_var				: std_logic_vector(2 downto 0);
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 

		readline(infile,buf);	-- comment
		readline(infile,buf);	-- 1st line = [busy, rd_wr, tmavl, tmavr]
		read (buf,inputs);
		busy<=inputs(3);
		rd_wr<=inputs(2);
		tmavl<=inputs(1);
		tmavr<=inputs(0);
		
		readline(infile,buf);	-- 2nd line = count
		read (buf,count_var);
		count<=count_var;
		
		readline(infile,buf);	-- 3rd line = [is_s0, is_s4, is_s5]
		read (buf, states);
		is_s0<=states(2);
		is_s4<=states(1);
		is_s5<=states(0);

		wait until falling_edge(clock);

		s_next_var := s_next;

		write(buf,s_next_var);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;