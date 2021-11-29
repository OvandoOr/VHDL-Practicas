library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity basetiempo_200ns is
	port(  
	
	RST		:		in  std_logic;
	CLK		:		in  std_logic;
	CLEAR	:		in  std_logic;
	Y		:		out	std_logic
	
	
	);
end basetiempo_200nS;


architecture simple of basetiempo_200nS is
signal qn, qp : std_logic_vector(3 downto 0);
begin
	combinacional : process(qp, CLEAR)
	begin	
		if(qp = "1001" or CLEAR = '1') then
			qn	<= "0000";
			
			
			
		else
			qn	<= qp + 1;
			
		end if;	
		
	end process combinacional;	
	
	
	salida	:	process(qp)
	begin
		if(qp = "1001") then
			Y  <= '1';
			 
			
		else
			Y  <= '0';
			
		end if;
	end process salida;	  	

	
	
	secuencial : process(RST, CLK)
	begin  
		if(RST = '0') then
			qp <= (others => '0');
		elsif(CLK'event and CLK ='1') then
			qp <= qn;
		end if;		
	end process secuencial;
end simple;