--
-- Entity: vbit
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity vbit is
  port(IN_VBIT   : in  std_logic;
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_V   : in  std_logic;
       WRITE_V   : in  std_logic;
       OUT_VBIT  : out std_logic);
end vbit;

architecture structural of vbit is
  component cache_cell
    port(d : in  std_logic;
         w : in  std_logic;
         r : in  std_logic;
         q : out std_logic);
  end component;
  component and3_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         input3 : in  std_logic;
         output : out std_logic);
  end component;

  for cache_cell_1,
    cache_cell_2,
    cache_cell_3,
    cache_cell_4,
    cache_cell_5,
    cache_cell_6,
    cache_cell_7,
    cache_cell_8 : cache_cell use entity work.cache_cell(structural);
  for and3_1_1,
    and3_1_2,
    and3_1_3,
    and3_1_4,
    and3_1_5,
    and3_1_6,
    and3_1_7,
    and3_1_8,
    and3_1_9,
    and3_1_10,
    and3_1_11,
    and3_1_12,
    and3_1_13,
    and3_1_14,
    and3_1_15,
    and3_1_16 : and3_1 use entity work.and3_1(structural);

  signal w000,w001,w010,w011,w100,w101,w110,w111,
    r000,r001,r010,r011,r100,r101,r110,r111 : std_logic;

begin
  and3_1_1 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_V, w000);
  and3_1_2 :  and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_V, w001);
  and3_1_3 :  and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_V, w010);
  and3_1_4 :  and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_V, w011);
  and3_1_5 :  and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_V, w100);
  and3_1_6 :  and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_V, w101);
  and3_1_7 :  and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_V, w110);
  and3_1_8 :  and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_V, w111);

  and3_1_9 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, READ_V, r000);
  and3_1_10 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, READ_V, r001);
  and3_1_11 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, READ_V, r010);
  and3_1_12 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, READ_V, r011);
  and3_1_13 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, READ_V, r100);
  and3_1_14 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, READ_V, r101);
  and3_1_15 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, READ_V, r110);
  and3_1_16 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, READ_V, r111);

  cache_cell_1 : cache_cell port map(IN_VBIT, w000, r000, OUT_VBIT);
  cache_cell_2 : cache_cell port map(IN_VBIT, w001, r001, OUT_VBIT);
  cache_cell_3 : cache_cell port map(IN_VBIT, w010, r010, OUT_VBIT);
  cache_cell_4 : cache_cell port map(IN_VBIT, w011, r011, OUT_VBIT);
  cache_cell_5 : cache_cell port map(IN_VBIT, w100, r100, OUT_VBIT);
  cache_cell_6 : cache_cell port map(IN_VBIT, w101, r101, OUT_VBIT);
  cache_cell_7 : cache_cell port map(IN_VBIT, w110, r110, OUT_VBIT);
  cache_cell_8 : cache_cell port map(IN_VBIT, w111, r111, OUT_VBIT);
end structural;
