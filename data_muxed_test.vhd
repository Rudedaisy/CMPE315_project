--
-- Entity: data_muxed_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity data_muxed_test is

end data_muxed_test;

architecture test of data_muxed_test is

component data_muxed
	port (
		d_cpu	 : in  std_logic_vector(7 downto 0);
		d_mem	 : in  std_logic_vector(7 downto 0);
		fm		 : in  std_logic;
		data	 : out std_logic_vector(7 downto 0));
end component;

for data_muxed_1 : data_muxed use entity work.data_muxed(structural);
	signal d_cpu, d_mem, data	: std_logic_vector(7 downto 0);
	signal fm : std_logic;
	signal clock : std_logic;

begin

data_muxed_1 : data_muxed port map (d_cpu, d_mem, fm, data);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "data_muxed_in.txt";
	file outfile : text is out "data_muxed_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable single_val				: std_logic;	
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- line 1 - d_cpu
		read (buf,value);
		d_cpu<=value;
		
		readline(infile,buf);	-- line 2 - d_mem
		read (buf,value);
		d_mem<=value;
		
		readline(infile,buf);	-- line 3 - fm
		read (buf,single_val);
		fm<=single_val;

		wait until falling_edge(clock);

		value := data;

		write(buf,value);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;