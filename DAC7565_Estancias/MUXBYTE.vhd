library ieee;
use ieee.std_logic_1164.all;


entity MUXBYTE is
	port(
	
	--MODE		:		in std_logic_vector(1 downto 0);	--selectores del modo de operacion
	NCH			:		in std_logic_vector(1 downto 0);	--selectores del canal del dac	
	MSBYTE		:		in  std_logic_vector(7 downto 0);	--byte de datos mas significativos
	LSBYTE1		:		in  std_logic_vector(3 downto 0);	--byte de datos menos significativos
	OPCBYTE		:		in  std_logic_vector(1 downto 0);	--selector del mutilplexor
	SALIDA		:		out	std_logic_vector(7 downto 0)
	
	);
end MUXBYTE;


architecture simple of MUXBYTE is 
signal CONTROL	:	std_logic_vector(7 downto 0);
signal LSBYTE	:	std_logic_vector(7 downto 0);
begin 
	
	
	CONTROL <= "00" & "01" & '0' & NCH & '0';
	LSBYTE	<= LSBYTE1 & "0000"; 
	
	
	
	process(OPCBYTE,CONTROL,MSBYTE,LSBYTE)
	begin
		case OPCBYTE is
			when "00"   => SALIDA <= CONTROL;
			when "01"   => SALIDA <= MSBYTE;
			when others	=> SALIDA <= LSBYTE;
		end case;		
	end process; 	
end simple;