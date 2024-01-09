LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity dual_port_ram_tb_assertions is 
end entity dual_port_ram_tb_assertions;

architecture tb1 of dual_port_ram_tb_assertions is

signal r,w: std_logic;
signal address_in, address_out: unsigned (3 downto 0);
signal data_in, data_out: std_logic_vector (3 downto 0);

component dual_port_ram 
	generic(n: positive := 4;
		m: positive := 4);
	port(	r, w: IN std_logic;
			address_in: IN unsigned (n-1 DOWNTO 0);
			address_out: IN unsigned (n-1 DOWNTO 0);
			data_in: IN std_logic_vector (m-1 DOWNTO 0);
			data_out: OUT std_logic_vector (m-1 DOWNTO 0));
end component;

begin 

dual_port_ram_inst: dual_port_ram

generic map (n => 4, m => 4)
port map (r => r, w => w, address_in => address_in, address_out => address_out, data_in => data_in, data_out => data_out);

stim_process: process
begin
r <= '0';
w <= '1';
address_in <= "1000";
data_in <= "1001";
wait for 5 ns;

r <= '1';
w <= '0';
address_out <= "1000";
wait for 5 ns;
assert (data_out <= "1001")
report "testcase 1 is failed"
severity error;

r <= '0';
w <= '1';
address_in <= "0100";
data_in <= "1010";
wait for 5 ns;

r <= '1';
w <= '1';
address_in <= "1000";
address_out <= "0100";
data_in <= "1001";
wait for 5 ns;
assert (data_out <= "1010")
report "testcase 2 is failed"
severity error;

wait;
end process stim_process;

end architecture tb1;
