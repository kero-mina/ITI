library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity latch4_io_tb is
end latch4_io_tb;
 
 
architecture tb2 of latch4_io_tb is

-- constant declaration for clock 
constant clk_period : TIME := 10 ns;

-- component declaration

component latch4 
PORT( d: IN bit_vector(3 DOWNTO 0);
        en,clk: IN bit;
        q: OUT bit_vector(3 DOWNTO 0));
end component;
 
 -- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_d   : bit_vector(3 downto 0);   
  signal r_en  : bit;
  signal w_q : bit_vector(3 downto 0); 
  signal clk     : bit;
 
  begin
 
-- instantiation of DUT

  inst_latch : latch4 
  port map (  d  => r_d,
              en   => r_en,
              clk => clk,
              q  => w_q);
 
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
        variable v_d     : bit_vector(3 downto 0);
        variable v_q       : bit_vector(3 downto 0);
        variable v_clk     : bit;
        variable v_en       : bit;
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\4-bit_latch_behavioral\4-bit_latch_behavioral_testcases.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\4-bit_latch_behavioral\4-bit_latch_behavioral_results.txt", write_mode);
    
    -- Very important to initiate the clock
    

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_d);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_en);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_q);
        read(v_ILINE, v_SPACE);           -- read in the space character
 

      -- Pass the variable to a signal to check actual output
        r_d   <= v_d;
        r_en  <= v_en;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_q);

        -- Check Actual Vs Expected Input
        if (v_q /= w_q) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_q, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
