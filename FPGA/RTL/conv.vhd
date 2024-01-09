library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity conv is
    Port ( i_clk :           in   STD_LOGIC;
           i_pixel_data :      in   STD_LOGIC_VECTOR (71 downto 0);
           i_pixel_data_valid :    in   STD_LOGIC;
           o_convolved_data :      out  STD_LOGIC_VECTOR (7 downto 0);
           o_convolved_data_valid : out  STD_LOGIC);
end conv;

architecture Behavioral of conv is
  type    kernel    is   array  (8 downto 0) of unsigned(7 downto  0); -- The filter to be applied on the image
  signal  k1: kernel := ("00000001","00000010","00000001","00000010","00000100","00000010","00000001","00000010","00000001"); -- The Gaussian Blur filter
  --signal  k1: kernel := (others => "00000001");
  type    mult_out  is   array  (8 downto 0) of unsigned(15 downto 0);
  signal  m1: mult_out;
  signal  sumout_reg, sumout_reg2:  std_logic_vector(15 downto 0);
  signal  mult_valid:  std_logic;
  signal  sum_valid:   std_logic;
begin

  multiply_kernel: -- multiply each pixel in the 9-pixel window with the coressponding kernel value
  process(i_clk) is
  begin
    if rising_edge(i_clk) then
      for iter in 0 to 8 loop
		    m1(iter) <= k1(iter) * unsigned(i_pixel_data((iter+1)*8-1 downto iter*8)); -- Ex: m1(0) = k1(0) * i_pixel_data(7:0) , m1(1) = k1(1) * i_pixel_data(15:8) and so on.  
      end loop;
    mult_valid <= i_pixel_data_valid;
    end if;
  end process multiply_kernel;
  
  average_calc:
  process (m1) is
    variable  sum_out:     unsigned(15 downto 0);
  begin
    sum_out := (others => '0');
      for iter in 0 to 8 loop
        sum_out := sum_out + m1(iter); -- add all the 9-pixel window after multiplying them by the kernel values
      end loop;
      sumout_reg <= std_logic_vector(sum_out);
  end process average_calc;
  
  register_sum:
  process (i_clk) is
  begin
    if rising_edge(i_clk) then
  	  sum_valid  <= mult_valid; 
      sumout_reg2 <= sumout_reg;
    end if;
  end process register_sum;
  
  output:
  process (i_clk) is
  begin
    if rising_edge(i_clk) then
      o_convolved_data       <=  sumout_reg2(11 downto 4); -- The convolved data = sum / 16.
      o_convolved_data_valid  <=  sum_valid;
    end if;
  end process output;
end Behavioral;