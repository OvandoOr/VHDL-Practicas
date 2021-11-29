library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity TestMAC is
	generic(
	n: integer := 6;	-- numero de bits de la senal de entrada (ADC)
	m: integer := 6;	-- numero de bits de los coeficientes (FIR,IIR,Polinomio,Matriz,Vector)
	k: integer := 3		-- numero de bits del orden
	);	
end TestMAC;

architecture prueba of TestMAC is

component MAC
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
end component;

signal RST:			std_logic;
signal CLK:			std_logic;
signal STP:			std_logic;	-- inicio de proceso dado por el filtro
signal x:			std_logic_vector(n-1 downto 0);	-- senal del ADC
signal coef:		std_logic_vector(m-1 downto 0);	-- coeficientes del filtro
signal orden:		std_logic_vector(k-1 downto 0);	-- orden, numero de multiplicaciones a realizar
signal y:			std_logic_vector(n-1 downto 0);	-- salida, hacia el DAC
signal I:			std_logic_vector(k-1 downto 0);	-- selecciona que coeficientes y que dato llamar						
signal EOP:			std_logic;

begin
	
	U0: MAC generic map(n,m,k) port map(RST,CLK,STP,x,coef,orden,y,I,EOP);
	
	--formato 3.3 con signo para x
	--formato 2.4 con signo para coef
	x <= "001000"; 
	coef <= "010000";
	orden <= "111";
	
	Reloj: process
	begin
		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;
	end process Reloj;
	
	Reset: process
	begin
		RST <= '1';
		wait for 20 ns;
		RST <= '0';
		wait;
	end process Reset;
	
	Comienzo: process
	begin
		STP <= '0';
		wait for 1000 ns;
		STP <= '1';
		wait for 10 ns;
	end process Comienzo;
	
end prueba;