--
-- Entity: decd2_4_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decd2_4_test is

end decd2_4_test;

architecture test of decd2_4_test is

component decd2_4
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic);
end component;

for decd2_4_1 : decd2_4 use entity work.decd2_4(structural);
	signal sel1, sel2	: std_logic;
	signal output1, output2, output3, output4 : std_logic;
	signal clock : std_logic;

begin

decd2_4_1 : decd2_4 port map (sel1, sel2, output1, output2, output3, output4);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "decd2_4_in.txt";
	file outfile : text is out "decd2_4_out.txt";
	variable sels					: std_logic_vector(1 downto 0);
	variable out_sigs				: std_logic_vector(3 downto 0);	
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- sels
		read (buf,sels);
		sel2<=sels(1);
		sel1<=sels(0);

		wait until falling_edge(clock);

		out_sigs(3) := output4;
		out_sigs(2) := output3;
		out_sigs(1) := output2;
		out_sigs(0) := output1;

		write(buf,out_sigs);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;