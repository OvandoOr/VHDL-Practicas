library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Transmision_RS232 is	 
	port(
		RST : in std_logic;
		CLK : in std_logic;
		STT : in std_logic;
		EOT : out std_logic;
		D   : in std_logic_vector(7 downto 0);
		TX  : out std_logic
	);
end Transmision_RS232;


architecture Bloques of Transmision_RS232 is

component Tx_Maquina_FSM
	port(
		RST : in std_logic;
		CLK : in std_logic;
		B   : in std_logic;
		STT : in std_logic;
		EOT : out std_logic;
		M   : out std_logic_vector(3 downto 0)			
	);
end component;	   
	
component Tx_Divisor
	port(
		RST : in std_logic;
		CLK : in std_logic;
		B   : out std_logic	
	);
end component;	   
	
component Tx_Paridad
	port(
		D : in std_logic_vector(7 downto 0);	
	P : out std_logic
	);
end component;
	
component Tx_MUX_Salida
	port(
		M  : in std_logic_vector(3 downto 0);	
		D  : in std_logic_vector(7 downto 0);
		P  : in std_logic;
		Tx : out std_logic			
	);
end component;	
   
signal M    : std_logic_vector(3 downto 0);
signal P, B : std_logic;
--Signal D		: std_logic_vector (7 downto 0);	  
	
begin

	-- Instancias
	Modulo_1 : Tx_Maquina_FSM  port map(RST,CLK,B,STT,EOT,M);
	Modulo_2 : Tx_Divisor	   port map(RST,CLK,B);
	Modulo_3 : Tx_Paridad      port map(D,P);
	Modulo_4 : Tx_MUX_Salida   port map(M,D,P,Tx);

--D <= "01000000";								  

end Bloques;
