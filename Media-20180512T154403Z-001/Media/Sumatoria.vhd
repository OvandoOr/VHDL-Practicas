library IEEE;
use IEEE.std_logic_1164.all;

entity Sumatoria is 
	port(
	SUM_IN	:	in std_logic_vector (5 downto 0);
	LD_R1	:	in std_logic;
	LD_R2	:	in std_logic;
	LD_R3	:	in std_logic;
	RST		:	in std_logic;
	CLK		:	in std_logic;
	SUM_OUT		:	out std_logic_vector (5 downto 0);  
	Entero 		: 	out std_logic_vector (3 downto 0); 
	Decimal		:	out std_logic_vector (1 downto 0)
	);
end Sumatoria;

architecture simple of Sumatoria is 


component SUMADOR is 
	port(
	A,B	:	in 	std_logic_vector (5 downto 0); 	-- Entradas sumador 6 bits
	Ci	:	in 	std_logic; 						-- acarreo de entrada
	S	:	out std_logic_vector (5 downto 0);	-- Suma aritmética
	Cout : 	out std_logic						-- acarreo de salida
	);
end component;

component Registro is 
	port(
	R_IN	:	in std_logic_vector (5 downto 0);
	LD		:	in std_logic;
	RST		:	in std_logic;
	CLK		:	in std_logic;
	R_OUT	:	out std_logic_vector (5 downto 0) 
	);
end component;

signal SUM_IN_S : std_logic_vector (5 downto 0);
signal SUM_RET_S, S, SUMATORIA_S : std_logic_vector (5 downto 0);
signal S_Signal : std_logic_vector (5 downto 0);
begin
	Sumador1	: SUMADOR port map (SUM_IN_S,SUM_RET_S,'0', S_Signal,open);
	Reg_1		: Registro port map (SUM_IN,LD_R1,RST,CLK,SUM_IN_S);
	Reg_2		: Registro port map (S_Signal (5 downto 0),LD_R2,RST,CLK,SUM_RET_S); 
	Reg_3		: Registro port map (Sum_RET_S,LD_R3,RST,CLK,SUMATORIA_S); 
	
	
Entero <= SUMATORIA_S (5 downto 2);
Decimal <= SUMATORIA_S (1 downto 0);
	
	
	end simple; 