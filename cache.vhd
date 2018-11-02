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
  port(BYTE_ADR  : in  std_logic_vector(1 downto 0);
       IN_DATA   : in  std_logic_vector(7 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_EN  : in  std_logic;
       READ_EN   : in  std_logic;
       OUT_DATA  : out std_logic_vector(7 downto 0));
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
  and3_1_1 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_EN, w000);
  and3_1_2 :  and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_EN, w001);
  and3_1_3 :  and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_EN, w010);
  and3_1_4 :  and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_EN, w011);
  and3_1_5 :  and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_EN, w100);
  and3_1_6 :  and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_EN, w101);
  and3_1_7 :  and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_EN, w110);
  and3_1_8 :  and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_EN, w111);

  and3_1_9 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, READ_EN r000);
  and3_1_10 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, READ_EN r001);
  and3_1_11 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, READ_EN r010);
  and3_1_12 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, READ_EN r011);
  and3_1_13 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, READ_EN r100);
  and3_1_14 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, READ_EN r101);
  and3_1_15 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, READ_EN r110);
  and3_1_16 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, READ_EN r111);

  cache_block_1 : cache_block port map(BYTE_ADR, IN_DATA, w000, r000, OUT_DATA);
  cache_block_2 : cache_block port map(BYTE_ADR, IN_DATA, w001, r001, OUT_DATA);
  cache_block_3 : cache_block port map(BYTE_ADR, IN_DATA, w010, r010, OUT_DATA);
  cache_block_4 : cache_block port map(BYTE_ADR, IN_DATA, w011, r011, OUT_DATA);
  cache_block_5 : cache_block port map(BYTE_ADR, IN_DATA, w100, r100, OUT_DATA);
  cache_block_6 : cache_block port map(BYTE_ADR, IN_DATA, w101, r101, OUT_DATA);
  cache_block_7 : cache_block port map(BYTE_ADR, IN_DATA, w110, r110, OUT_DATA);
  cache_block_8 : cache_block port map(BYTE_ADR, IN_DATA, w111, r111, OUT_DATA);
end structural;
