--
-- Entity: state_0 
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/21/2004
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_0 is

	port (
		output	 : out std_logic_vector(3 downto 0));
end state_0;

architecture structural of state_0 is

component assign_0
	port (
		output   : out std_logic);
end component;

for assign_0_1, assign_0_2, assign_0_3, assign_0_4: assign_0 use entity work.assign_0(structural);

begin

assign_0_1: assign_0 port map (output(0));
assign_0_2: assign_0 port map (output(1));
assign_0_3: assign_0 port map (output(2));
assign_0_4: assign_0 port map (output(3));

end structural;