-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_topentity is
  port(input_0  : in signed(15 downto 0);
       output_0 : out signed(15 downto 0));
end;

architecture structural of polynomial_topentity is
begin
  polynomial_topentity_0_inst : entity polynomial_topentity_0
    port map
      (arg    => input_0
      ,result => output_0);
end;
