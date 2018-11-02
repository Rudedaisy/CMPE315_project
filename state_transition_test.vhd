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
		start	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		count	 : in  std_logic_vector(3 downto 0);
		is_s0	 : in  std_logic;
		is_s1	 : in  std_logic;
		is_s2	 : in  std_logic;
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end component;

for state_transition_1 : state_transition use entity work.state_transition(structural);
	signal s_next							: std_logic_vector(2 downto 0);
	signal count 							: std_logic_vector(3 downto 0);
	signal start, rd_wr, tmavl, tmavr		: std_logic;
	signal is_s0, is_s1, is_s2, is_s4, is_s5: std_logic;
	signal clock : std_logic;

begin

state_transition_1 : state_transition port map (start, rd_wr, tmavl, tmavr, count, is_s0, is_s1, is_s2, is_s4, is_s5, s_next);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "state_transition_in.txt";
	--file outfile : text is out "state_transition_out.txt";
	variable controls				: std_logic_vector(3 downto 0);
	variable count_sig				: std_logic_vector(3 downto 0);	
	variable states					: std_logic_vector(4 downto 0); 
	variable s_next_sig				: std_logic_vector(2 downto 0);
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- 1st line = controls
		read (buf,controls);
		start<=controls(3);
		rd_wr<=controls(2);
		tmavl<=controls(1);
		tmavr<=controls(0);
		
		readline(infile,buf);	-- 2nd line = count
		read (buf,count_sig);
		count<=count_sig;
		
		readline(infile,buf);	-- 3rd line = state_signals
		read (buf, states);
		is_s0<=states(4);
		is_s1<=states(3);
		is_s2<=states(2);
		is_s4<=states(1);
		is_s5<=states(0);

		wait until falling_edge(clock);

		s_next_sig := s_next;

		write(buf,s_next_sig);
		writeline(output,buf);
		--writeline(outfile,buf);

	end if;

end process io_process;

end test;