--
-- Entity: nor2_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/31/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nor2_1 is

	port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		output   : out std_logic);
end nor2_1;

architecture structural of nor2_1 is

begin

	output <= not (input1 or input2);

end structural;