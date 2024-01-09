library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity latch_io_tb is
end latch_io_tb;
 
 
architecture tb2 of latch_io_tb is

-- constant declaration for clock 
constant clk_period : TIME := 10 ns;

-- component declaration

component latch 
port(d,clk: IN bit;
     q,nq: OUT bit);
end component;
 
 -- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_d   : bit;   
  signal w_q  : bit;
  signal w_nq : bit; 
  signal clk     : bit;
 
  begin
 
-- instantiation of DUT

  inst_latch : latch 
  port map (  d  => r_d,
              clk   => clk,
              q => w_q,
              nq  => w_nq);
 
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
        variable v_d     : bit;
        variable v_q       : bit;
        variable v_clk     : bit;
        variable v_nq       : bit;
        variable v_SPACE     : character; -- space in text
     
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\1bit-latch\1-bit_latch_testcases.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\1bit-latch\1-bit_latch_results.txt", write_mode);
    
    -- Very important to initiate the clock
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_d);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_clk);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_q);
        read(v_ILINE, v_SPACE);           -- read in the space character
        read(v_ILINE, v_nq);            -- Output Expected Data
 

      -- Pass the variable to a signal to check actual output
        r_d   <= v_d;
      
        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_q);
        write (v_OLINE,w_nq);

        -- Check Actual Vs Expected Input
        if (v_q /= w_q) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_q, right);

        if (v_nq /= w_nq) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;

        write(v_OLINE, v_nq, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
