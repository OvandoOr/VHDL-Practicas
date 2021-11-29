library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ComparadorMenor is
	generic(
	n: integer := 8
	);
	port(
	A:		in std_logic_vector(n-1 downto 0);
	B:  	in std_logic_vector(n-1 downto 0);
	Menor:	out std_logic
	);
end ComparadorMenor;

architecture comparador of ComparadorMenor is
begin
	combinacional: process(A,B)
	begin
		if(A < B) then
			Menor <= '1';
		else
			Menor <= '0';
		end if;
	end process combinacional;
end comparador;
	
		
	
	
	