-----------------------------------------------
-- 12 bit Serial to parallel register SHL 
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library ieee;
use ieee.std_logic_1164.all;

entity reg_s_p_12b is
	generic(
	n: integer :=12
	);
	
	port(
	RST: in std_logic;	--Reset maestro
	CLK: in std_logic;	--Reloj maestro
	S:   in std_logic;	--Entrada serial de datos
	H:   in std_logic;	--Entrada de habilitacion
	Q:	 out std_logic_vector(n-1 downto 0) --Salida paralela de datos
	);
	
end reg_s_p_12b;


architecture algoritmica of reg_s_p_12b is

signal Qp,Qn: std_logic_vector(n-1 downto 0);
begin
	
	combinacional:process(Qp,S,H)
	begin
		if(H='0') then
			Qn <= Qp;
		else
			Qn <= Qp(n-2 downto 0) & S;
		end if;
		Q <= Qp;
	end process combinacional;
	
	secuencial:process(RST,CLK)					
	begin
		if(RST='0') then						--Zero for ALTERA 
			Qp<=(others=>'0');
		elsif(CLK'event and CLK='1') then
			Qp<=Qn;
		end if;
	end process secuencial;
end algoritmica;
