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
  port(d   : in  std_logic;
       sel : in  std_logic_vector(7 downto 0);
       en  : in  std_logic;
       w   : in  std_logic;
       r   : in  std_logic;
       q   : out std_logic);
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
  and3_1_1 :  and3_1 port map(sel(0), en, w, w000);
  and3_1_2 :  and3_1 port map(sel(1), en, w, w001);
  and3_1_3 :  and3_1 port map(sel(2), en, w, w010);
  and3_1_4 :  and3_1 port map(sel(3), en, w, w011);
  and3_1_5 :  and3_1 port map(sel(4), en, w, w100);
  and3_1_6 :  and3_1 port map(sel(5), en, w, w101);
  and3_1_7 :  and3_1 port map(sel(6), en, w, w110);
  and3_1_8 :  and3_1 port map(sel(7), en, w, w111);

  and3_1_9 :  and3_1 port map(sel(0), en, r, r000);
  and3_1_10 : and3_1 port map(sel(1), en, r, r001);
  and3_1_11 : and3_1 port map(sel(2), en, r, r010);
  and3_1_12 : and3_1 port map(sel(3), en, r, r011);
  and3_1_13 : and3_1 port map(sel(4), en, r, r100);
  and3_1_14 : and3_1 port map(sel(5), en, r, r101);
  and3_1_15 : and3_1 port map(sel(6), en, r, r110);
  and3_1_16 : and3_1 port map(sel(7), en, r, r111);

  cache_cell_1 : cache_cell port map(d, w000, r000, q);
  cache_cell_2 : cache_cell port map(d, w001, r001, q);
  cache_cell_3 : cache_cell port map(d, w010, r010, q);
  cache_cell_4 : cache_cell port map(d, w011, r011, q);
  cache_cell_5 : cache_cell port map(d, w100, r100, q);
  cache_cell_6 : cache_cell port map(d, w101, r101, q);
  cache_cell_7 : cache_cell port map(d, w110, r110, q);
  cache_cell_8 : cache_cell port map(d, w111, r111, q);
end structural;
