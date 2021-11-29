library IEEE;

use IEEE.std_logic_1164.all;

entity Registro_Paralelo_Hold is
	generic(
	n: integer := 8
	);
	port(								   
	RST:	in std_logic;
	CLK:	in std_logic;
	H:		in std_logic;
	D:		in std_logic_vector(n-1 downto 0);
	Q:		out std_logic_vector(n-1 downto 0)
	);
end Registro_Paralelo_Hold;

architecture Registro of Registro_Paralelo_Hold is
signal Qn,Qp: std_logic_vector(n-1 downto 0);
begin
	combinacional: process(H,D,Qp)
	begin
		if(H = '1') then
			Qn <= D;
		else
			Qn <= Qp;
		end if;
		Q <= Qp;
	end process combinacional;
	
	secuencial: process(RST,CLK)
	begin
		if(RST = '1') then
			Qp <= (others => '0');
		elsif(CLK'event and CLK = '1') then
			Qp <= Qn;
		end if;
	end process secuencial;
	
end Registro;
	