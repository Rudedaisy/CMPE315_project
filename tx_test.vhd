--
-- Entity: tx_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 11/13/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
use STD.textio.all;

entity tx_test is

end tx_test;

architecture test of tx_test is

component tx                  
  port ( sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output: out std_logic);
end component;  

for tx_1 : tx use entity work.tx(structural);
	signal sel, selnot, input, output : std_logic;
	signal clock : std_logic;

begin

tx_1 : tx port map (sel, selnot, input, output);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "tx_in.txt";
	file outfile : text is out "tx_out.txt";
	variable inputs					: std_logic_vector(2 downto 0); -- [sel, selnot, input]
	variable single					: std_logic;
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 
	
		readline(infile,buf);	-- line 1 - in_address
		read (buf,inputs);
		sel<=inputs(2);
		selnot<=inputs(1);
		input<=inputs(0);

		wait until falling_edge(clock);

		single := output;
		write(buf,single);
		writeline(outfile,buf);
		
	end if;

end process io_process;

end test;