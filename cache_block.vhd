--
-- Entity: cache_block
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity cache_block is
  port(adr : in  std_logic_vector(1 downto 0);
       d   : in  std_logic_vector(7 downto 0);
       w   : in  std_logic;
       r   : in  std_logic;
       q   : out std_logic_vector(7 downto 0));
end cache_block;

architecture structural of cache_block is
  component cache_byte
    port(d : in  std_logic_vector(7 downto 0);
         w : in  std_logic;
         r : in  std_logic;
         q : out std_logic_vector(7 downto 0));
  end component;
  component dmx2_4
    port(sel     : in  std_logic_vector(1 downto 0);
         en      : in  std_logic;
         output1 : out std_logic;
         output2 : out std_logic;
         output3 : out std_logic;
         output4 : out std_logic);
  end component;

  for cache_byte_0,
    cache_byte_1,
    cache_byte_2,
    cache_byte_3 : cache_byte use entity work.cache_byte(structural);
  for dmx2_4_1, dmx2_4_2 : dmx2_4 use entity work.dmx2_4(structural);

  signal we, re : std_logic_vector(3 downto 0);

begin
  dmx2_4_1     : dmx2_4     port map(adr,w,we(0),we(1),we(2),we(3));
  dmx2_4_2     : dmx2_4     port map(adr,r,re(0),re(1),re(2),re(3));
    
  cache_byte_0 : cache_byte port map(d,we(0),re(0),q);
  cache_byte_1 : cache_byte port map(d,we(1),re(1),q);
  cache_byte_2 : cache_byte port map(d,we(2),re(2),q);
  cache_byte_3 : cache_byte port map(d,we(3),re(3),q);
end structural;
