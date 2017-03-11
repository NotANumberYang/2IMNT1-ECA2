-- Automatically generated VHDL-93
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use std.textio.all;
use work.all;
use work.polynomial_types.all;

entity polynomial_polynomial_spolynomial is
  port(eta1   : in signed(15 downto 0);
       result : out signed(15 downto 0));
end;

architecture structural of polynomial_polynomial_spolynomial is
  signal a15           : polynomial_types.array_of_signed_16(0 to 4);
  signal ws            : polynomial_types.array_of_signed_16(0 to 5);
  signal a15_app_arg   : polynomial_types.array_of_signed_16(0 to 4);
  signal a15_app_arg_0 : polynomial_types.array_of_signed_16(0 to 4);
  signal a15_app_arg_1 : polynomial_types.array_of_signed_16(0 to 3);
  signal a15_app_arg_2 : polynomial_types.array_of_signed_16(0 to 2);
  signal a15_app_arg_3 : polynomial_types.array_of_signed_16(0 to 1);
  signal a15_app_arg_4 : signed(15 downto 0);
  signal result_0      : signed(15 downto 0);
  signal result_1      : signed(15 downto 0);
  signal result_2      : signed(15 downto 0);
  signal result_3      : signed(15 downto 0);
  signal result_4      : signed(15 downto 0);
  signal x             : signed(15 downto 0);
begin
  -- last begin 
  result <= ws(ws'high);
  -- last end
  
  -- zipWith begin
  zipwith : for i in a15'range generate
  begin
    polynomial_polynomial_spolynomial_specf_0 : entity polynomial_polynomial_spolynomial_specf
  port map
  (result => a15(i)
  ,x => a15_app_arg_0(i)
  ,y => a15_app_arg(i));
  end generate;
  -- zipWith end
  
  ws <= polynomial_types.array_of_signed_16'(signed'(to_signed(0,16)) & a15);
  
  -- init begin
  a15_app_arg <= ws(0 to ws'high - 1);
  -- init end
  
  a15_app_arg_0 <= polynomial_types.array_of_signed_16'(signed'(result_2) & a15_app_arg_1);
  
  a15_app_arg_1 <= polynomial_types.array_of_signed_16'(signed'(result_1) & a15_app_arg_2);
  
  a15_app_arg_2 <= polynomial_types.array_of_signed_16'(signed'(result_0) & a15_app_arg_3);
  
  a15_app_arg_3 <= polynomial_types.array_of_signed_16'(a15_app_arg_4
                                                       ,to_signed(1,16));
  
  a15_app_arg_4 <= resize(to_signed(3,16) * eta1, 16);
  
  result_0 <= resize(to_signed(7,16) * x, 16);
  
  result_1 <= resize(to_signed(15,16) * result_4, 16);
  
  result_2 <= resize(to_signed(31,16) * result_3, 16);
  
  result_3 <= resize(result_4 * eta1, 16);
  
  result_4 <= resize(x * eta1, 16);
  
  x <= resize(eta1 * eta1, 16);
end;
