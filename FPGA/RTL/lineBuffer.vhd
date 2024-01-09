library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use work.global_const.all;

entity lineBuffer is
    Port ( i_clk : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR(7 downto 0);
           i_data_valid : in STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR(23 downto 0);
           i_rd_data : in STD_LOGIC );
end lineBuffer;

architecture Behavioral of lineBuffer is
    type LineBufferArray is array (imageWidth+1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal line : LineBufferArray;
    signal wrPntr, rdPntr : unsigned(lineDepth-1 downto 0) := (others=> '0');
begin
    process (i_clk)
    begin
        if rising_edge(i_clk) then
            if i_data_valid = '1' then
                line(to_integer(wrPntr)) <= i_data;
            end if;
        end if;
    end process;

    process (i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                wrPntr <= (others=> '0');
            elsif i_data_valid = '1' then
                wrPntr <= wrPntr + 1;
            end if;
        end if;
    end process;

    o_data <= line(to_integer(rdPntr)) & line(to_integer(rdPntr) + 1) & line(to_integer(rdPntr) + 2);

    process (i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                rdPntr <= (others=> '0');
            /*elsif (i_rd_data = '1' and rdPntr < imageWidth-3) then
                rdPntr <= rdPntr + 1;*/
            elsif (i_rd_data = '1') then
                rdPntr <= rdPntr + 1;
            /*elsif (rdPntr = imageWidth-3) then
                rdPntr <= (others=> '0');*/
            end if;
        end if;
    end process;

end Behavioral;
