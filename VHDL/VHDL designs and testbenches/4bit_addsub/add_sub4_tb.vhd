library IEEE;
LIBRARY std;
USE ieee.numeric_std.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity tb1 is 
end entity tb1;

architecture tb_assert of tb1 is 
component addsub4 is 
	port( A, B : in std_logic_vector(3 downto 0);
				M : in std_logic;
				S : out std_logic_vector(3 downto 0);
				C : out std_logic );

end component;

signal  A_t, B_t, S_t, S_exp : std_logic_vector(3 downto 0);
signal	M_t, C_t, C_exp : std_logic;

begin

T1 : addsub4 port map(A_t, B_t, M_t, S_t, C_t);


pp1: process 
begin
	A_t <= "0110";
  B_t <= "1001";
  M_t <= '0';
  S_exp <= "1110";
  C_exp <= '0';
  wait for 10 ns;


  ASSERT (S_t =  S_exp and C_t =  C_exp ) 
    REPORT "errorrrrrrrrrr" 
    SEVERITY error;
end process;


end architecture tb_assert;

configuration behave_conf_tb of tb1 is 
   for tb_assert
     for T1: addsub4
        use entity work.addsub4(behavioral);
     end for;
   end for;
end configuration behave_conf_tb;

configuration dataflow_conf_tb of tb1 is 
   for tb_assert
     for T1: addsub4
        use entity work.addsub4(dataflow);
     end for;
   end for;
end configuration dataflow_conf_tb;

configuration struct_conf_tb of tb1 is 
   for tb_assert
     for T1: addsub4
        use entity work.addsub4(structural);
     end for;
   end for;
end configuration struct_conf_tb;
