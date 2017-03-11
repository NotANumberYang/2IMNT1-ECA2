-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_topentity is
  port(input_0_0 : in signed(15 downto 0);
       input_0_1 : in signed(15 downto 0);
       input_0_2 : in signed(15 downto 0);
       input_0_3 : in signed(15 downto 0);
       input_0_4 : in signed(15 downto 0);
       input_1   : in signed(15 downto 0);
       output_0  : out signed(15 downto 0));
end;

architecture structural of polynomial_topentity is
  signal input_0 : polynomial_types.tup5;
begin
  input_0 <= (tup5_sel0 => input_0_0
             ,tup5_sel1 => input_0_1
             ,tup5_sel2 => input_0_2
             ,tup5_sel3 => input_0_3
             ,tup5_sel4 => input_0_4);
  
  polynomial_topentity_0_inst : entity polynomial_topentity_0
    port map
      (eta    => input_0
      ,eta1   => input_1
      ,result => output_0);
end;
