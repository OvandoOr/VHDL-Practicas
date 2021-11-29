library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Contador_step is
	generic(
	n: 	integer:= 6		-- No. de bits informacion
	); 

	port(
	RST 	: in  std_logic;
	CLK 	: in  std_logic; 
	STEP   	: buffer std_logic
	);
end Contador_step;

architecture Programable of Contador_step is

signal Qn, Qp, zeros: 	std_logic_vector (n-1 downto 0);
signal x: 	std_logic;
signal K:  std_logic_vector(n-1 downto 0);
--signal K:		std_logic_vector (n-1 downto 0);

--constant One : std_logic_vector(n-1 downto 0) := (others=>'0');

begin
	
	Combinacional: process(Qp)
	begin
							 
		Qn <= Qp-1;	-- EN OPC siempre pongan el estado 10 para ser ascendente
		
		
	end process Combinacional;
		
	Secuencial: process(RST,CLK,Qp )
	begin		  
		if (RST='0') then
			Qp <= K;
			STEP <= '0';
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
			STEP <= '0';
		elsif (Qp = zeros) then
			Qp <= K;
			STEP <= '1';
		end if;	  
		
	--	for i in 1 to n-1 loop
--		P(i) <= P(i-1) or M(i);
--		end loop;
--		
--		step <= not (P(N-1));
	end process Secuencial;	
	
	zeros <= (others=>'0');  
	K <= "101010";  
end Programable;
