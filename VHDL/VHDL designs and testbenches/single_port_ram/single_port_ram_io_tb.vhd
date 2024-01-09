library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity single_port_ram_io_tb is
end entity single_port_ram_io_tb;

architecture tb2 of single_port_ram_io_tb is

component single_port_ram IS
	generic(	n: positive := 4;
				m: positive := 4);
	port(rw, enable: IN std_logic;
			address: IN unsigned (n-1 DOWNTO 0);
			data: INOUT std_logic_vector (m-1 DOWNTO 0));
end component;

 file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_rw, r_enable   : std_logic;
  signal r_address : unsigned (3 downto 0);
  signal w_data : std_logic_vector (3 downto 0);

begin
 
-- instantiation of DUT

  inst_single_port_ram : single_port_ram 
  port map (  rw  => r_rw,
              enable => r_enable,
              address => r_address,
              data => w_data);
 
-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_rw, v_enable     : std_logic;
        variable v_address : std_logic_vector(3 downto 0);
        variable v_data : std_logic_vector(3 downto 0);
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\single_port_ram\single_port_ram_testvectors.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\single_port_ram\single_port_ram_results.txt", write_mode);
    
    
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_rw);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_enable);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_address);
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_data);

-- convert integer inputs to unsigned data types
r_address <= unsigned(v_address);


-- Pass the variable to a signal to check actual output
        r_rw   <= v_rw;
        r_enable   <= v_enable;
        w_data <= v_data;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_data);
        

        -- Check Actual Vs Expected Input
        if (v_data /= w_data) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_data, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
