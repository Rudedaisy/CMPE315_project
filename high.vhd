--
-- Entity: high
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/10/29
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity high is
  port(output : out std_logic);
end;

architecture structural of high is
begin
  output <= '1';
end structural;
