library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity bin2gray_io_tb is
end bin2gray_io_tb;
 
 
architecture tb2 of bin2gray_io_tb is

-- component declaration

component bin2gray
generic (n: positive := 4);
 PORT (input:  IN bit_vector (n-1 DOWNTO 0);
        output: OUT bit_vector (n-1 DOWNTO 0));
end component bin2gray;
 
-- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_input   : bit_vector(3 downto 0);   
  signal w_output  : bit_vector(3 downto 0);
 
  begin
 
-- instantiation of DUT

  inst_bin2gray : bin2gray 
  port map (  input  => r_input,
              output => w_output);
 
-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_input     : bit_vector(3 downto 0);
        variable v_output       : bit_vector(3 downto 0);
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\bin2gray\bin2gray_testcases.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\bin2gray\bin2gray_results.txt", write_mode);
    
    -- Very important to initiate the clock
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_input);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_output);
        read(v_ILINE, v_SPACE);           -- read in the space character
        
-- Pass the variable to a signal to check actual output
        r_input   <= v_input;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_output);
        

        -- Check Actual Vs Expected Input
        if (v_output /= w_output) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_output, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
