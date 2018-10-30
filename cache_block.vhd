--
-- Entity: cache_block
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity cache_block is
  port(
    adr:        in std_logic_vector(1 downto 0);
    d:          in std_logic_vector(7 downto 0);
    w:          in std_logic;
    r:          in std_logic;
    s:          in std_logic;
    clk:        in std_logic;
    q:          out std_logic_vector(7 downto 0);
end cache_block;

architecture structural of cache_block is
  component cache_byte
    port(
      d:          in std_logic_vector(7 downto 0);
      w:          in std_logic;
      r:          in std_logic;
      clk:        in std_logic;
      q:          out std_logic_vector(7 downto 0));
  end component;
  component dmx2_4
    port(
      sel:       in std_logic_vector(1 downto 0);
      en:         in std_logic;
      output1:    out std_logic;
      output2:    out std_logic;
      output3:    out std_logic;
      output4:    out std_logic);
  end component;
  component and2_1
    port(
      input1:   in std_logic;
      input2:   in std_logic;
      output:   out std_logic);
  end component;

  for cache_byte_1,
    cache_byte_2,
    cache_byte_3,
    cache_byte_4: use entity work.cache_byte(structural);
  for dmx2_4_1: use entity work.dmx2_4(structural);
  for and2_1_1,
    and2_1_2,
    and2_1_3,
    and2_1_4,
    and2_1_5,
    and2_1_6,
    and2_1_7,
    and2_1_8: use entity work.and2_1(structural);

  signal w00,w01,w10,w11,r00,r01,r10,r11,s00,s01,s10,s11: std_logic;

begin
  dmx2_4_1:     dmx2_4 port map(adr,s,s00,s01,s10,s11);
    
  cache_byte_1: cache_byte port map(d,w00,r00,clk,q);
  cache_byte_2: cache_byte port map(d,w01,r01,clk,q);
  cache_byte_3: cache_byte port map(d,w10,r10,clk,q);
  cache_byte_4: cache_byte port map(d,w11,r11,clk,q);

  and2_1_1:     and2_1 port map(w,s00,w00);
  and2_1_2:     and2_1 port map(w,s01,w01);
  and2_1_3:     and2_1 port map(w,s10,w10);
  and2_1_4:     and2_1 port map(w,s11,w11);
  and2_1_5:     and2_1 port map(r,s00,r00);
  and2_1_6:     and2_1 port map(r,s01,r01);
  and2_1_7:     and2_1 port map(r,s10,r10);
  and2_1_8:     and2_1 port map(r,s11,r11);
end structural;
