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

component nand3_1
	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		output   : out std_logic);
end component;

component dff
  port(d    : in  std_logic;
       clk  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

for inv_1, inv_2, inv_3: inv use entity work.inv(structural);
for nand2_1_1, nand2_1_2, nand2_1_3, nand2_1_4, nand2_1_5, nand2_1_6: nand2_1 use entity work.nand2_1(structural);
for nand3_1_1, nand3_1_2, nand3_1_3: nand3_1 use entity work.nand3_1(structural);
for dff_1, dff_2, dff_3, dff_4: dff use entity work.dff(structural);

signal not_s0, not_count0, not_s3, not_s4, temp_busy_1, temp_busy_2, busy_out, temp_wc_1, temp_wc_2, temp_wc_3, temp_update: std_logic;

begin
	
	-- Busy
	inv_1: inv port map (is_s0, not_s0);
	nand2_1_1: nand2_1 port map (start, not_s3, temp_busy_1);
	nand2_1_2: nand2_1 port map (not_s0, not_s3, temp_busy_2);
	nand2_1_3: nand2_1 port map (temp_busy_1, temp_busy_2, busy_out);
	dff_1: dff port map (busy_out, clk, busy, open);
	
	-- Read Cache
	dff_2: dff port map (is_s3, clk, rd_cache, open);
	
	-- Write Cache
	inv_2: inv port map (count0, not_count0);
	nand3_1_1: nand3_1 port map (count3, not_count0, clk, temp_wc_1);
	nand3_1_2: nand3_1 port map (count3, count0, not_clk, temp_wc_2);
	nand2_1_4: nand2_1 port map (is_s1, count0, temp_wc_3);
	nand3_1_3: nand3_1 port map (temp_wc_1, temp_wc_2, temp_wc_3, wr_cache);
	
	-- From Memory
	dff_3: dff port map (is_s5, clk, fm, open);
	
	-- Update LRU
	inv_3: inv port map (is_s3, not_s3);
	nand2_1_5: nand2_1 port map (count0, is_s1, temp_update);
	nand2_1_6: nand2_1 port map (not_s3, temp_update, update_lru);
	
	-- Memory Enable
	dff_4: dff port map (is_s4, clk, mem_en, open);
	
end structural;