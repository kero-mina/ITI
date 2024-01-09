library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;

entity bin2gray_tb_assertions is 
end entity bin2gray_tb_assertions;

architecture tb1 of bin2gray_tb_assertions is 

signal input,output : bit_vector(3 downto 0);

component bin2gray
generic (n: positive := 4);
 PORT (input:  IN bit_vector (n-1 DOWNTO 0);
        output: OUT bit_vector (n-1 DOWNTO 0));
end component bin2gray;

begin 

bin2gray_inst : bin2gray

generic map (n => 4)
port map (input => input, output => output);

stim_process : process
begin
input <= "1101";
wait for 5 ns;
assert output <= "1011"
report "bin 2 gray of 1011 case is failed "
severity error;

input <= "1110";
wait for 5 ns;
assert output <= "1001"
report "bin 2 gray of 1110 case is failed"
severity error;

input <= "1010";
wait for 5 ns;
assert output <= "1111"
report "bin 2 gray of 1010 case is failed"
severity error;

wait;
end process stim_process;

end architecture tb1;
