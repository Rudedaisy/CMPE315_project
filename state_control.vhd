--
-- Entity: state_control
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/2/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_control is

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
end state_control;

architecture structural of state_control is

component wire
	port (
		input   : in  std_logic;
		output  : out std_logic);
end component;

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

for wire_1, wire_2, wire_3: wire use entity work.wire(structural);
for inv_1, inv_2, inv_3: inv use entity work.inv(structural);
for nand2_1_1, nand2_1_2, nand2_1_3, nand2_1_4, nand2_1_5: nand2_1 use entity work.nand2_1(structural);
for dff_1: dff use entity work.dff(structural);

signal not_start, not_s1, not_s3, not_s4, temp_busy, temp_wc, temp_update: std_logic;

begin
	
	-- Busy
	inv_1: inv port map (start, not_start);
	nand2_1_1: nand2_1 port map (not_start, is_s0, temp_busy);
	dff_1: dff port map (temp_busy, clk, busy, open);
	
	-- Read Cache
	wire_1: wire port map (is_s3, rd_cache);
	
	-- Write Cache
	inv_2: inv port map (is_s1, not_s1);
	nand2_1_2: nand2_1 port map (count0, count3, temp_wc);
	nand2_1_3: nand2_1 port map (not_s1, temp_wc, wr_cache);
	
	-- From Memory
	wire_2: wire port map (is_s5, fm);
	
	-- Update LRU
	inv_3: inv port map (is_s3, not_s3);
	nand2_1_4: nand2_1 port map (count0, is_s1, temp_update);
	nand2_1_5: nand2_1 port map (not_s3, temp_update, update_lru);
	
	-- Memory Enable
	wire_3: wire port map (is_s4, mem_en);
	
end structural;