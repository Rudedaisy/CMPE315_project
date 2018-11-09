--
-- Entity: state_machine
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/2/2018 NOT STARTED YET
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine is

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
end state_machine;

architecture structural of state_machine is

component wire
	port (
		input   : in  std_logic;
		output   : out std_logic);
end component;

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component or2_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end component;

component curr_state
	port (
		s_next	 : in  std_logic_vector(2 downto 0);
		rst		 : in  std_logic;
		not_clk	 : in  std_logic;
		s_curr   : out std_logic_vector(5 downto 0));
end component;

component counter4
	port (
		clk  : in  std_logic;
		rst	 : in  std_logic;
		count: out std_logic_vector(3 downto 0));
end component;

component state_transition
	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		count	 : in  std_logic_vector(3 downto 0);
		is_s0	 : in  std_logic;
		is_s1	 : in  std_logic;
		is_s2	 : in  std_logic;
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end component;

component state_control
	port (
		start	 : in  std_logic;
		is_s0	 : in  std_logic;
		is_s1	 : in  std_logic;
		is_s3	 : in  std_logic;
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		count0	 : in  std_logic;
		count3	 : in  std_logic;
		clk 	 : in  std_logic;
		not_clk	 : in  std_logic;
		busy   	 : out std_logic;
		rd_cache : out std_logic;
		wr_cache : out std_logic;
		fm   	 : out std_logic;
		update_lru  : out std_logic;
		mem_en   : out std_logic);
end component;

for wire_1, wire_2, wire_3: wire use entity work.wire(structural);
for inv_1: inv use entity work.inv(structural);
for or2_1_1: or2_1 use entity work.or2_1(structural);
for curr_state_1: curr_state use entity work.curr_state(structural);
for counter4_1: counter4 use entity work.counter4(structural);
for state_transition_1: state_transition use entity work.state_transition(structural);
for state_control_1: state_control use entity work.state_control(structural);

signal s_next: std_logic_vector(2 downto 0);	
signal count: std_logic_vector(3 downto 0);
signal states: std_logic_vector(5 downto 0);
signal not_clk, count_rst, busy_out: std_logic;

begin
	
	-- Output new address bits 1 and 0
	wire_1: wire port map (count(1), a0_new);
	wire_2: wire port map (count(2), a1_new);
	
	-- Invert clk signal
	inv_1: inv port map (clk, not_clk);
	
	-- Generate count reset signal
	or2_1_1: or2_1 port map (states(0), states(4), count_rst);
	
	-- Generate current decoded current state signal on the RISING EDGE
	curr_state_1: curr_state port map (s_next, rst, not_clk, states);
	
	-- Generate internal count every FALLING EDGE
	counter4_1: counter4 port map (clk, count_rst, count);
	
	-- Generate next state combinatorially
	state_transition_1: state_transition port map (busy_out, rd_wr, tmavl, tmavr, count, states(0), states(1), states(2), states(4), states(5), s_next);
	
	-- Generate control signal outputs
	state_control_1: state_control port map (start, states(0), states(1), states(3), states(4), states(5), count(0), count(3), clk, not_clk, busy_out, rd_cache, wr_cache, fm, update_lru, mem_en);
	wire_3: wire port map (busy_out, busy);
	
end structural;