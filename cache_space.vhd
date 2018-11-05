--
-- Entity: cache_space
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity cache_space is
  port(ADDRESS  : in  std_logic_vector(7 downto 0);
       IN_DATA  : in  std_logic_vector(7 downto 0);
       WRITE_EN : in  std_logic;
       READ_EN  : in  std_logic;
       FM       : in  std_logic;
       UPDATE   : in  std_logic;
       RESET    : in  std_logic;
       TMAVL    : out std_logic;
       TMAVR    : out std_logic;
       OUT_DATA : out std_logic_vector(7 downto 0));
end cache_space;

architecture structural of cache_space is
  component wire
    port(input  : in  std_logic;
         output : out std_logic);
  end component;
  component high
    port(output : out std_logic);
    end component;
  component and2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;
  component cache
    port(BYTE_ADR  : in  std_logic_vector(1 downto 0);
       IN_DATA   : in  std_logic_vector(7 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_EN  : in  std_logic;
       READ_EN   : in  std_logic;
       OUT_DATA  : out std_logic_vector(7 downto 0));
  end component;
  component tag
  port(IN_TAG    : in  std_logic_vector(2 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_TAG : in  std_logic;
       TAG_MATCH : out std_logic);
  end component;
  component vbit
  port(IN_VBIT   : in  std_logic;
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_V   : in  std_logic;
       RESET     : in  std_logic;
       OUT_VBIT  : out std_logic);
  end component;
  component lru
  port(TMAVL      : in  std_logic;
       TMAVR      : in  std_logic;
       BLOCK_SEL  : in  std_logic_vector(7 downto 0);
       UPDATE_LRU : in  std_logic;
       FM         : in  std_logic;
       RESET      : in  std_logic;
       LRU        : out std_logic);
  end component;
  component decd3_8
  port(
    sel1:       in std_logic;
    sel2:       in std_logic;
    sel3:       in std_logic;
    output1:    out std_logic;
    output2:    out std_logic;
    output3:    out std_logic;
    output4:    out std_logic;
    output5:    out std_logic;
    output6:    out std_logic;
    output7:    out std_logic;
    output8:    out std_logic);
  end component;
  component lru_sel
  port(FM        : in  std_logic;
       LRU       : in  std_logic;
       TMAVL     : in  std_logic;
       TMAVR     : in  std_logic;
       OUT_LEFT  : out std_logic;
       OUT_RIGHT : out std_logic);
  end component;

  for wire_l, wire_r : wire use entity work.wire(structural);
  for high_vbit : high use entity work.high(structural);
  for and2_1_l, and2_1_r : and2_1 use entity work.and2_1(structural);
  for cache_left, cache_right : cache use entity work.cache(structural);
  for tag_left, tag_right : tag use entity work.tag(structural);
  for vbit_left, vbit_right : vbit use entity work.vbit(structural);
  for lru_1 : lru use entity work.lru(structural);
  for decd3_8_1 : decd3_8 use entity work.decd3_8(structural);
  for lru_sel_1 : lru_sel use entity work.lru_sel(structural);

  signal sel : std_logic_vector(7 downto 0);
  signal tag_l, tag_r, v_l, v_r, tvl, tvr, en_l, en_r, h_v, lru_bit : std_logic;

begin
  wire_l : wire port map(tvl, TMAVL);
  wire_r : wire port map(tvr, TMAVR);
  
  high_vbit : high port map(h_v);
  decd3_8_1 : decd3_8 port map(ADDRESS(2), ADDRESS(3), ADDRESS(4), sel(0), sel(1), sel(2), sel(3), sel(4), sel(5), sel(6), sel(7));

  lru_1 : lru port map(tvl, tvr, sel, UPDATE, FM, RESET, lru_bit);
  lru_sel_1: lru_sel port map(FM, lru_bit, tvl, tvr, en_l, en_r);
  
  vbit_left  : vbit port map(h_v, sel, en_l, FM, RESET, v_l);
  vbit_right : vbit port map(h_v, sel, en_r, FM, RESET, v_r);

  tag_left  : tag port map(ADDRESS(7 downto 5), sel, en_l, FM, tag_l);
  tag_right : tag port map(ADDRESS(7 downto 5), sel, en_r, FM, tag_r);

  and2_1_l : and2_1 port map(v_l, tag_l, tvl);
  and2_1_r : and2_1 port map(v_r, tag_r, tvr);
  
  cache_left  : cache port map(ADDRESS(1 downto 0), IN_DATA, sel, en_l, WRITE_EN, READ_EN, OUT_DATA);
  cache_right : cache port map(ADDRESS(1 downto 0), IN_DATA, sel, en_r, WRITE_EN, READ_EN, OUT_DATA);
end structural;
