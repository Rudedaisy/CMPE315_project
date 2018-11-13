--
-- Entity: registers_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity registers_test is

end registers_test;

architecture test of registers_test is

component registers
  port(CPU_ADDRESS : in  std_logic_vector(7 downto 0);
       CPU_DATA    : in  std_logic_vector(7 downto 0);
       READ_WRITE  : in  std_logic;
       START       : in  std_logic;
       CLK         : in  std_logic;
       ADDRESS     : out std_logic_vector(7 downto 0);
       DATA        : out std_logic_vector(7 downto 0);
       R_W         : out std_logic);
end component;

for registers_1 : registers use entity work.registers(structural);
	signal cpu_address, cpu_data, address, data : std_logic_vector(7 downto 0);
	signal read_write, start, r_w	: std_logic;
	signal clock : std_logic;

begin

registers_1 : registers port map (cpu_address, cpu_data, read_write, start, clock, address, data, r_w);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "registers_in.txt";
	file outfile : text is out "registers_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable inputs					: std_logic_vector(1 downto 0);	-- [r_w, start]
	variable single					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - cpu_address
		read (buf,value);
		cpu_address<=value;
		
		readline(infile,buf);	-- line 2 - cpu_data
		read (buf,value);
		cpu_data<=value;
		
		readline(infile,buf);	-- line 2 - [w]
		read (buf,inputs);
		read_write<=inputs(1);
		start<=inputs(0);

		wait until falling_edge(clock);

		value := address;
		write(buf,value);
		writeline(outfile,buf);
		
		value := data;
		write(buf,value);
		writeline(outfile,buf);
		
		single := r_w;
		write(buf,single);
		writeline(outfile,buf);
		
		write (buf, string'(" ----------------------------------------------"));
		writeline(outfile, buf);
		
	end if;

end process io_process;

end test;