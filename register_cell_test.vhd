--
-- Entity: register_cell_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity register_cell_test is

end register_cell_test;

architecture test of register_cell_test is

component register_cell
  port(d   : in  std_logic;
       w   : in  std_logic;
       clk : in  std_logic;
       q   : out std_logic);
end component;

for register_cell_1 : register_cell use entity work.register_cell(structural);
	signal d, w, q	: std_logic;
	signal clock : std_logic;

begin

register_cell_1 : register_cell port map (d, w, clock, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "register_cell_in.txt";
	file outfile : text is out "register_cell_out.txt";
	variable inputs					: std_logic_vector(1 downto 0);	-- [d, w]
	variable q_var					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [d, w]
		read (buf,inputs);
		d<=inputs(1);
		w<=inputs(0);

		wait until falling_edge(clock);

		q_var := q;

		write(buf,q_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;