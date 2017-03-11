-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_topentity_0 is
  port(arg    : in signed(15 downto 0);
       result : out signed(15 downto 0));
end;

architecture structural of polynomial_topentity_0 is
begin
  polynomial_polynomial_spolynomial_result : entity polynomial_polynomial_spolynomial
    port map
      (result => result
      ,eta1   => arg);
end;
