library IEEE;
use IEEE.std_logic_1164.all;

entity FSM is 
	port(
	START	:	in std_logic;
	RST		:	in std_logic;
	EOT		:	in std_logic;
	CLK		:	in std_logic;
	INC		:	out std_logic;
	ST_T	: 	out std_logic
	
	);
end FSM;  

architecture maquina of FSM is

begin
	combinacional : process (Qp, START, EOT )

		
	end maquina;
	
