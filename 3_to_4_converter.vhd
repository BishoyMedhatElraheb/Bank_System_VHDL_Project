LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY three_to_four_converter IS
	PORT(input: IN std_logic_vector(2 DOWNTO 0);
	     output: OUT std_logic_vector(3 DOWNTO 0));
END ENTITY three_to_four_converter;

ARCHITECTURE behav OF three_to_four_converter IS
BEGIN
	PROCESS (input) IS
	BEGIN
		CASE input IS
			WHEN "000" => output <= "0000"; -- "0"
			WHEN "001" => output <= "0001"; -- "1"
			WHEN "010" => output <= "0010"; -- "2"
			WHEN "011" => output <= "0011"; -- "3"
			WHEN "100" => output <= "0100"; -- "4"
			WHEN "101" => output <= "0101"; -- "5"
			WHEN "110" => output <= "0110"; -- "6"
			WHEN "111" => output <= "0111"; -- "7"
			WHEN others => output <= "0000"; -- "0"
		END CASE;
	END PROCESS;
END ARCHITECTURE behav;