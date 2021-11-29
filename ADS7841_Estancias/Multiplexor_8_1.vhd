-----------------------------------------------
-- Serial Transmision Multiplexer
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	

library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplexor_8_1 is
	port(
	D0,D1,D2,D3,D4,D5,D6,D7: in std_logic;		--Multiplexer inputs
	S: in std_logic_vector(2 downto 0);			--Selector input
	Y: out std_logic							--Multiplexer output
	);
end Multiplexor_8_1;

architecture logical of Multiplexor_8_1 is
begin
	process(D0,D1,D2,D3,D4,D5,D6,D7,S)
	begin
		case S is
			when "000" => Y<=D0;
			when "001" => Y<=D1;
			when "010" => Y<=D2;
			when "011" => Y<=D3;
			when "100" => Y<=D4;
			when "101" => Y<=D5;
			when "110" => Y<=D6;
			when others => Y<=D7;
		end case;
	end process;
end logical;