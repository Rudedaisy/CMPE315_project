--
-- Entity: register_byte_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity register_byte_test is

end register_byte_test;

architecture test of register_byte_test is

component register_byte
  port(d   : in  std_logic_vector(7 downto 0);
       w   : in  std_logic;
       clk : in  std_logic;
       q   : out std_logic_vector(7 downto 0));
end component;

for register_byte_1 : register_byte use entity work.register_byte(structural);
	signal d, q : std_logic_vector(7 downto 0);
	signal w	: std_logic;
	signal clock : std_logic;

begin

register_byte_1 : register_byte port map (d, w, clock, q);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "register_byte_in.txt";
	file outfile : text is out "register_byte_out.txt";
	variable value					: std_logic_vector(7 downto 0);
	variable input					: std_logic;	-- [w]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- comment
		readline(infile,buf);	-- line 1 - d
		read (buf,value);
		d<=value;
		
		readline(infile,buf);	-- line 2 - [w]
		read (buf,input);
		w<=input;

		wait until falling_edge(clock);

		value := q;

		write(buf,value);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;