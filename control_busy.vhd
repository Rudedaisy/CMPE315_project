--
-- Entity: control_busy
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/10/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity control_busy is

	port (
		is_s0	 : in  std_logic;
		not_s3	 : in  std_logic;
		start	 : in  std_logic;
		clk 	 : in  std_logic;
		busy 	 : out std_logic);
end control_busy;

architecture structural of control_busy is

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

component nand2_1
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

for inv_1: inv use entity work.inv(structural);
for nand2_1_1, nand2_1_2, nand2_1_3: nand2_1 use entity work.nand2_1(structural);
for dff_1: dff use entity work.dff(structural);

signal not_s0, temp_busy_1, temp_busy_2, busy_out : std_logic;

begin
	
	inv_1: inv port map (is_s0, not_s0);
	nand2_1_1: nand2_1 port map (start, not_s3, temp_busy_1);
	nand2_1_2: nand2_1 port map (not_s0, not_s3, temp_busy_2);
	nand2_1_3: nand2_1 port map (temp_busy_1, temp_busy_2, busy_out);
	dff_1: dff port map (busy_out, clk, busy, open);

end structural;