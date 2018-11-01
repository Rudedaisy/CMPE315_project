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
  port(d : in  std_logic;
       w : in  std_logic;
       r : in  std_logic;
       q : out std_logic);
end cache_cell;

architecture structural of cache_cell is
  component inv
    port(
      input  : in  std_logic;
      output : in  std_logic);
  end component;
  component dlatch
    port(
      d    : in  std_logic;
      clk  : in  std_logic;
      q    : out std_logic;
      qbar : out std_logic);
  end component;  
  component tx
    port(
      sel    : in  std_logic;
      notsel : in  std_logic;
      input  : in  std_logic;
      output : out std_logic);
  end component;

  for inv_1    : inv    use entity work.inv(structural);
  for dlatch_1 : dlatch use entity work.dlatch(structural);
  for tx_1     : tx     use entity work.tx(structural);

  signal temp1, qbar: std_logic;

begin
  inv_1    : inv    port map(r, not_r);
  dlatch_1 : dlatch port map(d, w, temp1, qbar);
  tx_1     : tx     port map(not_r, r, temp1, q);
end structural;
