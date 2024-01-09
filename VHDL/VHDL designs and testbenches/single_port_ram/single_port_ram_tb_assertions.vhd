LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity single_port_ram_tb_assertions is 
end entity single_port_ram_tb_assertions;

architecture tb1 of single_port_ram_tb_assertions is 

signal rw, enable : std_logic;
signal address : unsigned(3 downto 0);
signal data : std_logic_vector(3 downto 0);

component single_port_ram IS
	generic(	n: positive := 4;
				m: positive := 4);
	port(rw, enable: IN std_logic;
			address: IN unsigned (n-1 DOWNTO 0);
			data: INOUT std_logic_vector (m-1 DOWNTO 0));
end component;

begin

single_port_ram_inst : single_port_ram
generic map (n => 4, m => 4)
port map (rw => rw, enable => enable, address => address, data => data);

stim_process: process 
begin
enable <= '1';
rw <= '1';
address <= "1000";
data <= "1001";
wait for 5 ns;

enable <= '0';
rw <= '0';
address <= "1000";
wait for 5 ns;
assert (data <= "1001")
report "testcase 1 is failed"
severity error;

enable <= '1';
rw <= '0';
address <= "1000";
wait for 5 ns;
assert (data <= "1001")
report "testcase 2 is failed"
severity error;

enable <= '1';
rw <= '1';
address <= "0100";
data <= "1000";
wait for 5 ns;
assert (data <= "1000")
report "testcase 3 is failed"
severity error;

enable <= '0';
rw <= '0';
address <= "0100";
wait for 5 ns;
assert (data <= "1000")
report "testcase 4 is failed"
severity error;


enable <= '1';
rw <= '0';
address <= "0100";
wait for 5 ns;
assert (data <= "1000")
report "testcase 5 is failed"
severity error;

wait;
end process stim_process;

end architecture tb1; 
