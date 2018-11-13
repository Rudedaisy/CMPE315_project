--
-- Entity: decd2_4
-- Architecture: structural
-- Author: ehanson1
-- created on: 11/10/2018
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity decd2_4 is
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic);
end decd2_4;

architecture structural of decd2_4 is
  component inv
    port(
      input:    in std_logic;
      output:   out std_logic);
  end component;
  component nor2_1
	port (
	  input1   : in  std_logic;
	  input2   : in  std_logic;
	  output   : out std_logic);
  end component;

for inv_1, inv_2 : inv use entity work.inv(structural);
for nor2_1_1, nor2_1_2, nor2_1_3, nor2_1_4: nor2_1 use entity work.nor2_1(structural);

  signal not_sel1, not_sel2: std_logic;

begin
  inv_1:        inv port map(sel1, not_sel1);
  inv_2:        inv port map(sel2, not_sel2);

  nor2_1_1:     nor2_1 port map(sel1,sel2, output1);                --00
  nor2_1_2:     nor2_1 port map(not_sel1,sel2, output2);            --01
  nor2_1_3:     nor2_1 port map(sel1,not_sel2, output3);            --10
  nor2_1_4:     nor2_1 port map(not_sel1,not_sel2, output4);        --11

end structural;
