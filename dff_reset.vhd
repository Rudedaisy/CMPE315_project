--
-- Entity: dff_reset
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/1/2018
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity dff_reset is

	port(
		d    : in  std_logic;
		clk  : in  std_logic;
		rst	 : in  std_logic;
		q    : out std_logic;
		qbar : out std_logic);
end dff_reset;

architecture structural of dff_reset is

begin
  output: process

  begin
	if (rst = '1') then 
	  q <= '0';
	  qbar <= '1';
	end if;
    wait until ( clk'EVENT and clk = '0' );
    q <= d;
    qbar <= not d ;
  end process output;

end structural;

