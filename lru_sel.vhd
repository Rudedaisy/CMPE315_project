--
-- Entity: lru_sel
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity lru_sel is
  port(FM        : in  std_logic;
       LRU       : in  std_logic;
       TMAVL     : in  std_logic;
       TMAVR     : in  std_logic;
       OUT_LEFT  : out std_logic;
       OUT_RIGHT : out std_logic);
end lru_sel;

architecture structural of lru_sel is
  component inv
    port(input  : in  std_logic;
         output : out std_logic);
  end component;
  component nand2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;

  for inv_1, inv_2 : inv use entity work.inv(structural);
  for nand2_1_1, nand2_1_2, nand2_1_3, nand2_1_4, nand2_1_5, nand2_1_6 : nand2_1 use entity work.nand2_1(structural);

  signal not_FM, not_LRU, t1, t2, t3, t4 : std_logic;

begin
  inv_1 : inv port map(FM, not_FM);
  inv_2 : inv port map(LRU, not_LRU);

  nand2_1_1 : nand2_1 port map(FM, not_LRU, t1);
  nand2_1_2 : nand2_1 port map(not_FM, TMAVL, t2);
  nand2_1_3 : nand2_1 port map(not_FM, TMAVR, t3);
  nand2_1_4 : nand2_1 port map(FM, LRU, t4);

  nand2_1_5 : nand2_1 port map(t1, t2, OUT_LEFT);
  nand2_1_6 : nand2_1 port map(t3, t4, OUT_RIGHT);
end structural;
