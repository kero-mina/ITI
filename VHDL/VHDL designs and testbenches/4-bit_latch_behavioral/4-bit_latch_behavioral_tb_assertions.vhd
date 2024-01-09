library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.all;

entity latch4_behavioral_tb_assert is
end entity latch4_behavioral_tb_assert;

architecture tb1 of latch4_behavioral_tb_assert is 

-- constant declaration for clock period
constant clk_period : time := 10 ns;

-- signals decaration for inputs and outputs
signal d,q: bit_vector (3 downto 0);

signal en,clk : bit;

-- component declaration
component latch4 
PORT( d: IN bit_vector(3 DOWNTO 0);
        en,clk: IN bit;
        q: OUT bit_vector(3 DOWNTO 0));
end component;

begin

-- instantiation
latch4_inst : latch4
port map (d => d, en => en, clk => clk, q => q );

-- generate clock 
clk_process : process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process clk_process;

-- generate stimulus
stim_process: process
begin
-- enable is off and clk = 1
en <= '0';
d <= "1101";
wait for 5 ns;
assert q = "0000"
report "(enable is off and clk = 0) case is failed"
severity error;

-- enable is off and clk = 0
en <= '0';
d <= "1101";
wait for 5 ns;
assert q = "0000"
report "(enable is off and clk = 1) case is failed"
severity error;

-- enable is on and clk = 0
en <= '1';
d <= "1101";
wait for 5 ns;
assert q = "0000"
report "(enable is on and clk = 0) case is failed"
severity error;

-- enable is on and clk = 1
en <= '1' ;
d <= "1101";
wait for 5 ns;
assert q = "1101"
report "(enable is on and clk = 1) case is failed"
severity error;

wait;
end process stim_process;

end architecture tb1;




