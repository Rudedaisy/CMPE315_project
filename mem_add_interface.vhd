--
-- Entity: mem_add_interface
-- Architecture: structural
-- Author: ehanson1
-- created on: 11/11/2018
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mem_add_interface is
  port(
    in_address: in std_logic_vector(7 downto 0);
    mem_en:		in std_logic;
    mem_add:    out std_logic_vector(7 downto 0));
end mem_add_interface;

architecture structural of mem_add_interface is
  component inv
    port(
      input:    in std_logic;
      output:   out std_logic);
  end component;
  component tx                     
    port ( sel   : in std_logic;
           selnot: in std_logic;
           input : in std_logic;
           output: out std_logic);
  end component;

for inv_1 : inv use entity work.inv(structural);
for tx_1, tx_2, tx_3, tx_4, tx_5, tx_6, tx_7, tx_8: tx use entity work.tx(structural);

  signal not_mem_en : std_logic;

begin

  inv_1: inv port map(mem_en, not_mem_en);

  tx_1: tx port map (mem_en, not_mem_en, in_address(7), mem_add(7));
  tx_2: tx port map (mem_en, not_mem_en, in_address(6), mem_add(6));
  tx_3: tx port map (mem_en, not_mem_en, in_address(5), mem_add(5));
  tx_4: tx port map (mem_en, not_mem_en, in_address(4), mem_add(4));
  tx_5: tx port map (mem_en, not_mem_en, in_address(3), mem_add(3));
  tx_6: tx port map (mem_en, not_mem_en, in_address(2), mem_add(2));
  tx_7: tx port map (mem_en, not_mem_en, in_address(1), mem_add(1));
  tx_8: tx port map (mem_en, not_mem_en, in_address(0), mem_add(0));

end structural;
