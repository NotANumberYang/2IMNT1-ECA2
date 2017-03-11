-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_topentity_0 is
  port(eta    : in polynomial_types.tup5;
       eta1   : in signed(15 downto 0);
       result : out signed(15 downto 0));
end;

architecture structural of polynomial_topentity_0 is
  signal a0            : signed(15 downto 0);
  signal a13           : signed(15 downto 0);
  signal a12           : signed(15 downto 0);
  signal a11           : signed(15 downto 0);
  signal a10           : signed(15 downto 0);
  signal result_0      : signed(15 downto 0);
  signal a14           : polynomial_types.array_of_signed_16(0 to 1);
  signal ws            : polynomial_types.array_of_signed_16(0 to 2);
  signal a14_app_arg   : polynomial_types.array_of_signed_16(0 to 1);
  signal a14_app_arg_0 : polynomial_types.array_of_signed_16(0 to 1);
  signal a14_app_arg_1 : polynomial_types.array_of_signed_16(0 to 0);
  signal result_1      : signed(15 downto 0);
  signal result_2      : signed(15 downto 0);
  signal x             : signed(15 downto 0);
  signal result_3      : signed(15 downto 0);
  signal result_4      : signed(15 downto 0);
  signal result_5      : signed(15 downto 0);
  signal result_6      : signed(15 downto 0);
  signal result_7      : signed(15 downto 0);
  signal x_0           : signed(15 downto 0);
begin
  result <= result_0;
  
  a0 <= eta.tup5_sel4;
  
  a13 <= eta.tup5_sel3;
  
  a12 <= eta.tup5_sel2;
  
  a11 <= eta.tup5_sel1;
  
  a10 <= eta.tup5_sel0;
  
  -- last begin 
  result_0 <= ws(ws'high);
  -- last end
  
  -- zipWith begin
  zipwith : for i in a14'range generate
  begin
    polynomial_topentity_specf_0 : entity polynomial_topentity_specf
  port map
  (result => a14(i)
  ,x => a14_app_arg_0(i)
  ,y => a14_app_arg(i));
  end generate;
  -- zipWith end
  
  ws <= polynomial_types.array_of_signed_16'(signed'(to_signed(0,16)) & a14);
  
  -- init begin
  a14_app_arg <= ws(0 to ws'high - 1);
  -- init end
  
  a14_app_arg_0 <= polynomial_types.array_of_signed_16'(signed'(result_1) & a14_app_arg_1);
  
  a14_app_arg_1 <= polynomial_types.array_of_signed_16'(0 => a0);
  
  result_1 <= resize(result_2 * eta1, 16);
  
  result_2 <= result_3 + a13;
  
  x <= resize(a12 * eta1, 16);
  
  result_3 <= result_5 + x;
  
  result_4 <= resize(a11 * x_0, 16);
  
  result_5 <= result_6 + result_4;
  
  result_6 <= resize(a10 * result_7, 16);
  
  result_7 <= resize(x_0 * eta1, 16);
  
  x_0 <= resize(eta1 * eta1, 16);
end;
