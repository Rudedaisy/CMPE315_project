--
-- Entity: state_machine_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/9/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
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

  signal start, rst, rd_wr, tmavl, tmavr : std_logic;
  signal busy, rd_cache, wr_cache, fm, update_lru, mem_en, a0_new, a1_new: std_logic;
  file outfile : text is out "state_machine_out.txt";

  signal clock : std_logic;
  signal clk_count: integer:=0;

procedure print_output is
   variable inputs : std_logic_vector(4 downto 0);
   variable outputs : std_logic_vector(7 downto 0);
   variable count_var : integer;
   variable out_line: line;

   begin
   
   inputs(4) := start;
   inputs(3) := rst;
   inputs(2) := rd_wr;
   inputs(1) := tmavl;
   inputs(0) := tmavr;
   
   outputs(7) := busy;
   outputs(6) := rd_cache;
   outputs(5) := wr_cache;
   outputs(4) := fm;
   outputs(3) := update_lru;
   outputs(2) := mem_en;
   outputs(1) := a1_new;
   outputs(0) := a0_new;
   
   count_var := clk_count;
   
   write (out_line, string' (" Clock: "));
   write (out_line, count_var);
   write (out_line, string'(" Start: "));
   write (out_line, inputs(4));
   write (out_line, string'(" Read/Write: "));
   write (out_line, inputs(2));
   write (out_line, string'(" Reset: "));
   write (out_line, inputs(3));
   writeline(outfile, out_line);
   
   write (out_line, string'(" Tag-match and Valid Left: "));
   write (out_line, inputs(1));
   write (out_line, string'(" Tag-match and Valid Right: "));
   write (out_line, inputs(0));
   writeline(outfile, out_line);
   writeline(outfile, out_line);
      
   write (out_line, string'(" Busy: "));
   write (out_line, outputs(7));
   write (out_line, string'(" Memory  Enable: "));
   write (out_line, outputs(2));
   writeline(outfile, out_line);
   
   write (out_line, string'(" Read Cache: "));
   write (out_line, outputs(6));
   write (out_line, string'(" Write Cache: "));
   write (out_line, outputs(5));
   writeline(outfile, out_line);
   
   write (out_line, string'(" From Memory: "));
   write (out_line, outputs(4));
   write (out_line, string'(" Update Least-Recently-Used: "));
   write (out_line, outputs(3));
   write (out_line, string'(" a1_alt: "));
   write (out_line, outputs(1));
   write (out_line, string'(" a0_alt: "));
   write (out_line, outputs(0));
   writeline(outfile, out_line);

   write (out_line, string'(" ----------------------------------------------"));
   writeline(outfile, out_line);

   
end print_output;



begin
  
  state_machine_1 : state_machine port map (start, rst, rd_wr, tmavl, tmavr, clock, busy, rd_cache, wr_cache, fm, update_lru, mem_en, a0_new, a1_new);   

  clking : process
  begin
    clock<= '1', '0' after 5 ns;
    wait for 10 ns;
  end process clking;
  
  io_process: process

    file infile  : text is in "state_machine_in.txt";
    variable buf: line;
    variable inputs1: std_logic_vector(1 downto 0);	-- [start, rst]
	variable inputs2: std_logic_vector(2 downto 0);	-- [rd_wr, tmavl, tmavr]
    --variable outputs: std_logic_vector(7 downto 0); -- [busy, rd_cache, wr_cache, fm, update_lru, mem_en, a1_new, a0_new]
    
  begin

    while not (endfile(infile)) loop
      
      wait until rising_edge(clock);
      
      readline(infile, buf);	-- comment
      
      readline(infile, buf);	-- [start, rst]
      read(buf, inputs1);	
      start <= inputs1(1);
	  rst <= inputs1(0);

      clk_count <= clk_count+1;

      wait until falling_edge(clock);

      readline(infile, buf);	-- [rd_wr, tmavl, tmavr]
      read(buf, inputs2);
      rd_wr <= inputs2(2);
	  tmavl <= inputs2(1);
	  tmavr <= inputs2(0);
      
    end loop;
    wait;
      
  end process io_process;

print_process: process

  variable out_line: line;

begin

  wait until ((falling_edge(clock) and start ='1') or busy'EVENT or mem_en'EVENT or rd_cache'EVENT or wr_cache'EVENT or fm'EVENT or update_lru'EVENT or a1_new'EVENT or a0_new'EVENT);
  wait for 1 ns;
  print_output;

end process print_process;

end test;
