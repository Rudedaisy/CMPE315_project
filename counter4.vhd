--
-- Entity: counter4
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/1/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity counter4 is

	port (
		clk  : in  std_logic;
		rst	 : in  std_logic;
		count: out std_logic_vector(3 downto 0));
end counter4;

architecture structural of counter4 is

component dff_reset
	port(
		d    : in  std_logic;
		clk  : in  std_logic;
		rst	 : in  std_logic;
		q    : out std_logic;
		qbar : out std_logic);
end component;

component wire
	port (
		input   : in  std_logic;
		output  : out std_logic);
end component;

for dff_reset_1, dff_reset_2, dff_reset_3, dff_reset_4: dff_reset use entity work.dff_reset(structural);
for wire_1, wire_2: wire use entity work.wire(structural); 		-- wire components used to read from output

signal d0, d1, d2, d3 : std_logic;
signal q0, q1, q2 : std_logic;

begin
	wire_1: wire port map (q0, count(0));
	wire_2: wire port map (q1, count(1));
	wire_3: wire port map (q2, count(2));
	
	dff_reset_1: dff_reset port map (d3, q2, rst, count(3), d3);
	dff_reset_2: dff_reset port map (d2, q1, rst, q2, d2);
	dff_reset_3: dff_reset port map (d1, q0, rst, q1, d1);
	dff_reset_4: dff_reset port map (d0, clk, rst, q0, d0);

end structural;