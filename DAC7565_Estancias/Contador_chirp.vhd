library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity Contador_chirp is
	generic(
	n: 	integer:= 3		-- No. de bits informacion
	); 
	port(  
	
	RST		:			in std_logic;
	CLK		:			in std_logic;
	OPC		:		in  std_logic_vector(1 downto 0);
	SETPOINT	:			in std_logic_vector (n-1 downto 0);
	steps		:				in std_logic_vector (n-1 downto 0);
	End_count:			in std_logic_vector (n-1 downto 0);
	count		:				out std_logic_vector (n-1 downto 0);
	Y			:				out	std_logic
	
	
	);
end Contador_chirp;


architecture simple of Contador_chirp is
signal qn, qp : std_logic_vector(n-1 downto 0);
begin
		
	combinacional : process(qp, SETPOINT, OPC, End_Count,STEPS)
	begin	
	
		case OPC is 
			when "00" => QN<=QP;
			when "01" => QN<=QP+steps; --aumento
			when others => QN<=SETPOINT; --clear
		end case;
		
		if(qp = End_Count) then
			qn	<= SETPOINT;
		end if;	
		
	end process combinacional;	
	
	
	salida	:	process(qp, End_count)
	begin
		if(qp = End_count) then
			Y  <= '1';
			 
			
		else
			Y  <= '0';
			
		end if;
	end process salida;	  	

--zeros <= (others=>'0');


	
	
	secuencial : process(RST, CLK)
	begin  
		if(RST = '0') then
			qp <= (others => '0');
		elsif(CLK'event and CLK ='1') then
			qp <= qn;
		end if;		
	end process secuencial;
	
	
	count <= Qp;

end simple;