--
-- entity: register_cell
-- architecture: structural
-- author: hx41455
-- created on: 2018/11/1
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity register_cell is
  port(d   : in  std_logic;
       w   : in  std_logic;
       clk : in  std_logic;
       q   : out std_logic);
end register_cell;

architecture structural of register_cell is
  component dff
    port(d    : in  std_logic;
         clk  : in  std_logic;
         q    : out std_logic;
         qbar : out std_logic);
  end component;
  component and2_1
    port(input1 : in  std_logic;
         input2 : in  std_logic;
         output : out std_logic);
  end component;

  for dff_1    : dff    use entity work.dff(structural);
  for and2_1_1 : and2_1 use entity work.and2_1(structural);

  signal temp1, trash : std_logic;

begin
  and2_1_1 : and2_1 port map(clk, w, temp1);
  dff_1    : dff    port map(d, temp1, q, trash);
end structural;
