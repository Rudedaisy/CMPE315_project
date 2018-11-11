--
-- Entity: control_write_cache
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/10/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity control_write_cache is

	port (
		is_s1	 : in  std_logic;
		count0	 : in  std_logic;
		count3	 : in  std_logic;
		clk 	 : in  std_logic;
		not_clk  : in  std_logic;
		wr_cache : out std_logic);
end control_write_cache;

architecture structural of control_write_cache is

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

for inv_1, inv_2: inv use entity work.inv(structural);
for nand2_1_1, nand2_1_2: nand2_1 use entity work.nand2_1(structural);
for dff_1, dff_2: dff use entity work.dff(structural);

signal not_s1, not_count0, temp_wc_1, temp_wc_2, temp_wc_3 : std_logic;

begin
	
	-- From state 1 (write hit)
	inv_1: inv port map (is_s1, not_s1);
	dff_1: dff port map (not_s1, clk, temp_wc_1, open);
	
	-- From state 5 (read miss); updates on RISING edge
	inv_2: inv port map (count0, not_count0);
	nand2_1_1: nand2_1 port map (count3, not_count0, temp_wc_2);
	dff_2: dff port map (temp_wc_2, not_clk, temp_wc_3, open); 
	
	-- Final write_cache signal
	nand2_1_2: nand2_1 port map (temp_wc_1, temp_wc_3, wr_cache);

end structural;