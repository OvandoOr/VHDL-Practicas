library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ComparadorMayor is
	generic(
	n: integer := 8
	);
	port(
	A:		in std_logic_vector(n-1 downto 0);
	B:  	in std_logic_vector(n-1 downto 0);
	Mayor:	out std_logic
	);
end ComparadorMayor;

architecture comparador of ComparadorMayor is
begin
	combinacional: process(A,B)
	begin
		if(A > B) then
			Mayor <= '1';
		else
			Mayor <= '0';
		end if;
	end process combinacional;
end comparador;
	
		
	
	
	