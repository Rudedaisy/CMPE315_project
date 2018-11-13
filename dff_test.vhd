--
-- Entity: dff_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity dff_test is

end dff_test;

architecture test of dff_test is

component dff
  port(d    : in  std_logic;
       clk  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

for dff_1 : dff use entity work.dff(structural);
	signal d, q, qbar	: std_logic;
	signal clock : std_logic;

begin

dff_1 : dff port map (d, clock, q, qbar);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk; 

io_process: process

	file infile  : text is in "dff_in.txt";
	file outfile : text is out "dff_out.txt";
	variable d_var					: std_logic;
	variable outputs				: std_logic_vector(1 downto 0);	-- [q, qbar]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	
		read (buf,d_var);
		d<=d_var;

		outputs(1) := q;
		outputs(0) := qbar;
		write(buf,outputs);
		writeline(outfile,buf);
		
		wait until falling_edge(clock);
		wait until rising_edge(clock);
		wait until falling_edge(clock);

		outputs(1) := q;
		outputs(0) := qbar;
		
		write(buf,outputs);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;