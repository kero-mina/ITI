LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity fsm_mealy_2p_tb_assertions is 
end entity fsm_mealy_2p_tb_assertions;

architecture tb1 of fsm_mealy_2p_tb_assertions is

constant clk_period : time := 10 ns;

signal clk, reset, x, y : std_logic;

component fsm is
  port( clk, reset: IN std_logic;
        x: IN std_logic;
        y: OUT std_logic);
end component;

begin 

fsm_inst : fsm

port map (clk => clk, reset => reset, x => x, y => y );

clk_process : process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process clk_process;

stim_process : process
begin

reset <= '1';
wait for 5 ns;
assert y <= '0'
report "reset case is failed"
severity error;

reset <= '0';
x <= '0';
wait for 5 ns;
assert y <= '0'
report "even case with x equals 0 (even) is failed"
severity error;

reset <= '0';
x <= '1';
wait for 5 ns;
assert y <= '1'
report "even case with x equals 1 (odd) is failed"
severity error;

reset <= '0';
x <= '0';
wait for 5 ns;
assert y <= '1'
report "odd case with x equals 0 (odd) is failed"
severity error;

reset <= '0';
x <= '1';
wait for 5 ns;
assert y <= '0'
report "odd case with x equals 1 (even) is failed"
severity error;

reset <= '1';
wait for 5 ns;
assert y <= '1'
report "reset case is failed"
severity error;


wait;
end process stim_process;

end architecture tb1;


