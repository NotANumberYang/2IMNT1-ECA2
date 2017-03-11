-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_polynomial_spolynomial_specf is
  port(x      : in signed(15 downto 0);
       y      : in signed(15 downto 0);
       result : out signed(15 downto 0));
end;

architecture structural of polynomial_polynomial_spolynomial_specf is
begin
  result <= y + x;
end;
