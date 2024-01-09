library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;

ENTITY bin2gray IS
  GENERIC (n: positive := 4);
  PORT (input:  IN bit_vector (n-1 DOWNTO 0);
        output: OUT bit_vector (n-1 DOWNTO 0));
END ENTITY bin2gray;

ARCHITECTURE gen_process of bin2gray IS
BEGIN
  outer: FOR index IN n-1 DOWNTO 0 GENERATE

    msb: IF index = n-1 GENERATE
      msb_p: PROCESS (input) IS
      BEGIN
        output(n-1) <= input(n-1);
      END PROCESS msb_p;
    END GENERATE msb;

    bits: IF index < n-1 GENERATE
      bits_p: PROCESS (input) IS
      BEGIN
        output(index) <= input(index + 1) XOR input(index);
      END PROCESS bits_p;
    END GENERATE bits;

  END GENERATE outer;
END ARCHITECTURE gen_process;
