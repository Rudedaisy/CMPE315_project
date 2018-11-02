--
-- Entity: tag
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity tag is
  port(IN_TAG    : in  std_logic_vector(2 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_TAG : in  std_logic;
       READ_TAG  : in  std_logic;
       TAG_MATCH : out std_logic);
end tag;

architecture structural of tag is
  component tag_block
    port(d   : in  std_logic_vector(3 downto 0);
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
  component comp3x2_1
    port(input1 : in  std_logic_vector(2 downto 0);
         input2 : in  std_logic_vector(2 downto 0);
         output : out std_logic);
  end component;
  
  for tag_block_1,
    tag_block_2,
    tag_block_3,
    tag_block_4,
    tag_block_5,
    tag_block_6,
    tag_block_7,
    tag_block_8 : tag_block use entity work.tag_block(structural);
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
  for comp3x2_1_1 : comp3x2_1 use entity work.comp3x2_1(structural);

  
  signal w000,w001,w010,w011,w100,w101,w110,w111,
    r000,r001,r010,r011,r100,r101,r110,r111 : std_logic;
  signal OUT_TAG : std_logic_vector(2 downto 0);

begin
  and3_1_1 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_TAG, w000);
  and3_1_2 :  and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_TAG, w001);
  and3_1_3 :  and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_TAG, w010);
  and3_1_4 :  and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_TAG, w011);
  and3_1_5 :  and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_TAG, w100);
  and3_1_6 :  and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_TAG, w101);
  and3_1_7 :  and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_TAG, w110);
  and3_1_8 :  and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_TAG, w111);

  and3_1_9 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, READ_TAG, r000);
  and3_1_10 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, READ_TAG, r001);
  and3_1_11 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, READ_TAG, r010);
  and3_1_12 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, READ_TAG, r011);
  and3_1_13 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, READ_TAG, r100);
  and3_1_14 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, READ_TAG, r101);
  and3_1_15 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, READ_TAG, r110);
  and3_1_16 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, READ_TAG, r111);

  tag_block_1 : tag_block port map(IN_TAG, w000, r000, OUT_TAG);
  tag_block_2 : tag_block port map(IN_TAG, w001, r001, OUT_TAG);
  tag_block_3 : tag_block port map(IN_TAG, w010, r010, OUT_TAG);
  tag_block_4 : tag_block port map(IN_TAG, w011, r011, OUT_TAG);
  tag_block_5 : tag_block port map(IN_TAG, w100, r100, OUT_TAG);
  tag_block_6 : tag_block port map(IN_TAG, w101, r101, OUT_TAG);
  tag_block_7 : tag_block port map(IN_TAG, w110, r110, OUT_TAG);
  tag_block_8 : tag_block port map(IN_TAG, w111, r111, OUT_TAG);

  comp3x2_1_1 : comp3x2_1 port map(IN_TAG, OUT_TAG, TAG_MATCH);
end structural;
