--
-- Entity: a1_0_muxed
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/05/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity a1_0_muxed is

	port (
		a_orig	 : in  std_logic_vector(1 downto 0);
		a_alt	 : in  std_logic_vector(1 downto 0);
		fm		 : in  std_logic;
		address  : out std_logic_vector(1 downto 0));
end a1_0_muxed;

architecture structural of a1_0_muxed is

component mux2_1
	port (
		input1	 : in  std_logic;
		input2	 : in  std_logic;
		sel		 : in  std_logic;
		output   : out std_logic);
end component;

for mux2_1_1, mux2_1_2: mux2_1 use entity work.mux2_1(structural);

begin
	
	mux2_1_1: mux2_1 port map (a_alt(1), a_orig(1), fm, address(1));
	mux2_1_2: mux2_1 port map (a_alt(0), a_orig(0), fm, address(0));

end structural;