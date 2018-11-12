--
-- Entity: control_update_lru_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity control_update_lru_test is

end control_update_lru_test;

architecture test of control_update_lru_test is

component control_update_lru
	port (
		is_s1	 : in  std_logic;
		not_s3   : in  std_logic;
		count0	 : in  std_logic;
		clk 	 : in  std_logic;
		update_lru 	 : out std_logic);
end component;


for control_update_lru_1: control_update_lru use entity work.control_update_lru(structural);

	signal is_s1, not_s3, count0, update_lru : std_logic;
	signal clock : std_logic;

begin

control_update_lru_1 : control_update_lru port map (is_s1, not_s3, count0, clock, update_lru);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "control_update_lru_in.txt";
	file outfile : text is out "control_update_lru_out.txt";
	variable inputs			: std_logic_vector(2 downto 0); -- [is_s1, not_s3, count0]
	variable update_lru_var	: std_logic;
	variable buf 			: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [is_s1, not_s3, count0]
		read (buf,inputs);
		is_s1<=inputs(2);
		not_s3<=inputs(1);
		count0<=inputs(0);
	
		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);
	
		update_lru_var := update_lru;
	
		write(buf,update_lru_var);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;