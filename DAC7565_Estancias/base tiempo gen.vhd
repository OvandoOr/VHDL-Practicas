library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity basetiempo is
	
	generic(
	n: 	integer:= 3		-- No. de bits informacion
	); 
	
	port(  
	
	RST		:		in  std_logic;
	CLK		:		in  std_logic;
	OPC		:		in  std_logic_vector(1 downto 0);
	DATA_I	:		in	std_logic_vector (n-1 downto 0);	
	DATA_F	:		in	std_logic_vector (n-1 downto 0);	
	Y			:		out	std_logic
	
	
	);
end basetiempo;


architecture simple of basetiempo is
signal qn, qp : std_logic_vector(n downto 0);

begin
	combinacional : process(QP, QN, OPC, DATA_I, DATA_F)
	begin	
		case OPC is 
			when "00" => QN<=QP;
			when "01" => QN<=QP+1; --aumento
			when others => QN<=(others=>'0'); --clear
		end case;
		
		if(qp = DATA_I+DATA_F) then
			qn	<= (others => '0');
		end if;	
		
	end process combinacional;	
	
	
	salida	:	process(qp, DATA_I)
	begin
		if(qp > DATA_I) then
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