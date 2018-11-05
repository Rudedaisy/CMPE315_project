--
-- Entity: comp3x2_1
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity comp3x2_1 is
  port(input1 : in  std_logic_vector(2 downto 0);
       input2 : in  std_logic_vector(2 downto 0);
       output : out std_logic);
end comp3x2_1;

architecture structural of comp3x2_1 is
  component xor2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;
  component nor3_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         input3 : in  std_logic;
         output : out std_logic);
  end component;

  for xor2_1_1, xor2_1_2, xor2_1_3 : xor2_1 use entity work.xor2_1(structural);
  for nor3_1_1 : nor3_1 use entity work.nor3_1(structural);

  signal t1, t2, t3: std_logic;

begin
  xor2_1_1 : xor2_1 port map(input1(0), input2(0), t1);
  xor2_1_2 : xor2_1 port map(input1(1), input2(1), t1);
  xor2_1_3 : xor2_1 port map(input1(2), input2(2), t2);

  nor3_1_1 : nor3_1 port map(t1, t2, t3, output);
end structural;
