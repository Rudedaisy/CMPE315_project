--
-- Entity: lru
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity lru is
  port(TMAVL     : in  std_logic;
       TMAVR     : in  std_logic;
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       UPDATE    : in  std_logic;
       FM        : in  std_logic;
       LRU       : out std_logic);
end lru;

architecture structural of lru is
  component lru_cell
    port(TMAVL : in  std_logic;
         TMAVR : in  std_logic;
         en    : in  std_logic;
         r     : in  std_logic;
         q     : out std_logic);
  end component;
  component and2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;

  for lru_cell_1,
    lru_cell_2,
    lru_cell_3,
    lru_cell_4,
    lru_cell_5,
    lru_cell_6,
    lru_cell_7,
    lru_cell_8 : lru_cell use entity work.lru_cell(structural);
  for and2_1_1,
    and2_1_2,
    and2_1_3,
    and2_1_4,
    and2_1_5,
    and2_1_6,
    and2_1_7,
    and2_1_8,
    and2_1_9,
    and2_1_10,
    and2_1_11,
    and2_1_12,
    and2_1_13,
    and2_1_14,
    and2_1_15,
    and2_1_16 : and2_1 use entity work.and2_1(structural);

  signal e000,e001,e010,e011,e100,e101,e110,e111,
    r000,r001,r010,r011,r100,r101,r110,r111 : std_logic;

beginca
  and2_1_1 :  and2_1 port map(BLOCK_SEL(0), UPDATE, e000);
  and2_1_2 :  and2_1 port map(BLOCK_SEL(1), UPDATE, e001);
  and2_1_3 :  and2_1 port map(BLOCK_SEL(2), UPDATE, e010);
  and2_1_4 :  and2_1 port map(BLOCK_SEL(3), UPDATE, e011);
  and2_1_5 :  and2_1 port map(BLOCK_SEL(4), UPDATE, e100);
  and2_1_6 :  and2_1 port map(BLOCK_SEL(5), UPDATE, e101);
  and2_1_7 :  and2_1 port map(BLOCK_SEL(6), UPDATE, e110);
  and2_1_8 :  and2_1 port map(BLOCK_SEL(7), UPDATE, e111);

  and2_1_9 :  and2_1 port map(BLOCK_SEL(0), FM, r000);
  and2_1_10 : and2_1 port map(BLOCK_SEL(1), FM, r001);
  and2_1_11 : and2_1 port map(BLOCK_SEL(2), FM, r010);
  and2_1_12 : and2_1 port map(BLOCK_SEL(3), FM, r011);
  and2_1_13 : and2_1 port map(BLOCK_SEL(4), FM, r100);
  and2_1_14 : and2_1 port map(BLOCK_SEL(5), FM, r101);
  and2_1_15 : and2_1 port map(BLOCK_SEL(6), FM, r110);
  and2_1_16 : and2_1 port map(BLOCK_SEL(7), FM, r111);

  lru_cell_1 : lru_cell port map(TMAVL, TMAVR, e000, r000, LRU);
  lru_cell_2 : lru_cell port map(TMAVL, TMAVR, e001, r001, LRU);
  lru_cell_3 : lru_cell port map(TMAVL, TMAVR, e010, r010, LRU);
  lru_cell_4 : lru_cell port map(TMAVL, TMAVR, e011, r011, LRU);
  lru_cell_5 : lru_cell port map(TMAVL, TMAVR, e100, r100, LRU);
  lru_cell_6 : lru_cell port map(TMAVL, TMAVR, e101, r101, LRU);
  lru_cell_7 : lru_cell port map(TMAVL, TMAVR, e110, r110, LRU);
  lru_cell_8 : lru_cell port map(TMAVL, TMAVR, e111, r111, LRU);
end structural;
