library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity basetiempo_20ns is
	port(  
	
	RST		:		in  std_logic;
	CLK		:		in  std_logic;
	CLEAR	:		in  std_logic;
	Y		:		out	std_logic
	
	
	);
end basetiempo_20nS;


architecture simple of basetiempo_20nS is
signal qn, qp : std_logic;
begin
	combinacional : process(qp, CLEAR)
	begin	
		if(qp = '1' or CLEAR = '1') then
			qn	<= '0';
		else
			qn	<= '1';
			
		end if;	
		
	end process combinacional;	
	
	
	salida	:	process(qp)
	begin
		if(qp = '1') then
			Y  <= '1';
			 
			
		else
			Y  <= '0';
			
		end if;
	end process salida;	  	

	
	
	secuencial : process(RST, CLK)
	begin  
		if(RST = '0') then
			qp <= '0';
		elsif(CLK'event and CLK ='1') then
			qp <= qn;
		end if;		
	end process secuencial;
end simple;

