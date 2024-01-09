library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity comparator_io_tb is
end comparator_io_tb;
 
architecture tb2 of comparator_io_tb is

-- component declaration

component comparator 
 Port( a : IN  std_logic_vector (7 DOWNTO 0);
         b: IN std_logic_vector (7 DOWNTO 0);
         equal_out : OUT std_logic;
         not_equal_out: OUT std_logic);
end component;
 
 -- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_a   : std_logic_vector(7 downto 0);   
  signal r_b  : std_logic_vector(7 downto 0);
  signal w_equal_out : std_logic; 
  signal w_not_equal_out: std_logic;
 
  begin
 
-- instantiation of DUT

  inst_comparator : comparator 
  port map (  a => r_a ,
              b   => r_b,
              equal_out => w_equal_out,
              not_equal_out  => w_not_equal_out);

-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_a    : std_logic_vector(7 downto 0);
        variable v_b      : std_logic_vector(7 downto 0);
        variable v_equal_out     : std_logic;
        variable v_not_equal_out  : std_logic;
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\comparator\comparator_testcases.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\comparator\comparator_results.txt", write_mode);
    
    
    

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_a);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_b);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_equal_out);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_not_equal_out);            -- Output Expected Data
 

      -- Pass the variable to a signal to check actual output
        r_a <= v_a;
        r_b <= v_b;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_equal_out);
        write (v_OLINE,w_not_equal_out);

        -- Check Actual Vs Expected Input
        if (v_equal_out /= w_equal_out) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_equal_out, right);

        if (v_not_equal_out /= w_not_equal_out) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;

        write(v_OLINE, v_not_equal_out, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
