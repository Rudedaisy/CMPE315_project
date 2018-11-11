--
-- Entity: control_update_lru
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/10/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity control_update_lru is

	port (
		is_s1	 : in  std_logic;
		not_s3   : in  std_logic;
		count0	 : in  std_logic;
		clk 	 : in  std_logic;
		update_lru 	 : out std_logic);
end control_update_lru;

architecture structural of control_update_lru is

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

for nand2_1_1, nand2_1_2: nand2_1 use entity work.nand2_1(structural);
for dff_1: dff use entity work.dff(structural);

signal temp_update_1, temp_update_2 : std_logic;

begin
	
	nand2_1_1: nand2_1 port map (count0, is_s1, temp_update_1);
	nand2_1_2: nand2_1 port map (not_s3, temp_update_1, temp_update_2);
	dff_1: dff port map (temp_update_2, clk, update_lru, open);

end structural;