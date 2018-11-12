--
-- Entity: state_control_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_control_test is

end state_control_test;

architecture test of state_control_test is

component state_control
	port (
		start	 : in  std_logic;
		is_s0	 : in  std_logic;
		is_s1	 : in  std_logic;
		is_s3	 : in  std_logic;
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		count0	 : in  std_logic;
		count3	 : in  std_logic;
		clk 	 : in  std_logic;
		not_clk	 : in  std_logic;
		busy   	 : out std_logic;
		rd_cache : out std_logic;
		wr_cache : out std_logic;
		fm   	 : out std_logic;
		update_lru  : out std_logic;
		mem_en   : out std_logic);
end component;


for state_control_1: state_control use entity work.state_control(structural);

	signal start, is_s0, is_s1, is_s3, is_s4, is_s5, count0, count3 : std_logic;
	signal busy, rd_cache, wr_cache, fm, update_lru, mem_en : std_logic;
	signal clock, not_clock : std_logic;

begin

state_control_1 : state_control port map (start, is_s0, is_s1, is_s3, is_s4, is_s5, count0, count3, clock, not_clock, busy, rd_cache, wr_cache, fm, update_lru, mem_en);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		not_clock<='1','0' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "state_control_in.txt";
	file outfile : text is out "state_control_out.txt";
	variable inputs1		: std_logic_vector(5 downto 0); -- [start, is_s0, is_s1, is_s3, is_s4, is_s5]
	variable inputs2		: std_logic_vector(1 downto 0); -- [count3, count0]
	variable outputs		: std_logic_vector(5 downto 0); -- [busy, rd_cache, wr_cache, fm, update_lru, mem_en]
	variable buf 			: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - [start, is_s0, is_s1, is_s3, is_s4, is_s5]
		read (buf,inputs1);
		start<=inputs1(5);
		is_s0<=inputs1(4);
		is_s1<=inputs1(3);
		is_s3<=inputs1(2);
		is_s4<=inputs1(1);
		is_s5<=inputs1(0);
		
		readline(infile,buf);	-- line 2 - [count3, count0]
		read (buf,inputs2);
		count3<=inputs2(1);
		count0<=inputs2(0);
	
		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);
	
		outputs(5) := busy;
		outputs(4) := rd_cache;
		outputs(3) := wr_cache;
		outputs(2) := fm;
		outputs(1) := update_lru;
		outputs(0) := mem_en;
	
		write(buf,outputs);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;