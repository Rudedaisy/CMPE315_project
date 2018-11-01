--
-- Entity: cache_byte
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity cache_byte is
  port(d : in  std_logic_vector(7 downto 0);
       w : in  std_logic;
       r : in  std_logic;
       q : out std_logic_vector(7 downto 0));
end cache_byte;

architecture structural of cache_byte is
  component cache_cell
    port(d : in  std_logic;
         w : in  std_logic;
         r : in  std_logic;
         q : out std_logic);
  end component;

  for cache_cell_1,
    cache_cell_2,
    cache_cell_3,
    cache_cell_4,
    cache_cell_5,
    cache_cell_6,
    cache_cell_7,
    cache_cell_8 : cache_cell use entity work.cache_cell(structural);

begin
  cache_cell_1 : cache_cell port map (d(0),w,r,q(0));
  cache_cell_2 : cache_cell port map (d(1),w,r,q(1));
  cache_cell_3 : cache_cell port map (d(2),w,r,q(2));
  cache_cell_4 : cache_cell port map (d(3),w,r,q(3));
  cache_cell_5 : cache_cell port map (d(4),w,r,q(4));
  cache_cell_6 : cache_cell port map (d(5),w,r,q(5));
  cache_cell_7 : cache_cell port map (d(6),w,r,q(6));
  cache_cell_8 : cache_cell port map (d(7),w,r,q(7));
end structural;
