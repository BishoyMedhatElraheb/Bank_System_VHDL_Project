LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Enter IS
	PORT(clk, reset: IN std_logic;
		 x: IN std_logic;
		 y: OUT std_logic);
END ENTITY Enter;

ARCHITECTURE moore_2p OF Enter IS
TYPE state_type IS (sensoron, sensoroff, sensoronagain);
	SIGNAL current_state: state_type;
	SIGNAL next_state: state_type;
BEGIN
	cs: PROCESS(clk, reset)
	BEGIN
		IF reset = '1' THEN
			current_state <= sensoron;
		ELSIF rising_edge (clk) THEN
			current_state <= next_state;
		END IF;
	END PROCESS cs;
	ns: PROCESS(current_state, x) 
	BEGIN
		CASE current_state IS 
			WHEN sensoron =>
				IF x = '1' THEN
					next_state <= sensoron;
					y <= '1';
				ELSE
					next_state <= sensoroff;
				END IF;
			WHEN sensoroff =>
				IF x = '1' THEN
					next_state <= sensoronagain;
				ELSE 
					next_state <= sensoroff;
				END IF;
			WHEN sensoronagain =>
				IF x = '1' THEN
					next_state <= sensoron;
					y <= '0';
				ELSE
					next_state <= sensoroff;
				END IF;
		END CASE;
	END PROCESS ns;
END ARCHITECTURE moore_2p;