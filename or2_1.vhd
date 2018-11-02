--
-- Entity: or2_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/2/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or2_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end or2_1;

architecture structural of or2_1 is

begin

	output <= input1 or input2;

end structural;