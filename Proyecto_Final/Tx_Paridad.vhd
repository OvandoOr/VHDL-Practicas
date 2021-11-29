library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Tx_Paridad is
	 port(
		 D : in STD_LOGIC_VECTOR(7 downto 0);
		 P : out STD_LOGIC
	     );
end Tx_Paridad;


architecture Simple of Tx_Paridad is
begin
	P <= ((D(0) XOR D(1)) XOR (D(2) XOR D(3))) XOR	   
		 ((D(4) XOR D(5)) XOR (D(6) XOR D(7)));
end Simple;
