library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity SUMADOR is 
	port(
	A,B	:	in 	std_logic_vector (5 downto 0); 	-- Entradas sumador 6 bits
	Ci	:	in 	std_logic; 						-- acarreo de entrada
	S	:	out std_logic_vector (5 downto 0);	-- Suma aritmética
	Cout : 	out std_logic						-- acarreo de salida
	);
end SUMADOR;

architecture aritmetica of SUMADOR is 	
begin
	process (A,B,Ci) --PROCESS
	Variable Suma: unsigned (6 downto 0);
	begin
		Suma := unsigned ('0' & A) + unsigned ('0' & B) + Ci;
		S <= std_logic_vector (suma(5 downto 0));
		Cout <= std_logic(suma(6));
	end process;	 --PROCESS
	end aritmetica; 