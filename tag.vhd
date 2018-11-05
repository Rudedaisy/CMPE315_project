--
-- Entity: tag
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity tag is
  port(IN_TAG    : in  std_logic_vector(2 downto 0);
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_TAG : in  std_logic;
       TAG_MATCH : out std_logic);
end tag;

architecture structural of tag is
  component tag_block
    port(d   : in  std_logic_vector(2 downto 0);
         w   : in  std_logic;
         r   : in  std_logic;
         q   : out std_logic_vector(2 downto 0));
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
  
  for tag_block_0,
    tag_block_1,
    tag_block_2,
    tag_block_3,
    tag_block_4,
    tag_block_5,
    tag_block_6,
    tag_block_7 : tag_block use entity work.tag_block(structural);
  for and3_1_0,
    and3_1_1,
    and3_1_2,
    and3_1_3,
    and3_1_4,
    and3_1_5,
    and3_1_6,
    and3_1_7 : and3_1 use entity work.and3_1(structural);
  for comp3x2_1_1 : comp3x2_1 use entity work.comp3x2_1(structural);

  
  signal w : std_logic_vector(7 downto 0);
  signal OUT_TAG : std_logic_vector(2 downto 0);

begin
  and3_1_0 :  and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_TAG, w(0));
  and3_1_1 :  and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_TAG, w(1));
  and3_1_2 :  and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_TAG, w(2));
  and3_1_3 :  and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_TAG, w(3));
  and3_1_4 :  and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_TAG, w(4));
  and3_1_5 :  and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_TAG, w(5));
  and3_1_6 :  and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_TAG, w(6));
  and3_1_7 :  and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_TAG, w(7));

  tag_block_0 : tag_block port map(IN_TAG, w(0), BLOCK_SEL(0), OUT_TAG);
  tag_block_1 : tag_block port map(IN_TAG, w(1), BLOCK_SEL(1), OUT_TAG);
  tag_block_2 : tag_block port map(IN_TAG, w(2), BLOCK_SEL(2), OUT_TAG);
  tag_block_3 : tag_block port map(IN_TAG, w(3), BLOCK_SEL(3), OUT_TAG);
  tag_block_4 : tag_block port map(IN_TAG, w(4), BLOCK_SEL(4), OUT_TAG);
  tag_block_5 : tag_block port map(IN_TAG, w(5), BLOCK_SEL(5), OUT_TAG);
  tag_block_6 : tag_block port map(IN_TAG, w(6), BLOCK_SEL(6), OUT_TAG);
  tag_block_7 : tag_block port map(IN_TAG, w(7), BLOCK_SEL(7), OUT_TAG);

  comp3x2_1_1 : comp3x2_1 port map(IN_TAG, OUT_TAG, TAG_MATCH);
end structural;
