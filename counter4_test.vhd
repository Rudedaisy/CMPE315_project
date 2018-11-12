--
-- Entity: counter4_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/1/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity counter4_test is

end counter4_test;

architecture test of counter4_test is

component counter4
	port (
		clk  : in  std_logic;
		rst	 : in  std_logic;
		count: out std_logic_vector(3 downto 0));
end component;

for counter4_1 : counter4 use entity work.counter4(structural);
	signal rst	: std_logic;
	signal count : std_logic_vector(3 downto 0);
	signal clock : std_logic;

begin

counter4_1 : counter4 port map (clock, rst, count);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "counter4_in.txt";
	file outfile : text is out "counter4_out.txt";
	variable rst_var				: std_logic;
	variable count_sig				: std_logic_vector(3 downto 0);
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- [is_s1, count0, count3]
		read (buf,rst_var);
		rst<=rst_var;

		wait until falling_edge(clock);

		count_sig := count;

		write(buf,count_sig);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;