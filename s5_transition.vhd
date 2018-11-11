--
-- Entity: s5_transition
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/10/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity s5_transition is

	port (
		count	 : in  std_logic_vector(3 downto 0);
		clk	 	 : in  std_logic;
		leave_s5 : out std_logic;
		not_leave_s5   : out std_logic);
end s5_transition;

architecture structural of s5_transition is

component and4_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end component;

component dff
  port(d    : in  std_logic;
       clk  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

for and4_1_1: and4_1 use entity work.and4_1(structural);
for dff_1: dff use entity work.dff(structural);

signal s5_done : std_logic;

begin
	
	and4_1_1: and4_1 port map (count(3), count(2), count(1), count(0), s5_done);
	dff_1: dff port map (s5_done, clk, leave_s5, not_leave_s5);

end structural;