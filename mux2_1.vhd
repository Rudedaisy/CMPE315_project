--
-- Entity: mux2_1
-- Architecture : structural
-- Author: ehanson1
-- Created On: 10/28/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1 is

	port (
		input1	 : in  std_logic;
		input2	 : in  std_logic;
		sel		 : in  std_logic;
		output   : out std_logic);
end mux2_1;

architecture structural of mux2_1 is

component tx
	port (
		sel   : in std_logic;
        selnot: in std_logic;
        input : in std_logic;
        output: out std_logic);
end component;

component inv
	port (
		input    : in  std_logic;
		output   : out std_logic);
end component;

for tx_1, tx_2: tx use entity work.tx(structural);
for inv_1: inv use entity work.inv(structural);

signal notSel : std_logic;

begin

	inv_1: inv port map (sel, notSel);
	tx_1: tx port map (sel, notSel, input1, output); -- input1 is passed if sel = 1
	tx_2: tx port map (notSel, sel, input2, output); -- input2 is passed if sel = 0

end structural;