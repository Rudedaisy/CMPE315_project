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

component dff
  port(d    : in  std_logic;
       clk  : in  std_logic;
       q    : out std_logic;
       qbar : out std_logic);
end component;

component control_busy
	port (
		is_s0	 : in  std_logic;
		not_s3	 : in  std_logic;
		start	 : in  std_logic;
		clk 	 : in  std_logic;
		busy 	 : out std_logic);
end component;

component control_write_cache
	port (
		is_s1	 : in  std_logic;
		count0	 : in  std_logic;
		count3	 : in  std_logic;
		clk 	 : in  std_logic;
		not_clk  : in  std_logic;
		wr_cache : out std_logic);
end component;

component control_update_lru
	port (
		is_s1	 : in  std_logic;
		not_s3   : in  std_logic;
		count0	 : in  std_logic;
		clk 	 : in  std_logic;
		update_lru 	 : out std_logic);
end component;

for control_busy_1: control_busy use entity work.control_busy(structural);
for control_write_cache_1: control_write_cache use entity work.control_write_cache(structural);
for control_update_lru_1: control_update_lru use entity work.control_update_lru(structural);
for inv_1: inv use entity work.inv(structural);
for dff_1, dff_2, dff_3: dff use entity work.dff(structural);

signal not_s3 : std_logic;

begin
	
	-- General internal signal
	inv_1: inv port map (is_s3, not_s3);
	
	-- Busy
	control_busy_1: control_busy port map (is_s0, not_s3, start, clk, busy);
	
	-- Read Cache
	dff_1: dff port map (is_s3, clk, rd_cache, open);
	
	-- Write Cache
	control_write_cache_1: control_write_cache port map (is_s1, count0, count3, clk, not_clk, wr_cache);
	
	-- From Memory
	dff_2: dff port map (is_s5, clk, fm, open);
	
	-- Update LRU
	control_update_lru_1: control_update_lru port map (is_s1, not_s3, count0, clk, update_lru);
	
	-- Memory Enable
	dff_3: dff port map (is_s4, clk, mem_en, open);
	
end structural;