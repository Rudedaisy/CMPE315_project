--
-- Entity: cache
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

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

  for cache_block_0,
    cache_block_1,
    cache_block_2,
    cache_block_3,
    cache_block_4,
    cache_block_5,
    cache_block_6,
    cache_block_7 : cache_block use entity work.cache_block(structural);
  for and3_1_w0,
    and3_1_w1,
    and3_1_w2,
    and3_1_w3,
    and3_1_w4,
    and3_1_w5,
    and3_1_w6,
    and3_1_w7,
    and3_1_r0,
    and3_1_r1,
    and3_1_r2,
    and3_1_r3,
    and3_1_r4,
    and3_1_r5,
    and3_1_r6,
    and3_1_r7 : and3_1 use entity work.and3_1(structural);

  signal w, r : std_logic_vector(7 downto 0);

begin
  and3_1_w0 : and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_EN, w(0));
  and3_1_w1 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_EN, w(1));
  and3_1_w2 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_EN, w(2));
  and3_1_w3 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_EN, w(3));
  and3_1_w4 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_EN, w(4));
  and3_1_w5 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_EN, w(5));
  and3_1_w6 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_EN, w(6));
  and3_1_w7 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_EN, w(7));

  and3_1_r0 : and3_1 port map(BLOCK_SEL(0), CACHE_EN, READ_EN, r(0));
  and3_1_r1 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, READ_EN, r(1));
  and3_1_r2 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, READ_EN, r(2));
  and3_1_r3 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, READ_EN, r(3));
  and3_1_r4 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, READ_EN, r(4));
  and3_1_r5 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, READ_EN, r(5));
  and3_1_r6 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, READ_EN, r(6));
  and3_1_r7 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, READ_EN, r(7));

  cache_block_0 : cache_block port map(BYTE_ADR, IN_DATA, w(0), r(0), OUT_DATA);
  cache_block_1 : cache_block port map(BYTE_ADR, IN_DATA, w(1), r(1), OUT_DATA);
  cache_block_2 : cache_block port map(BYTE_ADR, IN_DATA, w(2), r(2), OUT_DATA);
  cache_block_3 : cache_block port map(BYTE_ADR, IN_DATA, w(3), r(3), OUT_DATA);
  cache_block_4 : cache_block port map(BYTE_ADR, IN_DATA, w(4), r(4), OUT_DATA);
  cache_block_5 : cache_block port map(BYTE_ADR, IN_DATA, w(5), r(5), OUT_DATA);
  cache_block_6 : cache_block port map(BYTE_ADR, IN_DATA, w(6), r(6), OUT_DATA);
  cache_block_7 : cache_block port map(BYTE_ADR, IN_DATA, w(7), r(7), OUT_DATA);
end structural;
