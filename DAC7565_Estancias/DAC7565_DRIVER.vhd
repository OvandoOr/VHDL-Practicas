library ieee;
use ieee.std_logic_1164.all;


entity DAC7565_DRIVER is
	port( 
	
	RST			:		IN  STD_LOGIC;
	CLK			:		IN  STD_LOGIC;
	--MODE		:		IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	--NCH			:		IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	MSB			:		IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	LSB			:		IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	STC			:		IN  STD_LOGIC;
	SYNC			:		OUT STD_LOGIC;
	DIN			:		OUT STD_LOGIC;
	SCLK			:		OUT STD_LOGIC;
	EOC			:		OUT STD_LOGIC
	
	);
end DAC7565_DRIVER;


architecture simple of DAC7565_DRIVER is

signal OPCBYTEM		:	std_logic_vector(1 downto 0);
signal OPCTXM		:	std_logic_vector(2 downto 0);
signal OPCSCLKM		:	std_logic;
signal STXM			:	std_logic;
signal EOTM			:	std_logic;
signal TBM			:	std_logic;
signal SCLKM		:	std_logic;
signal CLEARTBM		:	std_logic;
signal CLEARSCLKM	:	std_logic;
signal SALIDAM		:	std_logic_vector(7 downto 0);

signal NCH			:	STD_LOGIC_VECTOR(1 DOWNTO 0);




component basetiempo_200ns is
	port(  
	
	RST		:		in  std_logic;
	CLK		:		in  std_logic;
	CLEAR	:		in  std_logic;
	Y		:		out	std_logic
	
	
	);
end component basetiempo_200nS;



component dclk_gen is
	port( 
	
	RST				:		in  std_logic;
	CLK				:		in  std_logic;
	BASE_TIEMPO		:		in  std_logic;
	CLRCLKGEN		:		in  std_logic;
	DCLK			:		out std_logic
	
	);
end component dclk_gen;	



component MUXBYTE is
	port(
	
	--MODE		:		in std_logic_vector(1 downto 0);	--selectores del modo de operacion
	NCH			:		in std_logic_vector(1 downto 0);	--selectores del canal del dac	
	MSBYTE		:		in  std_logic_vector(7 downto 0);	--byte de datos mas significativos
	LSBYTE1		:		in  std_logic_vector(3 downto 0);	--byte de datos menos significativos
	OPCBYTE		:		in  std_logic_vector(1 downto 0);	--selector del mutilplexor
	SALIDA		:		out	std_logic_vector(7 downto 0)
	
	);
end component MUXBYTE;



component MUXTX is
	port( 
	
	OPCTX	:		in std_logic_vector(2 downto 0);
	X		:		in  std_logic_vector(7 downto 0);
	Y		:		out std_logic
	
	);
end component MUXTX;



component MUXSCLK is
	port(
	
	X		:		in std_logic;
	OPCSCL	:		in std_logic;
	SCL		:		out std_logic
	
	);
end component MUXSCLK;



component FSM_TXDAC is
	port(
	
	RST		:		in std_logic; 						--reset maestro
	CLK		:		in std_logic;					    --reloj marestro
	STX		:		in std_logic;					    --start tranmision
	TB		:		in std_logic;						--base de tiempo
	OPCTX	:		out std_logic_vector(2 downto 0);   --selector para el multiplexor
	EOT		:		out std_logic						--señal de fin de transmisión
	
	);
end component FSM_TXDAC;



component FSM_MASTER is
	port( 
	
	RST			:		in  std_logic;
	CLK			:		in  std_logic;
	STC			:		in  std_logic;
	TB			:		in  std_logic;
	EOT			:		in  std_logic;
	STX			:		out	std_logic;
	SYNC		:		out std_logic;
	OPCBYTE		:		out std_logic_vector(1 downto 0);
	OPCSCLK		:		out std_logic;
	CLEARTB		:		out std_logic;
	CLEARSCLK	:		out std_logic;
	EOC			:		out std_logic
	
	);
end component FSM_MASTER;


begin
	
	bloque1		:		basetiempo_200ns	port map(RST,CLK,CLEARTBM,TBM);
	bloque2		:		dclk_gen			port map(RST,CLK,TBM,CLEARSCLKM,SCLKM);
	bloque3		:		MUXBYTE				port map(NCH,MSB,LSB,OPCBYTEM,SALIDAM);	
	bloque4		:		MUXTX				port map(OPCTXM,SALIDAM,DIN);
	bloque5		:		MUXSCLK 			port map(SCLKM,OPCSCLKM,SCLK);
	bloque6		:		FSM_TXDAC			port map(RST,CLK,STXM,TBM,OPCTXM,EOTM);
	bloque7		:		FSM_MASTER			port map(RST,CLK,STC,TBM,EOTM,STXM,SYNC,OPCBYTEM,OPCSCLKM,CLEARTBM,CLEARSCLKM,EOC);
	--LSB <= LSB2 & "11";
	NCH <= "00";
end simple;