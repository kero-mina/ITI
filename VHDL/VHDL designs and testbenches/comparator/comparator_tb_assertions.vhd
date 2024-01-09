LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity comparator_tb_assertions is 
end entity comparator_tb_assertions;

architecture tb1 of comparator_tb_assertions is

signal a,b: std_logic_vector(7 downto 0);
signal equal_out, not_equal_out : std_logic;

component comparator 
 Port( a : IN  std_logic_vector (7 DOWNTO 0);
         b: IN std_logic_vector (7 DOWNTO 0);
         equal_out : OUT std_logic;
         not_equal_out: OUT std_logic);
end component;

begin 
comparator_inst : comparator
port map (a => a, b =>b, equal_out => equal_out, not_equal_out => not_equal_out );

stim_process : process
begin
a <= "10100011";
b <= "10110011";
wait for 5 ns;
assert (equal_out = '0' and not_equal_out = '1')
report "case is failed"
severity error;

a <= "10110100";
b <= "10101011";
wait for 5 ns;
assert (equal_out = '0' and not_equal_out = '1')
report "case is failed"
severity error;

a <= "10111011";
b <= "10111011";
wait for 5 ns;
assert (equal_out = '1' and not_equal_out = '0')
report "case is failed"
severity error;

wait;
end process stim_process;

end architecture tb1;


 


