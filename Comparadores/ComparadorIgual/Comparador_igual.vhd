library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Comparador_igual is
	generic(
	n: integer := 8
	);
	port(
	A:		in std_logic_vector(n-1 downto 0);
	B:  	in std_logic_vector(n-1 downto 0);
	Igual:	out std_logic
	);
end Comparador_igual;

architecture comparador of Comparador_igual is
begin
	combinacional: process(A,B)
	begin
		if(A = B) then
			Igual <= '1';
		else
			Igual <= '0';
		end if;
	end process combinacional;
end comparador;
	
		
	
	
	