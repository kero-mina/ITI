library IEEE;
LIBRARY std;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use std.textio.all;

entity tb2 is 
end entity tb2;

architecture tb_textio of tb2 is
component addsub4 is 
	port( A, B : in std_logic_vector(3 downto 0);
				M : in std_logic;
				S : out std_logic_vector(3 downto 0);
				C : out std_logic );

end component;

signal  A_tio, B_tio, S_tio, S_expio : std_logic_vector(3 downto 0);
signal	M_tio, C_tio, C_expio : std_logic;

begin

T2 : addsub4 port map(A_tio, B_tio, M_tio, S_tio, C_tio);

pp2: process is 
file vectors_f: text open read_mode is "subadd4_test_vectors.txt";
file results_f: text open write_mode is "subadd4_test_results.txt";
variable stimuli_l, 

