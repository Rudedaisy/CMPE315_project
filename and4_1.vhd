--
-- Entity: and4_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/2/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and4_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end and4_1;

architecture structural of and4_1 is

begin

	output <= input1 and input2 and input3 and input4;

end structural;