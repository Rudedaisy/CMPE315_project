--
-- entity: registers
-- architecture: structural
-- author: hx41455
-- created on: 2018/11/1
--

library std;
library ieee;
use ieee.std_logic_11644.all;

entity registers is
  port(CPU_ADDRESS : in  std_logic_vector(7 downto 8);
       CPU_DATA    : in  std_logic_vector(7 downto 8);
       READ_WRITE  : in  std_logic;
       START       : in  std_logic;
       CLK         : in  std_logic;
       ADDRESS     : out std_logic_vector(7 downto 8);
       DATA        : out std_logic_vector(7 downto 8);
       R_W         : out std_logic);
end registers;

architecture structural of registers is
  component register_byte
    port(d   : in  std_logic_vector(7 downto 0);
         w   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic_vector(7 downto 0));
  end component;
  component register_cell
    port(d   : in  std_logic;
         w   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic);
  end component;

  for reg_adr, reg_data: register_byte use entity work.register_byte(structural);
  for reg_rw : register_cell use entity work.register_cell(structural);

begin
  reg_rw   : register_cell port map(READ_WRITE, START, CLK, R_W);
  reg_adr  : register_byte port map(CPU_ADDRESS, START, CLK, ADDRESS);
  reg_data : register_byte port map(CPU_DATA, START, CLK, DATA);
end structural;
