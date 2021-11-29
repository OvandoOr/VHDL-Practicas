library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Contador_Ascendente_Clear is
	generic(
	n: integer := 8
	);
	port(
	RST:	in std_logic;
	CLK:	in std_logic;
	OPC:	in std_logic_vector(1 downto 0);
	Q:		out std_logic_vector(n-1 downto 0)
	);
end Contador_Ascendente_Clear;

architecture contador of Contador_Ascendente_Clear is
signal Qn,Qp: std_logic_vector(n-1 downto 0);
begin
	combinacional: process(OPC,Qp)
	begin
		case OPC is
			when "00" =>
			Qn <= Qp;
			when "01" =>
			Qn <= Qp + 1;
			when others =>
			Qn <= (others => '0');
		end case;			   
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
	
end contador;