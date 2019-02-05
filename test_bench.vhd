LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;
use ieee.numeric_std.all;

ENTITY test_bench IS
END ENTITY test_bench;

ARCHITECTURE test OF test_bench IS
	COMPONENT System
		PORT(clk, reset: IN std_logic;
		     tcount: IN std_logic_vector(1 DOWNTO 0);
		     sensor1: IN std_logic := '1';
		     sensor2: IN std_logic := '1';
		     enable: IN bit := '1';
		     output1: OUT std_logic_vector(6 DOWNTO 0);
		     output2: OUT std_logic_vector(6 DOWNTO 0);
		     output3: OUT std_logic_vector(6 DOWNTO 0));
	END COMPONENT System;

	SIGNAL clk, rst, sensor1, sensor2: std_logic;
	SIGNAL enable: bit;
	SIGNAL tcount: std_logic_vector(1 DOWNTO 0);
	SIGNAL output1: std_logic_vector(6 DOWNTO 0);
	SIGNAL output2: std_logic_vector(6 DOWNTO 0);
	SIGNAL output3: std_logic_vector(6 DOWNTO 0);
BEGIN
	dut: System PORT MAP(clk, rst, tcount, sensor1, sensor2, enable, output1, output2, output3);
	PROCESS IS
		FILE file_test: text OPEN READ_MODE IS "input.txt";
		FILE file_output: text OPEN WRITE_MODE IS "output.txt";
		VARIABLE l: line;
		VARIABLE ol: line;
		VARIABLE clock_in_file, rst_in_file, sensor1_in_file, sensor2_in_file: std_logic;
		VARIABLE enable_in_file: bit;
		VARIABLE tcount_in_file: std_logic_vector(1 DOWNTO 0);
		VARIABLE output1_in_file: std_logic_vector(6 DOWNTO 0);
		VARIABLE output2_in_file: std_logic_vector(6 DOWNTO 0);
		VARIABLE output3_in_file: std_logic_vector(6 DOWNTO 0);
		VARIABLE pause: time;
		VARIABLE message: string (1 TO 5);
		VARIABLE o_message: string (1 TO 7) := "qout = ";
		
		BEGIN
			clk <= '0'; 
			rst <= '1'; 
			tcount <= "01"; 
			sensor1 <= '1'; 
			sensor2 <= '1'; 
			enable <= '1';
			WHILE NOT endfile (file_test) LOOP
				readline (file_test, l);
				read (l, clock_in_file);
				read (l, rst_in_file);
				read (l, sensor1_in_file);
				read (l, sensor2_in_file);
				read (l, enable_in_file);
				read (l, tcount_in_file);
				read (l, pause);
				read (l, output1_in_file);
				read (l, output2_in_file);
				read (l, output3_in_file);
				read (l, message);
				clk <= clock_in_file;
				rst <= rst_in_file;
				sensor1 <= sensor1_in_file;
				sensor2 <= sensor2_in_file;
				enable <= enable_in_file;
				tcount <= tcount_in_file;
				write (ol, o_message);
				write (ol, output1);
				write (ol, output2);
				write (ol, output3);
				writeline (file_output, ol);
				WAIT FOR pause;
				ASSERT output1 = output1_in_file
					REPORT message
					SEVERITY error;
				ASSERT output2 = output2_in_file
					REPORT message
					SEVERITY error;
				ASSERT output3 = output3_in_file
					REPORT message
					SEVERITY error;
			ENd LOOP;
			file_close(file_test);
			file_close(file_output);
			WAIT;            -- stop simulation run
		END PROCESS;
END ARCHITECTURE test;
