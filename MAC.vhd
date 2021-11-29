library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity MAC is
	generic(
	n: integer := 12;	-- numero de bits de la senal de entrada (ADC)
	m: integer := 18;	-- numero de bits de los coeficientes (FIR,IIR,Polinomio,Matriz,Vector)
	k: integer := 3		-- numero de bits del orden
	);											   
	port(
	RST:			in std_logic;
	CLK:			in std_logic;
	STP:			in std_logic;	-- inicio de proceso dado por el filtro
	x:				in std_logic_vector(n-1 downto 0);	-- senal del ADC
	coef:			in std_logic_vector(m-1 downto 0);	-- coeficientes del filtro
	orden:			in std_logic_vector(k-1 downto 0);	-- orden, numero de multiplicaciones a realizar
	y:				out std_logic_vector(n-1 downto 0);	-- salida, hacia el DAC
	I:				out std_logic_vector(k-1 downto 0);	-- selecciona que coeficientes y que dato llamar						
	EOP:			out std_logic
	);
end MAC;

architecture UnidadMultiplicadoraAcumuladora of MAC is

component Comparador_igual
	generic(
	n: integer := 8
	);
	port(
	A:		in std_logic_vector(n-1 downto 0);
	B:  	in std_logic_vector(n-1 downto 0);
	Igual:	out std_logic
	);
end component;

component Multiplicador_nm_ss
	generic(
	n : integer := 8;
	m : integer := 8
	);
	port(
	X : in  std_logic_vector(n-1   downto 0);
	A : in  std_logic_vector(m-1   downto 0);
	R : out std_logic_vector(m+n-1 downto 0)
	);
end component;

component Registro_Paralelo_Hold
	generic(
	n: integer := 8
	);
	port(								   
	RST:	in std_logic;
	CLK:	in std_logic;
	H:		in std_logic;
	D:		in std_logic_vector(n-1 downto 0);
	Q:		out std_logic_vector(n-1 downto 0)
	);
end component;

component Registro_Paralelo_Hold_Clear
	generic(
	n: integer := 8
	);
	port(								   
	RST:	in std_logic;
	CLK:	in std_logic;
	OPC:	in std_logic_vector(1 downto 0);
	D:		in std_logic_vector(n-1 downto 0);
	Q:		out std_logic_vector(n-1 downto 0)
	);
end component;

component Contador_Ascendente_Clear
	generic(
	n: integer := 8
	);
	port(
	RST:	in std_logic;
	CLK:	in std_logic;
	OPC:	in std_logic_vector(1 downto 0);
	Q:		out std_logic_vector(n-1 downto 0)
	);
end component;

component FSM_MAC
	port(
	RST:	in std_logic;
	CLK:	in std_logic;
	STP:	in std_logic;
	Igual:	in std_logic;
	OPC1:	out std_logic_vector(1 downto 0);
	OPC2:	out std_logic_vector(1 downto 0);
	EN:		out std_logic;
	EOP:	out std_logic
	);
end component;

-- ComparadorIgual
signal Igual: std_logic;

-- Multiplicador_nm_ss
signal Y1: std_logic_vector(n+m-1 downto 0);

-- Sumador
signal Y3: std_logic_vector(n+m+k-1 downto 0);

-- Registro_Paralelo_Hold
signal Y5: std_logic_vector(n+m+k-1 downto 0);

-- Registro_Paralelo_Hold_Clear
signal Y4: std_logic_vector(n+m+k-1 downto 0);

-- Contador_Ascendente_Clear
signal Q1: std_logic_vector(k-1 downto 0);

-- FSM_MAC
signal OPC1: std_logic_vector(1 downto 0);
signal OPC2: std_logic_vector(1 downto 0);
signal EN:	std_logic;

-- senales auxiliares
signal Y2: std_logic_vector(n+m+k-1 downto 0);

begin
	
	Y2(n+m+k-1 downto n+m) <= (others => Y1(n+m-1));
	Y2(n+m-1 downto 0) <= Y1;						
	-- Y2 8.7 con signo
	
	Y3 <= Y2 + Y4;	-- 8.7
	
	U0: Comparador_igual generic map(k) port map(Q1,Orden,Igual);
	U1: Multiplicador_nm_ss generic map(n,m) port map(x,coef,Y1); 	   -- Y1 5.7 con signo
	U2: Registro_Paralelo_Hold generic map(n+m+k) port map(RST,CLK,EN,Y4,Y5);
	U3: Registro_Paralelo_Hold_Clear generic map(n+m+k) port map(RST,CLK,OPC2,Y3,Y4);
	U4: Contador_Ascendente_Clear generic map(k) port map(RST,CLK,OPC1,Q1);
	U5: FSM_MAC port map(RST,CLK,STP,Igual,OPC1,OPC2,EN,EOP);
	
	-- Y5 8.7
	Y <= Y5(11 downto 6);
	I <= Q1;
	
end UnidadMultiplicadoraAcumuladora; 

	







	
	
	