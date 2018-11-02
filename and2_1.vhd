--
-- Entity: and2_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/31/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and2_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end and2_1;

architecture structural of and2_1 is

begin

	output <= input1 and input2 ;

end structural;
