library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Contador_step is
	generic(
	n: 	integer:= 3		-- No. de bits informacion
	); 

	port(
	RST : in  std_logic;
	INC : in  std_logic;
	I   : out std_logic_vector(n-1 downto 0)
	);
end Contador_step;

architecture Programable of Contador_step is

signal Qn, Qp, One : 	std_logic_vector (n-1 downto 0);
signal W:				std_logic_vector (n-2 downto 0); 
signal OPC:				std_logic_vector (1 downto 0);
signal X:				std_logic;
signal K:				std_logic_vector (n-1 downto 0);

--constant One : std_logic_vector(n-1 downto 0) := (others=>'0');

begin
	X <= '1';
	W <= (others => '0');
	One <= W & X;
	
	Combinacional: process(Qp,OPC,K)
	begin
		case OPC is						 
			when "10"	=> Qn <= Qp+1;	-- EN OPC siempre pongan el estado 10 para ser ascendente
			when "11"   => Qn <= K;
			when others => Qn <= Qp;
		end case;
		I <= Qp;
	end process Combinacional;
		
	Secuencial: process(RST,INC)
	begin		  
		if (RST='0') then
			Qp <= (others => '0');
		elsif (INC'event and INC='1') then
			Qp <= Qn;
		end if;
	end process Secuencial;		
	
	OPC <= "10";
	 K <= (others=>'0');
end Programable;
