LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Wtime_7_Segment IS
	PORT(input: IN std_logic_vector(4 DOWNTO 0);
	     output1: OUT std_logic_vector(6 DOWNTO 0);
	     output2: OUT std_logic_vector(6 DOWNTO 0));
END ENTITY Wtime_7_Segment;

ARCHITECTURE behav OF Wtime_7_Segment IS
BEGIN
	PROCESS (input) IS
	BEGIN
		CASE input IS
			WHEN "00000" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0000001"; -- "0"
			WHEN "00001" => 
				output1 <= "0000001"; -- "0"
				output2 <= "1001111"; -- "1"
			WHEN "00010" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0010010"; -- "2"
			WHEN "00011" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0000110"; -- "3"
			WHEN "00100" => 
				output1 <= "0000001"; -- "0"
				output2 <= "1001100"; -- "4"
			WHEN "00101" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0100100"; -- "5"
			WHEN "00110" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0100000"; -- "6"
			WHEN "00111" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0001111"; -- "7"
			WHEN "01000" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0000000"; -- "8"
			WHEN "01001" => 
				output1 <= "0000001"; -- "0"
				output2 <= "0000100"; -- "9"
			WHEN "01010" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0000001"; -- "0"
			WHEN "01011" => 
				output1 <= "1001111"; -- "1"
				output2 <= "1001111"; -- "1"
			WHEN "01100" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0010010"; -- "2"
			WHEN "01101" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0000110"; -- "3"
			WHEN "01110" => 
				output1 <= "1001111"; -- "1"
				output2 <= "1001100"; -- "4"
			WHEN "01111" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0100100"; -- "5"
			WHEN "10000" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0100000"; -- "6"
			WHEN "10001" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0001111"; -- "7"
			WHEN "10010" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0000000"; -- "8"
			WHEN "10011" => 
				output1 <= "1001111"; -- "1"
				output2 <= "0000100"; -- "9"
			WHEN "10100" => 
				output1 <= "0010010"; -- "2"
				output2 <= "0000001"; -- "0"
			WHEN "10101" => 
				output1 <= "0010010"; -- "2"
				output2 <= "1001111"; -- "1"
			WHEN others => 
				output1 <= "0000001"; -- "0"
				output2 <= "0000001"; -- "0"
		END CASE;
	END PROCESS;
END ARCHITECTURE behav;
