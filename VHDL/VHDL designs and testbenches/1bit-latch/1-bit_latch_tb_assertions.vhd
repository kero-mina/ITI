library ieee;
use ieee.std_logic_1164.all;

-- entity declaration of testbench
entity latch_tb_assertion is
end entity latch_tb_assertion;

architecture tb1 of latch_tb_assertion is 

--constant declaration for clock period
constant clk_period : time := 10 ns;

--signals declaration for inputs and outputs
signal d,clk,q,nq : bit ;

-- component declaration
component latch 
port(d,clk: IN bit;
     q,nq: OUT bit);
end component;

begin
-- instantiate 1 bit latch
latch_inst : latch
port map(d => d , clk => clk , q => q , nq => nq );

-- generate clock
clk_process : process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process clk_process;

stim_process : process
begin
-- falling level of clock and data = 1
d <= '1';
wait for 5 ns;
assert (q = '0' and nq = '0')
report "testcase (falling level and data = 1) is failed"
severity error;

-- rising level of clock and data = 1
d <= '1';
wait for 5 ns;
assert (q = '1' and nq = '0')
report "testcase (rising level and data = 1) is failed"
severity error;

-- falling level of clock and data = 0
d <= '0';
wait for 5 ns;
assert (q = '1' and nq = '0')
report "testcase (falling level and data = 0) is failed"
severity error;

-- rising level of clock and data = 0
d <= '0';
wait for 5 ns;
assert (q = '0' and nq = '1')
report "testcase (rising level and data = 0) is failed"
severity error;

-- end simulation
wait;
end process stim_process;

end architecture tb1;
