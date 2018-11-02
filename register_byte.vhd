--
-- entity: register_byte
-- architecture: structural
-- author: hx41455
-- created on: 2018/11/1
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity register_byte is
  port(d   : in  std_logic_vector(7 downto 0);
       w   : in  std_logic;
       clk : in  std_logic;
       q   : out std_logic_vector(7 downto 0));
end register_byte;

architecture structural of register_byte is
  component register_cell
    port(d   : in  std_logic;
         w   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic);
  end component;

  for reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : register_cell use entity work.register_cell(structural);

begin
  reg1 : register_cell port map(d(0), w, clk, q(0));
  reg2 : register_cell port map(d(1), w, clk, q(1));
  reg3 : register_cell port map(d(2), w, clk, q(2));
  reg4 : register_cell port map(d(3), w, clk, q(3));
  reg5 : register_cell port map(d(4), w, clk, q(4));
  reg6 : register_cell port map(d(5), w, clk, q(5));
  reg7 : register_cell port map(d(6), w, clk, q(6));
  reg8 : register_cell port map(d(7), w, clk, q(7));
end structural;
