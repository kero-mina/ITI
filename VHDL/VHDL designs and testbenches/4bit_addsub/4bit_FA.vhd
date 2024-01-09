library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is 
	port(
		A,B,Cin : in std_logic;
 		S,Cout : out std_logic
);

end entity full_adder;

architecture imp of full_adder is
 
begin
 
 S <= A XOR B XOR Cin ;
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
 
end architecture imp;
