-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_polynomial_spolynomial is
  port(eta5   : in signed(15 downto 0);
       result : out signed(15 downto 0));
end;

architecture structural of polynomial_polynomial_spolynomial is
  signal x        : signed(15 downto 0);
  signal result_0 : signed(15 downto 0);
  signal result_1 : signed(15 downto 0);
  signal result_2 : signed(15 downto 0);
  signal result_3 : signed(15 downto 0);
  signal result_4 : signed(15 downto 0);
  signal result_5 : signed(15 downto 0);
  signal result_6 : signed(15 downto 0);
  signal result_7 : signed(15 downto 0);
  signal x_0      : signed(15 downto 0);
begin
  result <= result_0 + to_signed(1,16);
  
  x <= resize(to_signed(2,16) * eta5, 16);
  
  result_0 <= result_2 + x;
  
  result_1 <= resize(to_signed(3,16) * x_0, 16);
  
  result_2 <= result_4 + result_1;
  
  result_3 <= resize(to_signed(4,16) * result_7, 16);
  
  result_4 <= result_5 + result_3;
  
  result_5 <= resize(to_signed(5,16) * result_6, 16);
  
  result_6 <= resize(result_7 * eta5, 16);
  
  result_7 <= resize(x_0 * eta5, 16);
  
  x_0 <= resize(eta5 * eta5, 16);
end;
