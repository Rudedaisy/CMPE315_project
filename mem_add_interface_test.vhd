--
-- Entity: mem_add_interface_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity mem_add_interface_test is

end mem_add_interface_test;

architecture test of mem_add_interface_test is

component mem_add_interface
  port(
    in_address: in std_logic_vector(7 downto 0);
    mem_en:		in std_logic;
    mem_add:    out std_logic_vector(7 downto 0));
end component;

for mem_add_interface_1 : mem_add_interface use entity work.mem_add_interface(structural);
	signal in_address, mem_add : std_logic_vector(7 downto 0);
	signal mem_en	: std_logic;
	signal clock : std_logic;

begin

mem_add_interface_1 : mem_add_interface port map (in_address, mem_en, mem_add);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "mem_add_interface_in.txt";
	file outfile : text is out "mem_add_interface_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable single					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - in_address
		read (buf,value);
		in_address<=value;
		
		readline(infile,buf);	-- line 2 - [mem_en]
		read (buf,single);
		mem_en<=single;

		wait until falling_edge(clock);

		value := mem_add;
		write(buf,value);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;