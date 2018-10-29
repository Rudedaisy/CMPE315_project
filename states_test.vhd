--
-- Entity: states_test
-- Architecture : vhdl 
-- Author: ehanson1
-- Created On: 09/09/2018 
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity states_test is

end states_test;

architecture test of states_test is

component state_0 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_1 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_2 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_3 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_4 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_5 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_6 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_7 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_8 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_9 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_10 
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_11
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_12
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_13
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_14
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

component state_15
	port (
		output	 : out std_logic_vector(3 downto 0));
end component;

for s0: state_0 use entity work.state_0(structural);
for s1: state_1 use entity work.state_1(structural);
for s2: state_2 use entity work.state_2(structural);
for s3: state_3 use entity work.state_3(structural);
for s4: state_4 use entity work.state_4(structural);
for s5: state_5 use entity work.state_5(structural);
for s6: state_6 use entity work.state_6(structural);
for s7: state_7 use entity work.state_7(structural);
for s8: state_8 use entity work.state_8(structural);
for s9: state_9 use entity work.state_9(structural);
for s10: state_10 use entity work.state_10(structural);
for s11: state_11 use entity work.state_11(structural);
for s12: state_12 use entity work.state_12(structural);
for s13: state_13 use entity work.state_13(structural);
for s14: state_14 use entity work.state_14(structural);
for s15: state_15 use entity work.state_15(structural);

	signal s0_out, s1_out, s2_out, s3_out, s4_out, s5_out, s6_out, s7_out, s8_out, s9_out, s10_out, s11_out, s12_out, s13_out, s14_out, s15_out 			: std_logic_vector(3 downto 0);
	signal clock : std_logic;

begin

s0 : state_0 port map (s0_out);
s1 : state_1 port map (s1_out);
s2 : state_2 port map (s2_out);
s3 : state_3 port map (s3_out);
s4 : state_4 port map (s4_out);
s5 : state_5 port map (s5_out);
s6 : state_6 port map (s6_out);
s7 : state_7 port map (s7_out);
s8 : state_8 port map (s8_out);
s9 : state_9 port map (s9_out);
s10 : state_10 port map (s10_out);
s11 : state_11 port map (s11_out);
s12 : state_12 port map (s12_out);
s13 : state_13 port map (s13_out);
s14 : state_14 port map (s14_out);
s15 : state_15 port map (s15_out);

clk : process
	begin  -- process clk

		clock<='0','1' after 5 ns;
		wait for 10 ns;

	end process clk;

io_process: process

	--file infile  : text is in "alu_4_in.txt";
	--variable A1,B1					: std_logic_vector(3 downto 0);
	--variable controls				: std_logic_vector(2 downto 0);	-- [Cin,S0,S1]
	--variable out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15				: std_logic_vector(3 downto 0); 
	variable outs				: std_logic_vector(3 downto 0); 
	variable buf 					: line;

begin
	wait until falling_edge(clock);
	wait until rising_edge(clock);
	outs := s0_out;
	write(buf,outs);
	writeline(output,buf);

	wait until rising_edge(clock);
	outs := s1_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s2_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s3_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s4_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s5_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s6_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s7_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s8_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s9_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s10_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s11_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s12_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s13_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s14_out;
	write(buf,outs);
	writeline(output,buf);
	
	wait until rising_edge(clock);
	outs := s15_out;
	write(buf,outs);
	writeline(output,buf);

end process io_process;

end test;