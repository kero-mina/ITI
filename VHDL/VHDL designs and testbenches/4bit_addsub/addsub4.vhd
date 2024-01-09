library IEEE;
LIBRARY std;
USE ieee.numeric_std.ALL;
USE ieee.numeric_bit.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity addsub4 is 
	port( A, B : in std_logic_vector(3 downto 0);
				M : in std_logic;
				S : out std_logic_vector(3 downto 0);
				C : out std_logic );

end entity addsub4;

architecture behavioral of addsub4 is
begin
	p1: process (A, B, M) is 
		variable x : std_logic_vector(4 downto 0);
	begin
		if (M = '1') then
			x := ('0' & A) - ('0' & B);
		else
			x := ('0' & A) + ('0' & B);
		end if;
		S <= x(3 downto 0);
		C <= x(4);
	end process p1;

end architecture behavioral;

architecture dataflow of addsub4 is
signal X : std_logic_vector(4 downto 0);
begin 
  X <= (('0' & A) - ('0' & B)) when M = '1' 
  else (('0' & A) + ('0' & B));
  S <= X(3 downto 0);
	C <= X(4);
end architecture dataflow;

architecture structural of addsub4 is
component full_adder is 
	port(
		A, B, Cin : in std_logic;
 		S, Cout : out std_logic );
end component;

signal C1, C2, C3, C4 : std_logic;
signal B_t : std_logic_vector(3 downto 0);

begin 
B_t(3) <= M xor B(3);
B_t(2) <= M xor B(2);
B_t(1) <= M xor B(1);
B_t(0) <= M xor B(0);

F1 : full_adder port map(A(0), B_t(0), M, S(0), C1);
F2 : full_adder port map(A(1), B_t(1), C1, S(1), C2);
F3 : full_adder port map(A(2), B_t(2), C2, S(2), C3);
F4 : full_adder port map(A(3), B_t(3), C3, S(3), C4);

C <= C4;
end architecture structural;
