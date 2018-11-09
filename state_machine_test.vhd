--
-- Entity: state_machine_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/9/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_test is

end state_machine_test;

architecture test of state_machine_test is

component state_machine
	port (
		start	 : in  std_logic;
		rst		 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		clk	 	 : in  std_logic;
		busy   	 : out std_logic;
		rd_cache : out std_logic;
		wr_cache : out std_logic;
		fm   	 : out std_logic;
		update_lru  : out std_logic;
		mem_en   : out std_logic;
		a0_new	 : out std_logic;
		a1_new	 : out std_logic);
end component;

for state_machine_1 : state_machine use entity work.state_machine(structural);
	signal start, rst, rd_wr, tmavl, tmavr, busy, rd_cache, wr_cache, fm, update_lru, mem_en, a0_new, a1_new		: std_logic;
	signal is_s0, is_s1, is_s2, is_s4, is_s5: std_logic;
	signal clock : std_logic;

begin

state_machine_1 : state_machine port map (start, rst, rd_wr, tmavl, tmavr, clock, busy, rd_cache, wr_cache, fm, update_lru, mem_en, a0_new, a1_new);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "state_machine_in.txt";
	--file outfile : text is out "state_transition_out.txt";
	variable ins					: std_logic_vector(4 downto 0); -- [start, rst, rw, tmavl, tmavr]
	variable outs					: std_logic_vector(7 downto 0);	-- [busy, rd, wr, fm, lru, mem_en, a0, a1]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- 1st line = ins
		read (buf,ins);
		start<=ins(4);
		rst<=ins(3);
		rd_wr<=ins(2);
		tmavl<=ins(1);
		tmavr<=ins(0);

		wait until falling_edge(clock);

		outs(7) := busy;
		outs(6) := rd_cache;
		outs(5) := wr_cache;
		outs(4) := fm;
		outs(3) := update_lru;
		outs(2) := mem_en;
		outs(1) := a0_new;
		outs(0) := a1_new;

		write(buf,outs);
		writeline(output,buf);
		--writeline(outfile,buf);

	end if;

end process io_process;

end test;