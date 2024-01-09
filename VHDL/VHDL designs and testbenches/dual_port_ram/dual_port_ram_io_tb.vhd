library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity dual_port_ram_io_tb is
end entity dual_port_ram_io_tb;
 
 
architecture tb2 of dual_port_ram_io_tb is

-- component declaration

component dual_port_ram 
	generic(n: positive := 4;
		m: positive := 4);
	port(	r, w: IN std_logic;
			address_in: IN unsigned (n-1 DOWNTO 0);
			address_out: IN unsigned (n-1 DOWNTO 0);
			data_in: IN std_logic_vector (m-1 DOWNTO 0);
			data_out: OUT std_logic_vector (m-1 DOWNTO 0));
end component;
 
-- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_r, r_w   : std_logic;
  signal r_address_in, r_address_out : unsigned (3 downto 0);
  signal r_data_in : std_logic_vector (3 downto 0);
  signal w_data_out : std_logic_vector (3 downto 0);

begin
 
-- instantiation of DUT

  inst_dual_port_ram : dual_port_ram 
  port map (  r  => r_r,
              w => r_w,
              address_in => r_address_in,
              address_out => r_address_out,
              data_in => r_data_in,
              data_out => w_data_out);
 
-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_r     : std_logic;
        variable v_w       : std_logic;
        variable v_address_in : std_logic_vector(3 downto 0);
        variable v_address_out : std_logic_vector(3 downto 0);
        variable v_data_in : std_logic_vector(3 downto 0);
        variable v_data_out : std_logic_vector(3 downto 0);
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\dual_port_ram\dual_port_ram_testvectors.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\dual_port_ram\dual_port_ram_results.txt", write_mode);
    
    
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_r);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_w);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_address_in);
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_address_out);
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_data_in);
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_data_out);

-- convert integer inputs to unsigned data types
r_address_in <= unsigned(v_address_in);
r_address_out <= unsigned(v_address_out);

-- Pass the variable to a signal to check actual output
        r_r   <= v_r;
        r_w   <= v_w;
        r_data_in <= v_data_in;
        w_data_out <= v_data_out;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_data_out);
        

        -- Check Actual Vs Expected Input
        if (v_data_out /= w_data_out) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_data_out, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
