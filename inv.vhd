--
-- Entity: inv
-- Architecture : structural
-- Author: ehanson1
-- Created On: 09/09/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inv is

	port (
		input    : in  std_logic;
		output   : out std_logic);
end inv;

architecture structural of inv is

begin

	output <= not input;

end structural;
