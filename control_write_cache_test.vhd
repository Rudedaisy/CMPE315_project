--
-- Entity: control_write_cache_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity control_write_cache_test is

end control_write_cache_test;

architecture test of control_write_cache_test is

component control_write_cache
	port (
		is_s1	 : in  std_logic;
		count0	 : in  std_logic;
		count3	 : in  std_logic;
		clk 	 : in  std_logic;
		not_clk  : in  std_logic;
		wr_cache : out std_logic);
end component;


for control_write_cache_1: control_write_cache use entity work.control_write_cache(structural);

	signal is_s1, count0, count3, wr_cache : std_logic;
	signal clock, not_clock : std_logic;

begin

control_write_cache_1 : control_write_cache port map (is_s1, count0, count3, clock, not_clock, wr_cache);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		not_clock<='1','0' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "control_write_cache_in.txt";
	file outfile : text is out "control_write_cache_out.txt";
	variable inputs			: std_logic_vector(2 downto 0); -- [is_s1, count0, count3]
	variable wr_cache_var	: std_logic;
	variable buf 			: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [is_s1, count0, count3]
		read (buf,inputs);
		is_s1<=inputs(2);
		count3<=inputs(1);
		count0<=inputs(0);
	
		wait until falling_edge(clock);
	
		wr_cache_var := wr_cache;
	
		write(buf,wr_cache_var);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;