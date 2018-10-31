--
-- Entity: nor4_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/31/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nor4_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		output   : out std_logic);
end nor4_1;

architecture structural of nor4_1 is

begin

	output <= not (input1 or input2 or input3 or input4);

end structural;