library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity imageProcessTop is
    port (
        axi_clk: in std_logic;
        axi_reset_n: in std_logic;
        i_data_valid: in std_logic;
        i_data: in std_logic_vector(7 downto 0);
        o_data_ready: out std_logic;
        o_data_valid: out std_logic;
        o_data: out std_logic_vector(7 downto 0);
        i_data_ready: in std_logic;
        o_intr: out std_logic
    );
end entity imageProcessTop;

architecture rtl of imageProcessTop is
    signal pixel_data: std_logic_vector(71 downto 0);
    signal pixel_data_valid: std_logic;
    signal axis_prog_full: std_logic;
    signal convolved_data: std_logic_vector(7 downto 0);
    signal convolved_data_valid: std_logic;
    signal rst: std_logic;

    component imageControl is
        port (
            i_clk: in std_logic;
            i_rst: in std_logic;
            i_pixel_data: in std_logic_vector(7 downto 0);
            i_pixel_data_valid: in std_logic;
            o_pixel_data: out std_logic_vector(71 downto 0);
            o_pixel_data_valid: out std_logic;
            o_intr: out std_logic
        );
    end component imageControl;
    
    component conv is
        port (
            i_clk: in std_logic;
            i_pixel_data: in std_logic_vector(71 downto 0);
            i_pixel_data_valid: in std_logic;
            o_convolved_data: out std_logic_vector(7 downto 0);
            o_convolved_data_valid: out std_logic
        );
    end component conv;
    
    ----------------------------------------------------------------------------
begin
    o_data_ready <= not axis_prog_full;
    rst <= not (axi_reset_n);

    IC: imageControl
    port map (
        i_clk => axi_clk,
        i_rst => rst,
        i_pixel_data => i_data,
        i_pixel_data_valid => i_data_valid,
        o_pixel_data => pixel_data,
        o_pixel_data_valid => pixel_data_valid,
        o_intr => o_intr
    );
    
    convo: conv
    port map (
        i_clk => axi_clk,
        i_pixel_data => pixel_data,
        i_pixel_data_valid => pixel_data_valid,
        o_convolved_data => o_data,
        o_convolved_data_valid => o_data_valid
    );
    
    
end architecture rtl;