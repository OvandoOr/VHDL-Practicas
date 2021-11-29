library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RS232_2BYTES_TX is	 
	port(
		RST 	: in std_logic;
		CLK 	: in std_logic;
		STT_16 	: in std_logic;
		EOT_16 	: out std_logic;
		D   	: in std_logic_vector(15 downto 0);
		TX  	: out std_logic
	);
end RS232_2BYTES_TX;


architecture Bloques of  RS232_2BYTES_TX is

Component Transmision_RS232 is	 
	port(
		RST : in std_logic;
		CLK : in std_logic;
		STT : in std_logic;
		EOT : out std_logic;
		D   : in std_logic_vector(7 downto 0);
		TX  : out std_logic
	);
end component;	  


component FSM_TR_16 is
	 port(
		 RST 			: in STD_LOGIC;
		 CLK 			: in STD_LOGIC;
		 EOT_8 			: in STD_LOGIC;
		 STT_16 		: in STD_LOGIC;
		 EOT_16 		: out STD_LOGIC;
		 STT_8			: out STD_LOGIC;
		 S				: out STD_LOGIC
	     );
end component;	

component Mux_n is
	generic(
		n : integer := 6	
		);
	
	port(
		A	 	: in std_logic_vector (n-1 downto 0);
		B		: in std_logic_vector (n-1 downto 0);
		S		: in std_logic;
		Z		: out std_logic_vector (n-1 downto 0)
		);
	end component;


   
signal MSBYTE,LSBYTE,MUX_BYTE	: std_logic_vector(7 downto 0);
signal STT_8,EOT_8,S 			: std_logic;	  
	
begin

	-- Instancias
	Modulo_1 : 	Transmision_RS232  	port map (RST,CLK,STT_8,EOT_8,MUX_BYTE,TX);	 
	Modulo_2 :	Mux_n				generic map (8)
									port map (MSBYTE,LSBYTE,S,MUX_BYTE);
	Modulo_3 :	FSM_TR_16			port map (RST,CLK,EOT_8,STT_16,EOT_16,STT_8,S); 

	MSBYTE <= D(15 downto 8);
	LSBYTE <= D(7 downto 0);

end Bloques;
