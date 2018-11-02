--
-- Entity: wire
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/1/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity wire is

	port (
		input   : in  std_logic;
		output   : out std_logic);
end wire;

architecture structural of wire is

begin

	output <= input;

end structural;