library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.log2;

package global_const is
	constant imageWidth : integer := 512; 
	constant lineDepth : integer := integer(log2(real(imageWidth)));
end package global_const;
