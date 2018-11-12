--
-- Entity: control_busy_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity control_busy_test is

end control_busy_test;

architecture test of control_busy_test is

component control_busy
	port (
		is_s0	 : in  std_logic;
		not_s3	 : in  std_logic;
		start	 : in  std_logic;
		clk 	 : in  std_logic;
		busy 	 : out std_logic);
end component;


for control_busy_1: control_busy use entity work.control_busy(structural);

	signal is_s0, not_s3, start, busy : std_logic;
	signal clock : std_logic;

begin

control_busy_1 : control_busy port map (is_s0, not_s3, start, clock, busy);

clocking : process
	begin  -- process clocking

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clocking;

io_process: process

	file infile  : text is in "control_busy_in.txt";
	file outfile : text is out "control_busy_out.txt";
	variable inputs		: std_logic_vector(2 downto 0); -- [is_s0, not_s3, start]
	variable busy_var	: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [is_s0, not_s3, start]
		read (buf,inputs);
		is_s0<=inputs(2);
		not_s3<=inputs(1);
		start<=inputs(0);
	
		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);
	
		busy_var := busy;
	
		write(buf,busy_var);
		writeline(outfile,buf);
	end if;

end process io_process;

end test;