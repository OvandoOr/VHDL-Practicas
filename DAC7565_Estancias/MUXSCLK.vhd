library ieee;
use ieee.std_logic_1164.all;


entity MUXSCLK is
	port(
	
	X		:		in std_logic;
	OPCSCL	:		in std_logic;
	SCL		:		out std_logic
	
	);
end MUXSCLK;	  


architecture simple of MUXSCLK is 
begin
	process (OPCSCL,X)
	begin
		
		if(OPCSCL = '0') then
			SCl <= X;
		else
			SCL <= '1';
		end if;		
	end process;
end simple;