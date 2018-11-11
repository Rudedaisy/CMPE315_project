--
-- Entity: curr_state
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/2/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity curr_state is

	port (
		s_next	 : in  std_logic_vector(2 downto 0);
		rst		 : in  std_logic;
		not_clk	 : in  std_logic;
		s_curr   : out std_logic_vector(5 downto 0));
end curr_state;

architecture structural of curr_state is

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component nor2_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end component;

component dff
  port(d    : in  std_logic;
       clk  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

component decd3_8
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    sel3:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic;
    output5:    out std_logic;
    output6:    out std_logic;
    output7:    out std_logic;
    output8:    out std_logic);
end component;

for inv_1, inv_2, inv_3: inv use entity work.inv(structural);
for nor2_1_1, nor2_1_2, nor2_1_3: nor2_1 use entity work.nor2_1(structural);
for dff_1, dff_2, dff_3: dff use entity work.dff(structural);
for decd3_8_1: decd3_8 use entity work.decd3_8(structural);

signal nots2, nots1, nots0, next2, next1, next0		: std_logic;
signal q0, q1, q2	: std_logic;
signal out6, out7	: std_logic;

begin

	-- And reg'd inputs with not busy to initialize them
	inv_1: inv port map (s_next(2), nots2);
	inv_2: inv port map (s_next(1), nots1);
	inv_3: inv port map (s_next(0), nots0);
	nor2_1_1: nor2_1 port map (nots2, rst, next2);
	nor2_1_2: nor2_1 port map (nots1, rst, next1);
	nor2_1_3: nor2_1 port map (nots0, rst, next0);
	
	dff_1: dff port map (next2, not_clk, q2, open);
	dff_2: dff port map (next1, not_clk, q1, open);
	dff_3: dff port map (next0, not_clk, q0, open);
	
	decd3_8_1: decd3_8 port map (q0, q1, q2, s_curr(0), s_curr(1), s_curr(2), s_curr(3), s_curr(4), s_curr(5), out6, out7);

end structural;