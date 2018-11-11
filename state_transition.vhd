--
-- Entity: state_transition
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/31/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_transition is

	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic; 
		clk		 : in  std_logic;
		count	 : in  std_logic_vector(3 downto 0);
		is_s0	 : in  std_logic; 
		is_s4	 : in  std_logic;
		is_s5	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end state_transition;

architecture structural of state_transition is

component s0_transition
	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end component;

component s5_transition
	port (
		count	 : in  std_logic_vector(3 downto 0);
		clk	 	 : in  std_logic;
		leave_s5 : out std_logic;
		not_leave_s5   : out std_logic);
end component;

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component and4_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end component;

component nand2_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end component;

component nand3_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		output   : out std_logic);
end component;

component nand4_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end component;

for s0_transition_1: s0_transition use entity work.s0_transition(structural);
for s5_transition_1: s5_transition use entity work.s5_transition(structural);
for inv_1, inv_2: inv use entity work.inv(structural);
for nand2_1_1, nand2_1_2, nand2_1_3, nand2_1_4, nand2_1_5, nand2_1_6: nand2_1 use entity work.nand2_1(structural);
for nand3_1_1, nand3_1_2: nand3_1 use entity work.nand3_1(structural);

signal next2_0, next2_and_0_4, next2_5 : std_logic;				-- next2 temps 
signal next1_0, next1_5 : std_logic;							-- next1 temps
signal next0_0, next0_5 : std_logic;							-- next0 temps
signal s0_next : std_logic_vector(2 downto 0);					-- s0 next bits
signal leave_s5, not_leave_s5 : std_logic;						-- s5 next bits

begin
	
	-- s0 next
	s0_transition_1: s0_transition port map (busy, rd_wr, tmavl, tmavr, s0_next);
	nand2_1_1: nand2_1 port map (s0_next(2), is_s0, next2_0);
	nand2_1_2: nand2_1 port map (s0_next(1), is_s0, next1_0);
	nand2_1_3: nand2_1 port map (s0_next(0), is_s0, next0_0);
	
	-- s4 next
	inv_1: inv port map (is_s4, next2_and_0_4);
	
	-- s5 next
	s5_transition_1: s5_transition port map (count, clk, leave_s5, not_leave_s5);
	nand2_1_4: nand2_1 port map (is_s5, not_leave_s5, next2_5);
	nand2_1_5: nand2_1 port map (is_s5, leave_s5, next1_5);
	inv_2: inv port map (is_s5, next0_5);
	
	-- final next bits
	nand3_1_1: nand3_1 port map (next2_0, next2_and_0_4, next2_5, s_next(2));
	nand2_1_6: nand2_1 port map (next1_0, next1_5, s_next(1));
	nand3_1_2: nand3_1 port map (next0_0, next2_and_0_4, next0_5, s_next(0));

end structural;