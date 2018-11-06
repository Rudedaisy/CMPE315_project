--
-- Entity: chip
-- Architecture: structural
-- Author: hx41455
-- created on: 2018/11/5
--

library std;
library ieee;
use ieee.std_logic_1164.all;

entity chip is
  port (
      cpu_add    : in  std_logic_vector(7 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	 : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(7 downto 0));
end chip;

architecture structural of chip is
  component registers
    port(CPU_ADDRESS : in  std_logic_vector(7 downto 0);
       CPU_DATA    : in  std_logic_vector(7 downto 0);
       READ_WRITE  : in  std_logic;
       START       : in  std_logic;
       CLK         : in  std_logic;
       ADDRESS     : out std_logic_vector(7 downto 0);
       DATA        : out std_logic_vector(7 downto 0);
       R_W         : out std_logic);
  end component;
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
  component state_machine
    port(start	     : in  std_logic;
         rd_wr	     : in  std_logic;
         tmavl	     : in  std_logic;
         tmavr	     : in  std_logic;
         clk         : in  std_logic;
         busy        : out std_logic;
         rd_cache    : out std_logic;
         wr_cache    : out std_logic;
         fm   	     : out std_logic;
         update_lru  : out std_logic;
         mem_en      : out std_logic;
         a0_new	     : out std_logic;
         a1_new	     : out std_logic);
  end component;
  
end structural;
