library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package polynomial_types is
  type array_of_signed_16 is array (integer range <>) of signed(15 downto 0);
  type tup5 is record
    tup5_sel0 : signed(15 downto 0);
    tup5_sel1 : signed(15 downto 0);
    tup5_sel2 : signed(15 downto 0);
    tup5_sel3 : signed(15 downto 0);
    tup5_sel4 : signed(15 downto 0);
  end record;
  function toSLV (s : in signed) return std_logic_vector;
  function toSLV (value :  polynomial_types.array_of_signed_16) return std_logic_vector;
  function toSLV (p : polynomial_types.tup5) return std_logic_vector;
end;

package body polynomial_types is
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function toSLV (value :  polynomial_types.array_of_signed_16) return std_logic_vector is
    alias ivalue    : polynomial_types.array_of_signed_16(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 16);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 16) + 1 to i*16) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function toSLV (p : polynomial_types.tup5) return std_logic_vector is
  begin
    return (toSLV(p.tup5_sel0) & toSLV(p.tup5_sel1) & toSLV(p.tup5_sel2) & toSLV(p.tup5_sel3) & toSLV(p.tup5_sel4));
  end;
end;
