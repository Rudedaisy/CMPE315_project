--
-- Entity: decd3_8_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/2/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decd3_8_test is

end decd3_8_test;

architecture test of decd3_8_test is

component decd3_8
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    sel3:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic;
    output5:    out std_logic;
    output6:    out std_logic;
    output7:    out std_logic;
    output8:    out std_logic);
end component;

for decd3_8_1 : decd3_8 use entity work.decd3_8(structural);
	signal sel1, sel2, sel3	: std_logic;
	signal output1, output2, output3, output4, output5, output6, output7, output8 : std_logic;
	signal clock : std_logic;

begin

decd3_8_1 : decd3_8 port map (sel1, sel2, sel3, output1, output2, output3, output4, output5, output6, output7, output8);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "decd3_8_in.txt";
	--file outfile : text is out "state_transition_out.txt";
	variable sels					: std_logic_vector(2 downto 0);
	variable out_sigs				: std_logic_vector(7 downto 0);	
	variable buf 					: line;

begin
	if not (endfile(infile)) then 


		readline(infile,buf);	-- sels
		read (buf,sels);
		sel3<=sels(2);
		sel2<=sels(1);
		sel1<=sels(0);

		wait until falling_edge(clock);

		out_sigs(7) := output8;
		out_sigs(6) := output7;
		out_sigs(5) := output6;
		out_sigs(4) := output5;
		out_sigs(3) := output4;
		out_sigs(2) := output3;
		out_sigs(1) := output2;
		out_sigs(0) := output1;

		write(buf,out_sigs);
		writeline(output,buf);
		--writeline(outfile,buf);

	end if;

end process io_process;

end test;