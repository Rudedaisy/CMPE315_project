
--
-- Entity: vbit
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity vbit is
  port(IN_VBIT   : in  std_logic;
       BLOCK_SEL : in  std_logic_vector(7 downto 0);
       CACHE_EN  : in  std_logic;
       WRITE_V   : in  std_logic;
       RESET     : in  std_logic;
       OUT_VBIT  : out std_logic);
end vbit;

architecture structural of vbit is
  component cache_cell_reset
    port(d   : in  std_logic;
         w   : in  std_logic;
         r   : in  std_logic;
         rst : in  std_logic;
         q   : out std_logic);
  end component;
  component and3_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         input3 : in  std_logic;
         output : out std_logic);
  end component;

  for cache_cell_reset_0,
    cache_cell_reset_1,
    cache_cell_reset_2,
    cache_cell_reset_3,
    cache_cell_reset_4,
    cache_cell_reset_5,
    cache_cell_reset_6,
    cache_cell_reset_7 : cache_cell_reset use entity work.cache_cell_reset(structural);
  for and3_1_0,
    and3_1_1,
    and3_1_2,
    and3_1_3,
    and3_1_4,
    and3_1_5, 
    and3_1_6,
    and3_1_7 : and3_1 use entity work.and3_1(structural);
  
  signal w : std_logic_vector(7 downto 0);

begin
  and3_1_0 : and3_1 port map(BLOCK_SEL(0), CACHE_EN, WRITE_V, w(0));
  and3_1_1 : and3_1 port map(BLOCK_SEL(1), CACHE_EN, WRITE_V, w(1));
  and3_1_2 : and3_1 port map(BLOCK_SEL(2), CACHE_EN, WRITE_V, w(2));
  and3_1_3 : and3_1 port map(BLOCK_SEL(3), CACHE_EN, WRITE_V, w(3));
  and3_1_4 : and3_1 port map(BLOCK_SEL(4), CACHE_EN, WRITE_V, w(4));
  and3_1_5 : and3_1 port map(BLOCK_SEL(5), CACHE_EN, WRITE_V, w(5));
  and3_1_6 : and3_1 port map(BLOCK_SEL(6), CACHE_EN, WRITE_V, w(6));
  and3_1_7 : and3_1 port map(BLOCK_SEL(7), CACHE_EN, WRITE_V, w(7));

  cache_cell_reset_0 : cache_cell_reset port map(IN_VBIT, w(0), BLOCK_SEL(0), RESET, OUT_VBIT);
  cache_cell_reset_1 : cache_cell_reset port map(IN_VBIT, w(1), BLOCK_SEL(1), RESET, OUT_VBIT);
  cache_cell_reset_2 : cache_cell_reset port map(IN_VBIT, w(2), BLOCK_SEL(2), RESET, OUT_VBIT);
  cache_cell_reset_3 : cache_cell_reset port map(IN_VBIT, w(3), BLOCK_SEL(3), RESET, OUT_VBIT);
  cache_cell_reset_4 : cache_cell_reset port map(IN_VBIT, w(4), BLOCK_SEL(4), RESET, OUT_VBIT);
  cache_cell_reset_5 : cache_cell_reset port map(IN_VBIT, w(5), BLOCK_SEL(5), RESET, OUT_VBIT);
  cache_cell_reset_6 : cache_cell_reset port map(IN_VBIT, w(6), BLOCK_SEL(6), RESET, OUT_VBIT);
  cache_cell_reset_7 : cache_cell_reset port map(IN_VBIT, w(7), BLOCK_SEL(7), RESET, OUT_VBIT);
end structural;
