--
-- Entity: tag_block
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity tag_block is
  port(d : in  std_logic_vector(2 downto 0);
       w : in  std_logic;
       r : in  std_logic;
       q : out std_logic_vector(2 downto 0));
end tag_block;

architecture structural of tag_block is
  component cache_cell
    port(d : in  std_logic;
         w : in  std_logic;
         r : in  std_logic;
         q : out std_logic);
  end component;

  for cache_cell_1,
    cache_cell_2,
    cache_cell_3 : cache_cell use entity work.cache_cell(structural);

begin
  cache_cell_1 : cache_cell port map (d(0),w,r,q(0));
  cache_cell_2 : cache_cell port map (d(1),w,r,q(1));
  cache_cell_3 : cache_cell port map (d(2),w,r,q(2));
end structural;
