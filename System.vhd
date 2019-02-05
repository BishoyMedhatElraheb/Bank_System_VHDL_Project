LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY System IS
	PORT(clk, reset: IN std_logic;
		 tcount: IN std_logic_vector(1 DOWNTO 0);
		 sensor1: IN std_logic := '1';
		 sensor2: IN std_logic := '1';
		 enable: IN bit := '1';
		 output1: OUT std_logic_vector(6 DOWNTO 0);
		 output2: OUT std_logic_vector(6 DOWNTO 0);
		 output3: OUT std_logic_vector(6 DOWNTO 0));
END ENTITY System;

ARCHITECTURE behav OF System IS
	COMPONENT Enter
		PORT(clk, reset: IN std_logic;
		 	x: IN std_logic;
		 	y: OUT std_logic);
	END COMPONENT Enter;
	COMPONENT OUT1
		PORT(clk, reset: IN std_logic;
		 	x: IN std_logic;
		 	y: OUT std_logic);
	END COMPONENT OUT1;
	COMPONENT count3
		PORT(clk, reset, down, up: IN std_logic;
		 	d_out: OUT std_logic_vector(2 DOWNTO 0));
	END COMPONENT count3;
	COMPONENT rom
		PORT(addr: IN std_logic_vector(4 DOWNTO 0);
	     		enable: IN bit;
	     		data: OUT std_logic_vector(4 DOWNTO 0));
	END COMPONENT rom;
	COMPONENT Pcount_7_Segment
		PORT(input: IN std_logic_vector(3 DOWNTO 0);
	             output: OUT std_logic_vector(6 DOWNTO 0));
	END COMPONENT Pcount_7_Segment;
	COMPONENT three_to_four_converter
		PORT(input: IN std_logic_vector(2 DOWNTO 0);
	     	     output: OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT three_to_four_converter;
	COMPONENT five_to_four_converter
		PORT(input: IN std_logic_vector(4 DOWNTO 0);
	     	     output1: OUT std_logic_vector(3 DOWNTO 0);
	     	     output2: OUT std_logic_vector(3 DOWNTO 0));
	END COMPONENT five_to_four_converter;
	SIGNAL up1: std_logic;
	SIGNAL down1: std_logic;
	SIGNAL pcount_out: std_logic_vector(2 DOWNTO 0);
	SIGNAL rom_out: std_logic_vector(4 DOWNTO 0);
	SIGNAL rom_in: std_logic_vector(4 DOWNTO 0);
	SIGNAL three_to_four_converter_out: std_logic_vector(3 DOWNTO 0);
	SIGNAL five_to_four_converter_out_1: std_logic_vector(3 DOWNTO 0);
	SIGNAL five_to_four_converter_out_2: std_logic_vector(3 DOWNTO 0);
BEGIN
	rom_in <= tcount & pcount_out;
	G1: Enter PORT MAP (clk, reset, sensor1, up1);
	G2: OUT1 PORT MAP (clk, reset, sensor2, down1);
	G3: count3 PORT MAP (clk, reset, down1, up1, pcount_out);
	G4: rom PORT MAP (rom_in, enable, rom_out);
	G5: three_to_four_converter PORT MAP (pcount_out, three_to_four_converter_out);
	G6: Pcount_7_Segment PORT MAP (three_to_four_converter_out, output1);
	G7: five_to_four_converter PORT MAP (rom_out, five_to_four_converter_out_1, five_to_four_converter_out_2);
	G8: Pcount_7_Segment PORT MAP (five_to_four_converter_out_1, output2);
	G9: Pcount_7_Segment PORT MAP (five_to_four_converter_out_2, output3);
END ARCHITECTURE behav;