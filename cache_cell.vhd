--
-- Entity: cache_cell
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity cache_cell is
  port(
    d:          in std_logic;
    w:          in std_logic;
    r:          in std_logic;
    clk:        in std_logic;
    q:          out std_logic);
end cache_cell;

architecture structural of cache_cell is
  component inv
    port(
      input:    in std_logic;
      output:   in std_logic);
  end component;
  component and2_1
    port(
      input1:   in std_logic;
      input2:   in std_logic;
      output:   out std_logic);
  end component;
  component tx
    port(
      sel:      in std_logic;
      notsel:   in std_logic;
      input:    in std_logic;
      output:   out std_logic);
  end component;

  for inv_1, inv_2, inv_3, inv_4: inv use entity work.inv(structural);
  for and2_1_1: and2_1 use entity work.and2_1(structural);
  for tx_1, tx_2, tx_3: tx use entity work.tx(structural);

  signal not_r, not_clk, dw, temp1, temp2, temp3, temp4: std_logic;

begin
  and2_1_1:     and2_1 port map(d, w, dw);

  inv_1:        inv port map(r, not_r);
  inv_2:        inv port map(clk,not_clk);  
  inv_3:        inv port map(temp1, temp2);
  inv_4:        inv port map(temp2, temp3);

  tx_1:         tx port map(not_clk, clk, dw, temp1);
  tx_2:         tx port map(clk, not_clk, temp3, temp1);
  tx_3:         tx port map(r, not_r, temp2, q);
end structural;
