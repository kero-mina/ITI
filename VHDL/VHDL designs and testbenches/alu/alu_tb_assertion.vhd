LIBRARY ieee;
USE ieee.numeric_bit.ALL;
USE WORK.pack_a.ALL;
use ieee.std_logic_1164.all;

-- entity declaration for testbench
entity alu_tb_assertion is 
end entity alu_tb_assertion;

architecture tb1 of alu_tb_assertion is

-- signals declaration 
signal op: op_type;
signal a,b,c : signed (3 downto 0);

component alu
PORT( op: IN op_type;
         a, b : IN signed (3 DOWNTO 0);
         c : OUT signed (3 DOWNTO 0));
end component;

begin

alu_inst : alu
port map (op => op, a => a, b => b, c => c);

stim_process : process
begin
-- addition of 1111 and 0001
op <= add;
a <= "1111";
b <= "0001";
wait for 5 ns;
assert c = "0000"
report "(addition of 1111 and 0001) case is failed"
severity error;

-- subtraction of 1111 and 0001
op <= sub;
a <= "1111";
b <= "0001";
wait for 5 ns;
assert c = "1110"
report "(subtraction of 1111 and 0001) case is failed"
severity error;

-- multiplication of 1111 and 0010
op <= mul;
a <= "1111";
b <= "0010";
wait for 5 ns;
assert c = "1110" 
report "(multiplication of 1111 and 0010) case is failed"
severity error;

-- division of 1000 and 0010
op <= div;
a <= "1000";
b <= "0010";
wait for 5 ns;
assert c = "0100"
report "(division of 1000 and 0010) case is failed"
severity error;

wait;
end process stim_process;

end architecture tb1;

