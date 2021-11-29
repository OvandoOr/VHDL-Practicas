library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Contador_salida is
	generic(
	n: 	integer:= 10		-- No. de bits informacion
	); 

	port(
	RST 	: in  std_logic;
	CLK 	: in  std_logic; 
	K		: in  std_logic_vector(n-1 downto 0);
	cuenta 	: out std_logic_vector(n-1 downto 0)
	);
end Contador_salida;

architecture Programable of Contador_salida is

signal Qn, Qp: 	std_logic_vector (n-1 downto 0);
signal x: 	std_logic;

--signal K:		std_logic_vector (n-1 downto 0);

--constant One : std_logic_vector(n-1 downto 0) := (others=>'0');

begin
	
	Combinacional: process(Qp)
	begin
							 
		Qn <= Qp+1;	
		
		
	end process Combinacional;
		
	Secuencial: process(RST,CLK,Qp )
	begin		  
		if (RST='0') then
			Qp <= (others=>'0');
			
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
			
		elsif (Qp = K) then
			Qp <= (others=>'0');
			
		end if;	  
		
		cuenta <= Qp;

	end process Secuencial;	
	

	  
end Programable;
