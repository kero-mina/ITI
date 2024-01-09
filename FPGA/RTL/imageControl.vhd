--------------------------------------------------------------------------------
--This module controls the read and write operations from/to the line buffers
--------------------------------------------------------------------------------
LIBRARY ieee;
library work;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.global_const.all;

entity imageControl is
	port (
		i_clk						: in std_logic;
		i_rst						: in std_logic;
		i_pixel_data_valid			: in std_logic;
		i_pixel_data 				: in std_logic_vector (7 downto 0);
		o_pixel_data_valid			: out std_logic;
		o_intr						: out std_logic;
		o_pixel_data         		: out std_logic_vector (71 downto 0)
	);
end entity imageControl;

architecture behav of imageControl is
	type   state_type is (IDLE, RD_BUFFER);
	--Intermediate signals--
	signal pixelCounter			: unsigned (lineDepth-1 downto 0);
	signal currentWrLineBuffer	: unsigned (1 downto 0);
	signal lineBuffDataValid	: std_logic_vector (3 downto 0);
	signal currentRdLineBuffer	: unsigned (1 downto 0);
	signal lineBuffRdData		: std_logic_vector (3 downto 0);
	signal lb0data				: std_logic_vector (23 downto 0);
	signal lb1data				: std_logic_vector (23 downto 0);
	signal lb2data				: std_logic_vector (23 downto 0);
	signal lb3data				: std_logic_vector (23 downto 0);
	signal rdCounter			: unsigned (lineDepth-1 downto 0);
	signal rd_line_buffer		: std_logic;
	signal totalPixelCounter	: unsigned (lineDepth+2 downto 0);
	signal rdState				: state_type;
	--Components instantiated--
	component lineBuffer is
		port (
			i_clk		: in std_logic;
			i_rst		: in std_logic;
			i_data 		: in std_logic_vector (7 downto 0);
			i_data_valid: in std_logic;
			o_data 		: out std_logic_vector (23 downto 0);
			i_rd_data	: in std_logic
		);
	end component lineBuffer;
begin
	lB0: lineBuffer port map (
		i_clk => i_clk,
		i_rst => i_rst,
		i_data => i_pixel_data,
		i_data_valid => lineBuffDataValid(0),
		o_data => lb0data,
		i_rd_data => lineBuffRdData(0)
	);
	lB1: lineBuffer port map (
		i_clk => i_clk,
		i_rst => i_rst,
		i_data => i_pixel_data,
		i_data_valid => lineBuffDataValid(1),
		o_data => lb1data,
		i_rd_data => lineBuffRdData(1)
	);
	lB2: lineBuffer port map (
		i_clk => i_clk,
		i_rst => i_rst,
		i_data => i_pixel_data,
		i_data_valid => lineBuffDataValid(2),
		o_data => lb2data,
		i_rd_data => lineBuffRdData(2)
	);
	lB3: lineBuffer port map (
		i_clk => i_clk,
		i_rst => i_rst,
		i_data => i_pixel_data,
		i_data_valid => lineBuffDataValid(3),
		o_data => lb3data,
		i_rd_data => lineBuffRdData(3)
	);
	o_pixel_data_valid <= rd_line_buffer;
	----------------------------------------------------------------------------
	--Update totalPixelCounter
	----------------------------------------------------------------------------
	totalPixelCnt: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				totalPixelCounter <= (OTHERS => '0');
			elsif (i_pixel_data_valid = '1' AND rd_line_buffer = '0') then
				totalPixelCounter <= totalPixelCounter + 1;
			elsif (i_pixel_data_valid = '0' AND rd_line_buffer = '1') then
				totalPixelCounter <= totalPixelCounter - 1;
			end if; 
		end if;
	end process totalPixelCnt;
	----------------------------------------------------------------------------
	--Next State Update
	----------------------------------------------------------------------------
	ns: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				rdState <= IDLE;
				rd_line_buffer <= '0';
				o_intr <= '0';
			elsif (rdState = IDLE) then
				o_intr <= '0';
				if (totalPixelCounter >= 3*imageWidth) then
					rdState <= RD_BUFFER;
					rd_line_buffer <= '1';
				end if;
			elsif (rdState = RD_BUFFER) then
				if (rdCounter = imageWidth-1) then
					rdState <= IDLE;
					rd_line_buffer <= '0';
					o_intr <= '1';
				end if;
			end if;
		end if;
	end process ns;
	----------------------------------------------------------------------------
	--Following section of code deals with the writing process to the 4 line
	--buffers and controls to which line buffer the new pixel will be written
	----------------------------------------------------------------------------
	--PixelCounter Update--
	----------------------------------------------------------------------------
	pixelCnt: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				pixelCounter <= (OTHERS => '0');
			elsif (i_pixel_data_valid = '1') then
				pixelCounter <= pixelCounter + 1;
			end if;
		end if;
	end process pixelCnt;
	----------------------------------------------------------------------------
	--currentWrLineBuffer--
	----------------------------------------------------------------------------
	crtWrLB: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				currentWrLineBuffer <= (OTHERS => '0');
			elsif (pixelCounter = imageWidth-1 AND i_pixel_data_valid = '1') then
				currentWrLineBuffer <= currentWrLineBuffer + 1;
			end if;
		end if;
	end process crtWrLB;
	----------------------------------------------------------------------------
	--lineBuffDataValid--
	----------------------------------------------------------------------------
	LBdataValid: process (currentWrLineBuffer, i_pixel_data_valid) begin
		lineBuffDataValid <= (OTHERS => '0');
		lineBuffDataValid(to_integer(currentWrLineBuffer)) <= i_pixel_data_valid; 
	end process LBdataValid;
	----------------------------------------------------------------------------
	--Following section of code deals with the read process and determine from
	--which line buffers the new pixels -to be convolved with the kernel- will
	--be read.
	----------------------------------------------------------------------------
	--rdCounter--
	----------------------------------------------------------------------------
	rdCnt: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				rdCounter <= (OTHERS => '0');
			elsif (rd_line_buffer = '1') then
				rdCounter <= rdCounter + 1;
			end if;
		end if;
	end process rdCnt;
	----------------------------------------------------------------------------
	--currentRdLineBuffer--
	----------------------------------------------------------------------------
	crtRdLB: process (i_clk) begin
		if rising_edge (i_clk) then
			if (i_rst = '1') then
				currentRdLineBuffer <= (OTHERS => '0');
			elsif (rdCounter = imageWidth-1 AND rd_line_buffer = '1') then
				currentRdLineBuffer <= currentRdLineBuffer + 1;
			end if;
		end if;
	end process crtRdLB;
	----------------------------------------------------------------------------
	--o_pixel_data
	----------------------------------------------------------------------------
	process (currentRdLineBuffer, lb0data, lb1data, lb2data, lb3data) begin
		case (currentRdLineBuffer) is
			when "00" => o_pixel_data <= lb2data & lb1data & lb0data;
			when "01" => o_pixel_data <= lb3data & lb2data & lb1data;
			when "10" => o_pixel_data <= lb0data & lb3data & lb2data;
			when "11" => o_pixel_data <= lb1data & lb0data & lb3data;
			when others => o_pixel_data <= (OTHERS => '0');
		end case;
	end process;
	--------------------------------------------------------------------------------
	--lineBuffRdData--
	--------------------------------------------------------------------------------
	process (rd_line_buffer , currentRdLineBuffer) begin
		lineBuffRdData <= (others => rd_line_buffer);
		case (currentRdLineBuffer) is
			when "00" => lineBuffRdData(3) <= '0';
			when "01" => lineBuffRdData(0) <= '0';
			when "10" => lineBuffRdData(1) <= '0';
			when "11" => lineBuffRdData(2) <= '0';
			when others => lineBuffRdData <= (OTHERS => '0');
		end case;
	end process;
end architecture behav;
