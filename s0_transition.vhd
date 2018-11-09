--
-- Entity: s0_transition
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/28/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity s0_transition is

	port (
		busy	 : in  std_logic;
		rd_wr	 : in  std_logic;
		tmavl	 : in  std_logic;
		tmavr	 : in  std_logic;
		s_next   : out std_logic_vector(2 downto 0));
end s0_transition;

architecture structural of s0_transition is

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component nor4_1
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

for inv_1, inv_2, inv_3: inv use entity work.inv(structural);
for nor4_1_1, nor4_1_2: nor4_1 use entity work.nor4_1(structural);
for nand2_1_1, nand2_1_2: nand2_1 use entity work.nand2_1(structural);
for nand3_1_1, nand3_1_2, nand3_1_3: nand3_1 use entity work.nand3_1(structural);
for nand4_1_1: nand4_1 use entity work.nand4_1(structural);

signal not_busy, not_rd_wr : std_logic;
signal temp1_1, temp1_2, temp1_3, temp1_4 : std_logic;	-- next(1) temps
signal temp0_1, temp0_2 : std_logic;					-- next(0) temps

begin
	
	-- inverted inputs
	inv_1: inv port map (busy, not_busy);
	inv_2: inv port map (rd_wr, not_rd_wr);
	
	-- next(2)
	nor4_1_1: nor4_1 port map (not_busy, not_rd_wr, tmavl, tmavr, s_next(2));
	
	-- next(1)
	nor4_1_2: nor4_1 port map (not_busy, rd_wr, tmavl, tmavr, temp1_1);
	inv_3: inv port map (temp1_1, temp1_2);
	nand3_1_1: nand3_1 port map (busy, rd_wr, tmavr, temp1_3);
	nand3_1_2: nand3_1 port map (busy, rd_wr, tmavl, temp1_4);
	nand3_1_3: nand3_1 port map (temp1_2, temp1_3, temp1_4, s_next(1));
	
	-- next(0)
	nand2_1_1: nand2_1 port map (busy, tmavr, temp0_1);
	nand2_1_2: nand2_1 port map (busy, tmavl, temp0_2);
	nand4_1_1: nand4_1 port map (temp0_1, temp0_2, temp1_3, temp1_4, s_next(0));

end structural;