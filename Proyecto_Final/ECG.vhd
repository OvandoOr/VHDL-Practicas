library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ECG is	 
	port(
		RST 	: in std_logic;
		CLK 	: in std_logic;
		ST_ECG 	: in std_logic;
		EOT 	: buffer std_logic;
		TX  	: out std_logic
	);
end ECG;


architecture Bloques of ECG is

component Transmision_RS232 is	 
	port(
		RST : in std_logic;
		CLK : in std_logic;
		STT : in std_logic;
		EOT : out std_logic;
		D   : in std_logic_vector(7 downto 0);
		TX  : out std_logic
	);
end component;

component FSM is 
	port(
	START	:	in std_logic;
	RST		:	in std_logic;
	EOT		:	in std_logic;
	CLK		:	in std_logic;
	INC		:	out std_logic;
	ST_T	: 	out std_logic
	
	);
end component; 

component ROM_Chirp is
   port(
      CLK : in std_logic;
      I   : in  std_logic_vector(9 downto 0);
      A   : out std_logic_vector(7 downto 0)
      );
end component;  

component Contador_step is
	generic(
	n: 	integer:= 10		-- No. de bits informacion
	); 

	port(
	RST : in  std_logic;
	INC : in  std_logic;
	I   : out std_logic_vector(n-1 downto 0)
	);
end component;


   

	
begin

	-- Instancias
	Modulo_1 : 	transmision_RS232	port map();
	Modulo_2 :	FSM	   		port map();
	Modulo_3 : 	ROM_CHIRP      		port map();
	Modulo_4 : 	CONTADOR_STEP  		port map();



end Bloques;
