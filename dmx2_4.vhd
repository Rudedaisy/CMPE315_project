--
-- Entity: dmx2_4
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity dmx2_4 is
  port(
    sel:       in std_logic_vector(1 downto 0);
    en:         in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic);
end dmx2_4;

architecture structural of dmx2_4 is
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

  for inv_1, inv_2, inv_3: inv use entity work.inv(structural);
  for nor3_1_1, nor3_1_2, nor3_1_3, nor3_1_4: use entity work.nor3_1(structural);

  signal not_sel1, not_sel2, not_en: std_logic;

begin
  inv_1:        inv port map(sel1, not_sel1);
  inv_2:        inv port map(sel2, not_sel2);
  inv_1:        inv port map(en, not_en);

  nor3_1_1:     nor3_1 port map(en, sel1, sel2);        --00
  nor3_1_2:     nor3_1 port map(en, not_sel1, sel2);    --01
  nor3_1_3:     nor3_1 port map(en, sel1, not_sel2);    --10
  nor3_1_4:     nor3_1 port map(en, not_sel1, not_sel2);--11
end structural;
