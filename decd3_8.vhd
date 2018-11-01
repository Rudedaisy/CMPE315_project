--
-- Entity: decd3_8
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity decd3_8 is
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    sel3:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic;
    output5:    out std_logic;
    output6:    out std_logic;
    output7:    out std_logic;
    output8:    out std_logic);
end decd3_8;

architecture structural of decd3_8 is
  component inv
    port(
      input:    in std_logic;
      output:   out std_logic);
  end component;
  component nor3_1
    port(
      input1: in std_logic;
      input2: in std_logic;
      input3: in std_logic;
      output: out std_logic);
  end component;

for inv_1, inv_2, inv_3 : inv use entity work.inv(structural);
for nor3_1_1, nor3_1_2, nor3_1_3, nor3_1_4, nor3_1_5, nor3_1_6, nor3_1_7, nor3_1_8 : nor3_1 use entity work.nor3_1(structural);

  signal not_sel1, not_sel2, not_sel3: std_logic;

begin
  inv_1:        inv port map(sel1, not_sel1);
  inv_2:        inv port map(sel2, not_sel2);
  inv_1:        inv port map(sel3, not_sel3);

  nor3_1_1:     nor3_1 port map(sel1,sel2,sel3);                --000
  nor3_1_2:     nor3_1 port map(not_sel1,sel2,sel3);            --001
  nor3_1_3:     nor3_1 port map(sel1,not_sel2,sel3);            --010
  nor3_1_4:     nor3_1 port map(not_sel1,not_sel2,sel3);        --011
  nor3_1_5:     nor3_1 port map(sel1,sel2,not_sel3);            --100
  nor3_1_6:     nor3_1 port map(not_sel1,sel2,not_sel3);        --101
  nor3_1_7:     nor3_1 port map(sel1,not_sel2,not_sel3);        --110
  nor3_1_8:     nor3_1 port map(not_sel1,not_sel2,not_sel3);    --111

end structural;
