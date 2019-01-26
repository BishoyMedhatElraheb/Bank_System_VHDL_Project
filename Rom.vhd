LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_textio.ALL;
USE std.textio.ALL;

ENTITY rom IS
	PORT(addr: IN std_logic_vector(4 DOWNTO 0);
	     enable: IN bit;
	     data: OUT std_logic_vector(4 DOWNTO 0));
END ENTITY rom;

ARCHITECTURE function_arch OF rom IS
	TYPE rm IS ARRAY (0 TO 2**5-1) OF std_logic_vector (4 DOWNTO 0);
	FUNCTION rom_fill RETURN rm IS
		VARIABLE memory: rm;
		FILE f: text OPEN READ_MODE IS "Rom.txt";
		VARIABLE l: line;
	BEGIN
		FOR index IN memory'range LOOP
			readline(f, l);
			read(l, memory(index));
		END LOOP;
		RETURN memory;
	END FUNCTION rom_fill;
	constant word: rm := rom_fill;
BEGIN
	memory: PROCESS (enable, addr) IS 
	BEGIN
		IF enable = '1' THEN
			data <= word(conv_integer(addr));
		ELSE
			data <= (OTHERS => 'Z');
		END IF;
	END PROCESS memory;
END ARCHITECTURE function_arch;

	
