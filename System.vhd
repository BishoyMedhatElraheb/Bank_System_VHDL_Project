LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY System IS
	PORT(clk, reset: IN std_logic;
		 tcount: IN std_logic_vector(1 DOWNTO 0);
		 sensor1: IN std_logic;
		 sensor2: IN std_logic;
		 enable: IN bit);
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
	SIGNAL up1: std_logic;
	SIGNAL down1: std_logic;
	SIGNAL pcount_out: std_logic_vector(2 DOWNTO 0);
	SIGNAL rom_out: std_logic_vector(4 DOWNTO 0);
	SIGNAL rom_in: std_logic_vector(4 DOWNTO 0);
	
BEGIN
	rom_in <= tcount & pcount_out;
	G1: Enter PORT MAP (clk, reset, sensor1, up1);
	G2: OUT1 PORT MAP (clk, reset, sensor2, down1);
	G3: count3 PORT MAP (clk, reset, down1, up1, pcount_out);
	G4: rom PORT MAP (rom_in, enable, rom_out);
END ARCHITECTURE behav;