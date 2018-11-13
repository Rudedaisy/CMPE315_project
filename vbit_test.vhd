--
-- Entity: vbit_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/12/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity vbit_test is

end vbit_test;

architecture test of vbit_test is

component vbit
  port(IN_VBIT   : in  std_logic;
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_V   : in  std_logic;
       RESET     : in  std_logic;
       OUT_VBIT  : out std_logic);
end component;

for vbit_1 : vbit use entity work.vbit(structural);
	signal in_vbit, cache_en, write_v, reset, out_vbit : std_logic;
	signal block_sel : std_logic_vector(7 downto 0);
	signal clock : std_logic;

begin

vbit_1 : vbit port map (in_vbit, block_sel, cache_en, write_v, reset, out_vbit);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "vbit_in.txt";
	file outfile : text is out "vbit_out.txt";
	variable block_sel_var			: std_logic_vector(7 downto 0);
	variable inputs					: std_logic_vector(3 downto 0);	-- [in_vbit, cache_en, write_v, reset]
	variable out_vbit_var			: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - block_sel
		read (buf,block_sel_var);
		block_sel<=block_sel_var;
		
		readline(infile,buf);	-- line 2 - [in_vbit, cache_en, write_v, reset]
		read (buf,inputs);
		in_vbit<=inputs(3);
		cache_en<=inputs(2);
		write_v<=inputs(1);
		reset<=inputs(0);

		wait until falling_edge(clock);

		out_vbit_var := out_vbit;

		write(buf,out_vbit_var);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;