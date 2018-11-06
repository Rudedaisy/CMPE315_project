--
-- Entity: cache_space_test
-- Architecture: test
-- Author: hx41455
-- created on: 2018/11/5
--

library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity cache_space_test is
end cache_space_test;

architecture test of cache_space_test is
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

  for cache_space_1 : cache_space use entity work.cache_space(structural);
  signal ADDRESS, IN_DATA, OUT_DATA : std_logic_vector(7 downto 0);
  signal clock, RESET, WRITE_EN, READ_EN, FM, UPDATE, TMAVL, TMAVR : std_logic;

begin

  cache_space_1 : cache_space port map(ADDRESS, IN_DATA, WRITE_EN, READ_EN, FM, UPDATE, RESET, TMAVL, TMAVR, OUT_DATA);

  clk : process
  begin
    clock <= '0','1' after 5ns;
             wait for 10 ns;
  end process clk;

  io_process : process
    file infile  : text is in  "cache_space_test_in.txt";
    file outfile : text is out "cache_space_test_out.txt";
    variable adr, indata, outdata : std_logic_vector(7 downto 0);
    
    variable wr,rd,frommem,upd,rst,tvl,tvr : std_logic;
    variable buf : line;

--
-- FILE STRUCTURE --
-- OP       -- operation name
-- CLKS     -- clock cycles this should take    
-- xxxxxxxx -- ADDRESS
-- xxxxxxxx -- DATA
-- xxxxx    -- WE, RE, FM, UPD, RST,    
-- .....    -- repeat for case
-- ........ -- repeat for next operation
--    

  begin
    while not (endfile(infile)) loop
      readline(infile,buf);
      read(buf,adr);
      ADDRESS <= adr;
      readline(infile,buf);
      read(buf,indata);
      IN_DATA <= indata;
      readline(infile,buf);
      read(buf,wr);
      WRITE_EN <= wr;
      readline(infile,buf);
      read(buf,rd);
      READ_EN <= rd;
      readline(infile,buf);
      read(buf,frommem);
      FM <= frommem;
      readline(infile,buf);
      read(buf,upd);
      UPDATE <= upd;
      readline(infile,buf);
      read(buf,rst);
      RESET <= rst;

      wait until falling_edge(clock);
           
    end loop;
  end process io_process;
end test;
