LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity fsm_mealy_io_tb is 
end entity fsm_mealy_io_tb;

architecture tb2 of fsm_mealy_io_tb is

constant clk_period : time := 10 ns;

component fsm is
  port( clk, reset: IN std_logic;
        x: IN std_logic;
        y: OUT std_logic);
end component;

file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_reset   : std_logic;   
  signal r_x  : std_logic;
  signal w_y : std_logic; 
  signal clk     : std_logic;
 
  begin
 
-- instantiation of DUT

  inst_fsm : fsm 
  port map (  clk  => clk,
              reset   => r_reset,
              x => r_x,
              y => w_y);
 
 -- clock generation
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process clk_process;

-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_reset     : std_logic;
        variable v_x     : std_logic;
        variable v_y       : std_logic;
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\fsm\fsm_testvectors.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\fsm\fsm_results.txt", write_mode);
    
    -- Very important to initiate the clock
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_reset);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_x);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_y);
        
 

      -- Pass the variable to a signal to check actual output
        r_reset   <= v_reset;
        r_x <= v_x;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_y);
        

        -- Check Actual Vs Expected Input
        if (v_y /= w_y) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_y, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
