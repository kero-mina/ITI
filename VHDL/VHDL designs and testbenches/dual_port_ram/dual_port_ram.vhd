LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY dual_port_ram IS
	GENERIC(	n: positive := 4;
				m: positive := 4);
	PORT(	r, w: IN std_logic;
			address_in: IN unsigned (n-1 DOWNTO 0);
			address_out: IN unsigned (n-1 DOWNTO 0);
			data_in: IN std_logic_vector (m-1 DOWNTO 0);
			data_out: OUT std_logic_vector (m-1 DOWNTO 0));
END ENTITY dual_port_ram;

ARCHITECTURE behav OF dual_port_ram IS
BEGIN 
	memory: PROCESS (r, w, address_in, address_out, data_in) IS
		TYPE rm IS ARRAY (0 TO 2**n-1) OF std_logic_vector (m-1 DOWNTO 0);
		VARIABLE word: rm;
	BEGIN
		IF w = '1' THEN   								-- write location in memory
			word(to_integer(address_in)) := data_in;
		END IF;
		
		IF r = '1' THEN   								-- read location in memory
			data_out <= word(to_integer(address_out));
		END IF;
	END PROCESS memory;
END ARCHITECTURE behav;
