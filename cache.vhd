--
-- Entity: cache
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity cache is
  port(adr : in  std_logic_vector(1 downto 0);
       d   : in  std_logic_vector(7 downto 0);
       sel : in  std_logic_vector(7 downto 0);
       en  : in  std_logic;
       w   : in  std_logic;
       r   : in  std_logic;
       q   : out std_logic_vector(7 downto 0));
end cache;

architecture structural of cache is
  component cache_block
    port(adr : in  std_logic_vector(1 downto 0);
         d   : in  std_logic_vector(7 downto 0);
         w   : in  std_logic;
         r   : in  std_logic;
         q   : out std_logic_vector(7 downto 0));
  end component;
  component and3_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         input3 : in  std_logic;
         output : out std_logic);
  end component;

  for cache_block_1,
    cache_block_2,
    cache_block_3,
    cache_block_4,
    cache_block_5,
    cache_block_6,
    cache_block_7,
    cache_block_8 : cache_block use entity work.cache_block(structural);
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

  cache_block_1 : cache_block port map(adr, d, w000, r000, q);
  cache_block_2 : cache_block port map(adr, d, w001, r001, q);
  cache_block_3 : cache_block port map(adr, d, w010, r010, q);
  cache_block_4 : cache_block port map(adr, d, w011, r011, q);
  cache_block_5 : cache_block port map(adr, d, w100, r100, q);
  cache_block_6 : cache_block port map(adr, d, w101, r101, q);
  cache_block_7 : cache_block port map(adr, d, w110, r110, q);
  cache_block_8 : cache_block port map(adr, d, w111, r111, q);
end structural;
