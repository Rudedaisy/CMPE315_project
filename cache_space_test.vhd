--
-- Entity: cache_space_test
-- Architecture: test
-- Author: hx41455
-- created on: 2018/11/5
--

library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity cache_space_test is
end cache_space_test;

architecture test of cache_space_test is
  component cache_space
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
  end component;

  for cache_space_1 : cache_space use entity work.cache_space(structural);
  signal ADDRESS, IN_DATA, OUT_DATA : std_logic_vector(7 downto 0);
  signal RESET, WRITE_EN, READ_EN, FM, UPDATE, TMAVL, TMAVR : std_logic;
  
