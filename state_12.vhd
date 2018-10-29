--
-- Entity: state_12
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/28/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_12 is

	port (
		output	 : out std_logic_vector(3 downto 0));
end state_12;

architecture structural of state_12 is

component assign_0
	port (
		output   : out std_logic);
end component;

component assign_1
	port (
		output   : out std_logic);
end component;

for assign_0_1, assign_0_2: assign_0 use entity work.assign_0(structural);
for assign_1_1, assign_1_2: assign_1 use entity work.assign_1(structural);

begin

assign_0_1: assign_0 port map (output(0));
assign_0_2: assign_0 port map (output(1));
assign_1_1: assign_1 port map (output(2));
assign_1_2: assign_1 port map (output(3));

end structural;