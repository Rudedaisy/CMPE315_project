--
-- Entity: assign_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/28/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity assign_1 is

	port (
		output   : out std_logic);
end assign_1;

architecture structural of assign_1 is

begin

	output <= '1';

end structural;
