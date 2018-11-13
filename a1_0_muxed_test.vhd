--
-- Entity: a1_0_muxed_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity a1_0_muxed_test is

end a1_0_muxed_test;

architecture test of a1_0_muxed_test is

component a1_0_muxed
	port (
		a_orig	 : in  std_logic_vector(1 downto 0);
		a_alt	 : in  std_logic_vector(1 downto 0);
		fm		 : in  std_logic;
		address  : out std_logic_vector(1 downto 0));
end component;

for a1_0_muxed_1 : a1_0_muxed use entity work.a1_0_muxed(structural);
	signal a_orig, a_alt, address	: std_logic_vector(1 downto 0);
	signal fm : std_logic;
	signal clock : std_logic;

begin

a1_0_muxed_1 : a1_0_muxed port map (a_orig, a_alt, fm, address);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "a1_0_muxed_in.txt";
	file outfile : text is out "a1_0_muxed_out.txt";
	variable value					: std_logic_vector(1 downto 0);
	variable single_val				: std_logic;	
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- line 1 - a_orig
		read (buf,value);
		a_orig<=value;
		
		readline(infile,buf);	-- line 2 - a_alt
		read (buf,value);
		a_alt<=value;
		
		readline(infile,buf);	-- line 3 - fm
		read (buf,single_val);
		fm<=single_val;

		wait until falling_edge(clock);

		value := address;

		write(buf,value);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;