																  library IEEE;
use IEEE.std_logic_1164.all;

entity Registro is 
	port(
	R_IN	:	in std_logic_vector (5 downto 0);
	LD		:	in std_logic;
	RST		:	in std_logic;
	CLK		:	in std_logic;
	R_OUT	:	out std_logic_vector (5 downto 0) 
	);
end Registro;

architecture simple of Registro is 

component Candado is 
	port(
	D	:	in std_logic;
	LD	:	in std_logic;
	RST	:	in std_logic;
	CLK	:	in std_logic;
	Q	:	out std_logic 
	);
end component;


begin
	FF_D5 : Candado port map (R_IN(5),LD,RST,CLK,R_OUT(5));
	FF_D4 : Candado port map (R_IN(4),LD,RST,CLK,R_OUT(4));
	FF_D3 : Candado port map (R_IN(3),LD,RST,CLK,R_OUT(3));
	FF_D2 : Candado port map (R_IN(2),LD,RST,CLK,R_OUT(2));
	FF_D1 : Candado port map (R_IN(1),LD,RST,CLK,R_OUT(1));
	FF_D0 : Candado port map (R_IN(0),LD,RST,CLK,R_OUT(0));
	
	
	
	
	
	end simple; 