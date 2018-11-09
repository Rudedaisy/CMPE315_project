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
      Vdd	 	 : in  std_logic;
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
		 rst		 : in  std_logic;
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
  component data_muxed
    port (d_cpu	 : in  std_logic_vector(7 downto 0);
          d_mem	 : in  std_logic_vector(7 downto 0);
          fm	 : in  std_logic;
          data	 : out std_logic_vector(7 downto 0));
  end component;
  component a1_0_muxed
    port(a_orig	 : in  std_logic_vector(1 downto 0);
         a_alt	 : in  std_logic_vector(1 downto 0);
         fm	 : in  std_logic;
         address : out std_logic_vector(1 downto 0));
  end component;
  component wire
	port (
		 input   : in  std_logic;
		 output  : out std_logic);
  end component;
  
  for registers_1: registers use entity work.registers(structural);
  for cache_space_1: cache_space use entity work.cache_space(structural);
  for state_machine_1: state_machine use entity work.state_machine(structural);
  for data_muxed_1: data_muxed use entity work.data_muxed(structural);
  for a1_0_muxed_1: a1_0_muxed use entity work.a1_0_muxed(structural);
  for wire_1, wire_2, wire_3, wire_4, wire_5, wire_6, wire_7, wire_8: wire use entity work.wire(structural);
  
  signal R_W, TMAVL, TMAVR, rd_cache, wr_cache, fm, update_lru, a0_new, a1_new : std_logic;
  signal ADDRESS, DATA, MUXED_DATA : std_logic_vector(7 downto 0);
  signal MUXED_ADDRESS : std_logic_vector(1 downto 0);
  
begin
  
  -- Address, data, and rd_wr registers
  registers_1: registers port map (cpu_add, cpu_data, cpu_rd_wrn, start, clk, ADDRESS, DATA, R_W);
  
  -- State machine
  state_machine_1: state_machine port map (start, reset, R_W, TMAVL, TMAVR, clk, busy, rd_cache, wr_cache, fm, update_lru, mem_en, a0_new, a1_new);

  -- Cache space [out_data is tied to inout cpu_data bus]
  cache_space_1: cache_space port map (	ADDRESS(7 downto 2) => ADDRESS(7 downto 2), 
										ADDRESS(1 downto 0) => MUXED_ADDRESS, 
										IN_DATA => MUXED_DATA, 
										WRITE_EN => wr_cache, 
										READ_EN => rd_cache, 
										FM => fm, 
										UPDATE => update_lru, 
										RESET => reset, 
										TMAVL => TMAVL, 
										TMAVR => TMAVR, 
										OUT_DATA => cpu_data);
  
  -- MUX data between CPU and memory
  data_muxed_1: data_muxed port map (DATA, mem_data, fm, MUXED_DATA);
  
  -- MUX address bits 1 and 0 
  a1_0_muxed_1: a1_0_muxed port map (a_orig => ADDRESS(1 downto 0), a_alt(1) => a1_new, a_alt(0) => a0_new, fm => fm, address => MUXED_ADDRESS);
  
  -- Connect to memory
  wire_1: wire port map (ADDRESS(7), mem_add(7));
  wire_2: wire port map (ADDRESS(6), mem_add(6));
  wire_3: wire port map (ADDRESS(5), mem_add(5));
  wire_4: wire port map (ADDRESS(4), mem_add(4));
  wire_5: wire port map (ADDRESS(3), mem_add(3));
  wire_6: wire port map (ADDRESS(2), mem_add(2));
  wire_7: wire port map (MUXED_ADDRESS(1), mem_add(1));
  wire_8: wire port map (MUXED_ADDRESS(0), mem_add(0));
  
end structural;
