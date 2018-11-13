--
-- Entity: lru_cell_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity lru_cell_test is

end lru_cell_test;

architecture test of lru_cell_test is

component lru_cell
  port(TMAVR : in  std_logic;
       updt  : in  std_logic;
       r     : in  std_logic;
       rst   : in  std_logic;
       q     : out std_logic);
end component;

for lru_cell_1 : lru_cell use entity work.lru_cell(structural);
	signal tmavr, updt, r, rst, q	: std_logic;
	signal clock : std_logic;

begin

lru_cell_1 : lru_cell port map (tmavr, updt, r, rst, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "lru_cell_in.txt";
	file outfile : text is out "lru_cell_out.txt";
	variable inputs					: std_logic_vector(3 downto 0);	-- [tmavr, updt, r, rst]
	variable q_var					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- [tmavr, updt, r, rst]
		read (buf,inputs);
		tmavr<=inputs(3);
		updt<=inputs(2);
		r<=inputs(1);
		rst<=inputs(0);

		wait until falling_edge(clock);

		q_var := q;

		write(buf,q_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;