--
-- entity: lru_cell
-- architecture: structural
-- author: hx41455
-- created on 2018/11/1
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity lru_cell is
  port(TMAVR : in  std_logic;
       updt  : in  std_logic;
       r     : in  std_logic;
       rst   : in  std_logic;
       q     : out std_logic);
end lru_cell;

architecture structural of lru_cell is
  component dff_reset
    port(d   : in  std_logic;
         clk : in  std_logic;
         rst : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic);
  end component;
  component inv
    port(input  : in  std_logic;
         output : out std_logic);
  end component;
  component tx
    port(sel    : in  std_logic;
         selnot : in  std_logic;
         input  : in  std_logic;
         output : out std_logic);
  end component;

  for dff_reset_1 : dff_reset use entity work.dff_reset(structural);
  for inv_1, inv_2 : inv use entity work.inv(structural);
  for tx_1 : tx use entity work.tx(structural);

  signal t1, not_tmavr, not_r : std_logic;

begin
  inv_1       : inv       port map(TMAVR, not_tmavr);
  inv_2       : inv       port map(r, not_r);

  dff_reset_1 : dff_reset port map(not_tmavr, updt, rst, t1, open);
  tx_1        : tx        port map(r, not_r, t1, q);
end structural;
