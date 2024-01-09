library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use std.textio.all;
use work.global_const.all;

entity draft2 is
end draft2;

architecture test of draft2 is
    constant headerSize: integer := 1080;
    constant imageSize: integer := imageWidth * imageWidth;
  -----------------------------------------------------------------------------
  -- Declare the Component 
  -----------------------------------------------------------------------------
    component imageProcessTop is
    port (
        axi_clk                 : in std_logic;
        axi_reset_n             : in std_logic;
        i_data_valid            : in std_logic;
        i_data                  : in std_logic_vector (7 downto 0);
        o_data_valid            : out std_logic;
        o_intr                  : out std_logic;
        o_data                  : out std_logic_vector (7 downto 0);
        i_data_ready            : in std_logic;
        o_data_ready            : out std_logic
    );
    end component imageProcessTop;

  -----------------------------------------------------------------------------
  -- Testbench Internal Signals
  -----------------------------------------------------------------------------

    signal axi_clk : std_logic := '0';
    signal axi_reset_n: std_logic;
    signal imgData: std_logic_vector(7 downto 0);
    signal imgDataValid: std_logic := '0';
    signal intr: std_logic;
    signal outData: std_logic_vector(7 downto 0);
    signal outDataValid: std_logic;
    type char_file is file of character;
    file test_vectors : char_file open read_mode  is "lena_gray.bmp";
    file test_results : char_file open write_mode is "blurred_lena.bmp";
    file blur_img : char_file open write_mode is "blur_img.txt";
    
begin

    process
    begin
        axi_clk <= not axi_clk after 5 ns;
        wait for 5 ns;
    end process;

    process
    variable char_read: character;
    variable sentSize: integer;

    begin
        axi_reset_n <= '0';
        sentSize := 0;
        imgDataValid <= '0';
        wait for 100 ns;
        axi_reset_n <= '1';
        wait for 100 ns;

       -- We read the header part of the image file which are the first 1080 bytes and directly write it as it is in the output file without processing.
        for i in 0 to 1079 loop
            read  (test_vectors, char_read);
            write (test_results, char_read);
            write (blur_img, char_read);
        end loop;
        
        -- Now we fill the 4 line buffers in our design with pixels from the input image file.
        for i in 0 to (4*imageWidth)-1 loop
            wait until rising_edge(axi_clk);
            read(test_vectors, char_read);
            imgData <= std_logic_vector(to_unsigned(character'pos(char_read), 8));
			imgDataValid <= '1';
        end loop;

        sentSize := 4 * imageWidth;
        wait until rising_edge(axi_clk);
        -- We will put the valid signal low to stop writing into the line buffers because they are full now.
        imgDataValid <= '0';

       -- For the rest of time, we will wait for the interrupt signal from the 
       -- IP indicating that a line buffer is free now and ready to be written.
        while sentSize < imageSize loop
            wait until rising_edge(intr);
            for i in 0 to imageWidth -1 loop
                wait until rising_edge(axi_clk);
                read(test_vectors, char_read);
                imgData <= std_logic_vector(to_unsigned(character'pos(char_read), 8));
                imgDataValid <= '1';
            end loop;
            wait until rising_edge(axi_clk);
            imgDataValid <= '0';
            sentSize := sentSize + imageWidth;
        end loop;

        wait until rising_edge(axi_clk);
        imgDataValid <= '0';
        
        -- Next, we put insert 2 dummy lines at the end of the output file, to make 
        -- its size equal to the input file size, because we are using the same header.
        wait until rising_edge(intr);

        for i in 0 to imageWidth - 1 loop
            wait until rising_edge(axi_clk);
            imgData <= (others=>'0');
            imgDataValid <= '1';
        end loop;

        wait until rising_edge(axi_clk);
        imgDataValid <= '0';
        wait until rising_edge(intr);

        for i in 0 to imageWidth - 1 loop
            wait until rising_edge(axi_clk);
            imgData <= (others=>'0');
            imgDataValid <= '1';
        end loop;

        wait until rising_edge(axi_clk);
        imgDataValid <= '0';
        
        -- By this step, we have completed the stimuli insertion process into the dut, so we close the input file.
        file_close(test_vectors);
           
      wait;
      
    end process;

    -- Now, we will get the processed output from the IP and append it to the output file after the header part.
    process(axi_clk)	
        variable receivedData: integer := 0;
    begin
        if rising_edge(axi_clk) then
            if outDataValid = '1' then
                write(test_results,character'val(to_integer(unsigned(outData))));
                write (blur_img, character'val(to_integer(unsigned(outData))));
                receivedData := receivedData + 1;
            end if;

            if receivedData = imageSize then
                file_close(test_results);
                file_close(blur_img);
                assert (false) report "Simulation Completed" severity failure;
            end if;
        end if;
    end process;

  -------------------------------------------------------------------------
  -- Instantiate and Map DUT
  -----------------------------------------------------------------------------
  
  dut: imageProcessTop
    port map( axi_clk       => axi_clk,
              axi_reset_n   => axi_reset_n,
              i_data_valid  => imgDataValid,
              i_data        => imgData,
              o_data_valid  => outDataValid,
              o_intr        => intr,
              o_data        => outData,
              i_data_ready  => '1',
              o_data_ready  => open);

end test;