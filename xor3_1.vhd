--
-- Entity: xor3_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/31/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xor3_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		output   : out std_logic);
end xor3_1;

architecture structural of xor3_1 is

begin

  output <= (input1 and not(input2) and not(input3))
            or (not(input1) and input2 and not(input3))
            or (not(input1) and not(input2) and input3);

end structural;
