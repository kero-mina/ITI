LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator IS
   Port( a : IN  std_logic_vector (7 DOWNTO 0);
         b: IN std_logic_vector (7 DOWNTO 0);
         equal_out : OUT std_logic;
         not_equal_out: OUT std_logic);
END ENTITY comparator;

ARCHITECTURE Behavioral OF comparator IS
BEGIN
   cp: PROCESS (a, b) IS
     PROCEDURE compare(in_1, in_2: IN std_logic_vector;
                       equal, not_equal: OUT std_logic) IS
     BEGIN
       IF a = b THEN
         equal := '1';
         not_equal := '0';
       ELSE
         equal := '0';
         not_equal := '1';
       END IF;
     END PROCEDURE compare;

     VARIABLE equal, not_equal: std_logic;
   BEGIN
     compare(a, b, equal, not_equal);
     equal_out <= equal;
     not_equal_out <= not_equal;
   END PROCESS cp;
END ARCHITECTURE Behavioral;
