--
-- entity: lru_cell
-- architecture: structural
-- author: hx41455
-- created on 2018/11/1
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity lru_cell is
  port(TMAVL : in  std_logic;
       TMAVR : in  std_logic;
       en    : in  std_logic;
       r     : in  std_logic;
       q     : out std_logic);
end lru_cell;

architecture structural of lru_cell is
  component dff
    port(d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic);
  end component;
  component inv
    port(input  : in  std_logic;
         output : out std_logic);
  end component;
  component nand2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;
  component or2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;
  component tx
    port(sel    : in  std_logic;
         selnot : in  std_logic;
         input  : in  std_logic;
         output : out std_logic);
  end component;

  for dff_1 : dff use entity work.dff(structural);
  for inv_1, inv_2 : inv use entity work.inv(structural);
  for nand2_1_1 : nand2_1 use entity work.nand2_1(structural);
  for or2_1_1 : or2_1 use entity work.or2_1(structural);
  for tx_1 : tx use entity work.tx(structural);

  signal not_tmavr, not_r, t1, t2, t3 : std_logic;

begin
  inv_1     : inv     port map(TMAVR, not_tmavr);
  inv_2     : inv     port map(r, not_r);

  dff_1     : dff     port map(t3, en, en, t1);

  or2_1_1   : or2_1   port map(TMAVL, t1, t2);
  nand2_1_1 : nand2_1 port map(not_tmavr, t2, t3);

  tx_1      : tx      port map(r, not_r, t1, q);
end structural;
