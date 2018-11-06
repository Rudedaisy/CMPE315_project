--
-- Entity: lru
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity lru is
  port(TMAVR      : in  std_logic;
       BLOCK_SEL  : in  std_logic_vector(7 downto 0);
       UPDATE_LRU : in  std_logic;
       FM         : in  std_logic;
       RESET      : in  std_logic;
       LRU        : out std_logic);
end lru;

architecture structural of lru is
  component lru_cell
    port(TMAVR : in  std_logic;
         updt  : in  std_logic;
         r     : in  std_logic;
         rst   : in  std_logic;
         q     : out std_logic);
  end component;
  component and2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;

  for lru_cell_0,
    lru_cell_1,
    lru_cell_2,
    lru_cell_3,
    lru_cell_4,
    lru_cell_5,
    lru_cell_6,
    lru_cell_7 : lru_cell use entity work.lru_cell(structural);
  for and2_1_w0,
    and2_1_w1,
    and2_1_w2,
    and2_1_w3,
    and2_1_w4,
    and2_1_w5,
    and2_1_w6,
    and2_1_w7,
    and2_1_r0,
    and2_1_r1,
    and2_1_r2,
    and2_1_r3,
    and2_1_r4,
    and2_1_r5,
    and2_1_r6,
    and2_1_r7 : and2_1 use entity work.and2_1(structural);

  signal updt, r : std_logic_vector(7 downto 0);

begin
  and2_1_w0 : and2_1 port map(BLOCK_SEL(0), UPDATE_LRU, updt(0));
  and2_1_w1 : and2_1 port map(BLOCK_SEL(1), UPDATE_LRU, updt(1));
  and2_1_w2 : and2_1 port map(BLOCK_SEL(2), UPDATE_LRU, updt(2));
  and2_1_w3 : and2_1 port map(BLOCK_SEL(3), UPDATE_LRU, updt(3));
  and2_1_w4 : and2_1 port map(BLOCK_SEL(4), UPDATE_LRU, updt(4));
  and2_1_w5 : and2_1 port map(BLOCK_SEL(5), UPDATE_LRU, updt(5));
  and2_1_w6 : and2_1 port map(BLOCK_SEL(6), UPDATE_LRU, updt(6));
  and2_1_w7 : and2_1 port map(BLOCK_SEL(7), UPDATE_LRU, updt(7));

  and2_1_r0 : and2_1 port map(BLOCK_SEL(0), FM, r(0));
  and2_1_r1 : and2_1 port map(BLOCK_SEL(1), FM, r(1));
  and2_1_r2 : and2_1 port map(BLOCK_SEL(2), FM, r(2));
  and2_1_r3 : and2_1 port map(BLOCK_SEL(3), FM, r(3));
  and2_1_r4 : and2_1 port map(BLOCK_SEL(4), FM, r(4));
  and2_1_r5 : and2_1 port map(BLOCK_SEL(5), FM, r(5));
  and2_1_r6 : and2_1 port map(BLOCK_SEL(6), FM, r(6));
  and2_1_r7 : and2_1 port map(BLOCK_SEL(7), FM, r(7));

  lru_cell_0 : lru_cell port map(TMAVR, updt(0), r(0), RESET, LRU);
  lru_cell_1 : lru_cell port map(TMAVR, updt(1), r(1), RESET, LRU);
  lru_cell_2 : lru_cell port map(TMAVR, updt(2), r(2), RESET, LRU);
  lru_cell_3 : lru_cell port map(TMAVR, updt(3), r(3), RESET, LRU);
  lru_cell_4 : lru_cell port map(TMAVR, updt(4), r(4), RESET, LRU);
  lru_cell_5 : lru_cell port map(TMAVR, updt(5), r(5), RESET, LRU);
  lru_cell_6 : lru_cell port map(TMAVR, updt(6), r(6), RESET, LRU);
  lru_cell_7 : lru_cell port map(TMAVR, updt(7), r(7), RESET, LRU);
end structural;
