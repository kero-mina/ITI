LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY single_port_ram IS
	GENERIC(	n: positive := 4;
				m: positive := 4);
	PORT(	rw, enable: IN std_logic;
			address: IN unsigned (n-1 DOWNTO 0);
			data: INOUT std_logic_vector (m-1 DOWNTO 0));
END ENTITY single_port_ram;

ARCHITECTURE behav OF single_port_ram IS
BEGIN 
	memory: PROCESS (rw, enable, address, data) IS
		TYPE rm IS ARRAY (0 TO 2**n-1) OF std_logic_vector (m-1 DOWNTO 0);
		VARIABLE word: rm;
	BEGIN
		data <= (OTHERS => 'Z');
		
		IF enable = '1' THEN
			IF rw = '1' THEN  						-- write location in memory
				word(to_integer(address)) := data;
			ELSE  									-- read location in memory
				data <= word(to_integer(address));
			END IF;
		END IF;
	END PROCESS memory;
END ARCHITECTURE behav;
