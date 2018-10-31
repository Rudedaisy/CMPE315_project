--
-- Entity: state_transition_test 
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 10/31/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_transition_test is

end state_transition_test;

architecture test of state_transition_test is

component alu_4
    port (
		A 	: in  std_logic_vector(3 downto 0);
		B 	: in  std_logic_vector(3 downto 0);
		Cin	: in  std_logic;
		S0 	: in  std_logic;
		S1 	: in  std_logic;
		G 	: out std_logic_vector(3 downto 0);
		Cout: out std_logic);
end component;

for alu1 : alu_4 use entity work.alu_4(structural);
	signal A_sig,B_sig,G_out				: std_logic_vector(3 downto 0);
	signal Cin_sig,S0_sig,S1_sig,Cout_out	: std_logic;
	signal clock : std_logic;

begin

alu1 : alu_4 port map (A_sig,B_sig,Cin_sig,S0_sig,S1_sig,G_out,Cout_out);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	file infile  : text is in "alu_4_in.txt";
	file outfile : text is out "alu_4_out.txt";
	variable A1,B1					: std_logic_vector(3 downto 0);
	variable controls				: std_logic_vector(2 downto 0);	-- [Cin,S0,S1]
	variable outs					: std_logic_vector(4 downto 0); -- [G,Cout]
	variable buf 					: line;

begin
	wait until rising_edge(clock);
	if not (endfile(infile)) then 


		readline(infile,buf);	-- 1st line = A
		read (buf,A1);
		A_sig<=A1;
		
		readline(infile,buf);	-- 2nd line = B
		read (buf,B1);
		B_sig<=B1;
		
		readline(infile,buf);	-- 3rd line = Cin,S0,S1
		read (buf, controls);
		Cin_sig<=controls(2);
		S0_sig<=controls(1);
		S1_sig<=controls(0);

		wait until falling_edge(clock);

		outs(4 downto 1) := G_out;
		outs(0) := Cout_out;

		write(buf,outs);
		writeline(outfile,buf);

	end if;

end process io_process;

end test;