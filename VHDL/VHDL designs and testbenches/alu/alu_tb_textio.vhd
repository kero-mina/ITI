library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

USE WORK.pack_a.ALL;
 
entity alu_io_tb is
end alu_io_tb;
 
architecture tb2 of alu_io_tb is

--component declaration

component alu 
PORT( op: IN op_type;
         a, b : IN signed (3 DOWNTO 0);
         c : OUT signed (3 DOWNTO 0)); 
end component;
 
 -- testbenches internal signals declaration

  file file_VECTORS : text;
  file file_RESULTS : text;
 
  signal r_op   : op_type;   
  signal r_a  : signed (3 downto 0);
  signal r_b : signed (3 downto 0); 
  signal w_c     : signed(3 downto 0);
  
begin
 
-- instantiation of DUT

  inst_alu : alu 
  port map (  op  => r_op,
              a  => r_a,
              b => r_b,
              c => w_c);
 
-- Process read/Write from file

    process
        variable v_ILINE     : line;      -- Line from I/P Text
        variable v_OLINE     : line;      -- Line from O/P Text
        variable v_op     : op_type;
        variable v_a       : integer;
        variable v_b     : integer;
        variable v_c       : integer;
        variable v_SPACE     : character; -- space in text
        variable temp : string(2 downto 0);
       
        
    begin
 
    file_open(file_VECTORS, "D:\ITI\VHDL\alu\alu_testcases.txt",  read_mode);
    file_open(file_RESULTS, "D:\ITI\VHDL\alu\alu_results.txt", write_mode);
    
    
    wait for 5 ns;

    while not endfile(file_VECTORS) loop

        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, temp);
        read(v_ILINE, v_SPACE);    
        read(v_ILINE, v_a);
        v_a:= to_signed();
        read(v_ILINE, v_SPACE);  
        read(v_ILINE, v_b);
        v_b:= to_signed();
        read(v_ILINE, v_SPACE);
        read(v_ILINE, v_c);            -- Output Expected Data
        v_c:= to_signed();

        case temp is
           when "add" => v_op:= add;
           when "sub" => v_op:= sub;
           when "mul" => v_op:= mul;
           when "div" => v_op:= div;
        end case;
        
        r_op  <= v_op;
        r_a <= v_a;
        r_b <= v_b;

        wait for 5 ns;  
        write (v_OLINE,string' ("At Time " ));
        write (v_OLINE,now);
        write (v_OLINE,string' (", output is: "));
        write (v_OLINE,w_c);
        

        -- Check Actual Vs Expected Input
        if (v_c /= w_c) then
            write (v_OLINE,string' (" , Not Correct Expected "));
        else
            write (v_OLINE,string' (" , Correct Output is "));
        end if ;
      
        write(v_OLINE, v_c, right);
        writeline(file_RESULTS, v_OLINE);

       
    end loop;
 
    file_close(file_VECTORS);
    file_close(file_RESULTS);

    wait;   
    end process;
   
end tb2;
