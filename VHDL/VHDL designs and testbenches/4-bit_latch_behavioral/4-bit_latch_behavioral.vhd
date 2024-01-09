library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.all;

ENTITY latch4 IS
  PORT( d: IN bit_vector(3 DOWNTO 0);
        en,clk: IN bit;
        q: OUT bit_vector(3 DOWNTO 0));
END ENTITY latch4;

ARCHITECTURE behav OF latch4 IS
BEGIN
  P2: PROCESS IS
    VARIABLE x: bit_vector (3 DOWNTO 0);
  BEGIN
    IF en = '1' AND clk = '1' THEN 
      x := d;
    END IF;
    q <= x;
    WAIT ON d, en, clk;
  END PROCESS P2;
END ARCHITECTURE behav;
