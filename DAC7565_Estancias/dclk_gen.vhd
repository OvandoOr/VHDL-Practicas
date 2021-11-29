library ieee;
use ieee.std_logic_1164.all;



entity dclk_gen is
	port( 
	
	RST				:		in  std_logic;
	CLK				:		in  std_logic;
	BASE_TIEMPO		:		in  std_logic;
	CLRCLKGEN		:		in  std_logic;
	DCLK			:		out std_logic
	
	);
end dclk_gen;


architecture simple of dclk_gen is
signal qn,qp : std_logic;
begin
	
	combinacional : process (qp,BASE_TIEMPO,CLRCLKGEN)
	begin
		case qp is
			
			when '0' =>
			if((BASE_TIEMPO = '1') and (CLRCLKGEN = '0')) then
				qn <= '1';
			else
				qn <= qp;
			end if;
			DCLK <= '0';
				
			
			
			when others =>
			if((BASE_TIEMPO = '0') and (CLRCLKGEN = '0'))  then
				qn <= qp;
			else
				qn <= '0';
			end if;
			DCLK <= '1';  
			
			
			
			
		end case;
	end process combinacional;
	
	
	secuencial: process(RST,CLK)
	begin
		if(RST = '0') then
			qp <= '0';
		elsif(CLK'event and CLK = '1') then
			qp <= qn;
		end if;
	end process secuencial;
end simple;