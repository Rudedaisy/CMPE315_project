--
-- Entity: data_muxed
-- Architecture : structural
-- Author: ehanson1
-- Created On: 11/05/2018
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity data_muxed is

	port (
		d_cpu	 : in  std_logic_vector(7 downto 0);
		d_mem	 : in  std_logic_vector(7 downto 0);
		fm		 : in  std_logic;
		data	 : out std_logic_vector(7 downto 0));
end data_muxed;

architecture structural of data_muxed is

component mux2_1
	port (
		input1	 : in  std_logic;
		input2	 : in  std_logic;
		sel		 : in  std_logic;
		output   : out std_logic);
end component;

for mux2_1_1, mux2_1_2, mux2_1_3, mux2_1_4, mux2_1_5, mux2_1_6, mux2_1_7, mux2_1_8: mux2_1 use entity work.mux2_1(structural);

begin
	
	mux2_1_1: mux2_1 port map (d_mem(7), d_cpu(7), fm, data(7));
	mux2_1_2: mux2_1 port map (d_mem(6), d_cpu(6), fm, data(6));
	mux2_1_3: mux2_1 port map (d_mem(5), d_cpu(5), fm, data(5));
	mux2_1_4: mux2_1 port map (d_mem(4), d_cpu(4), fm, data(4));
	mux2_1_5: mux2_1 port map (d_mem(3), d_cpu(3), fm, data(3));
	mux2_1_6: mux2_1 port map (d_mem(2), d_cpu(2), fm, data(2));
	mux2_1_7: mux2_1 port map (d_mem(1), d_cpu(1), fm, data(1));
	mux2_1_8: mux2_1 port map (d_mem(0), d_cpu(0), fm, data(0));

end structural;