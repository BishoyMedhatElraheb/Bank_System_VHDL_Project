LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Pcount_7_Segment IS
	PORT(input: IN std_logic_vector(3 DOWNTO 0);
	     output: OUT std_logic_vector(6 DOWNTO 0));
END ENTITY Pcount_7_Segment;

ARCHITECTURE behav OF Pcount_7_Segment IS
BEGIN
	PROCESS (input) IS
	BEGIN
		CASE input IS
			WHEN "0000" => output <= "0000001"; -- "0"
			WHEN "0001" => output <= "1001111"; -- "1"
			WHEN "0010" => output <= "0010010"; -- "2"
			WHEN "0011" => output <= "0000110"; -- "3"
			WHEN "0100" => output <= "1001100"; -- "4"
			WHEN "0101" => output <= "0100100"; -- "5"
			WHEN "0110" => output <= "0100000"; -- "6"
			WHEN "0111" => output <= "0001111"; -- "7"
			WHEN others => output <= "0000001"; -- "0"
		END CASE;
	END PROCESS;
END ARCHITECTURE behav;