--------------------------------------------------------------
-- ADS7844 Analog to digital converter transmitter interface
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
--------------------------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
										
entity ADS7844TX is
	port(
	RST:     in std_logic;				      --Master reset
	CLK:     in std_logic;					  --Master clock
	STC:     in std_logic;					  --Start conversion
	ACH:     in std_logic_vector(2 downto 0); --ADS7844 Channel selection
	SGLDIF:  in std_logic;				      --ADS7844 Single ended or differential input mode selection
	PD:      in std_logic; 					  --ADS7844 Power down mode
	CLRTB:   in std_logic;					  --Clear time base flag
	ADSSCLK: out std_logic;				      --ADS7844 SPI Serial Clock
	ADSDIN:  out std_logic;				      --ADS7844 SPI Data in
	TB:      out std_logic;					  --Time Base signal output
	EOT:     out std_logic				      --End of transmission
	);
end ADS7844TX;

architecture modular of ADS7844TX is

--Time base generator
component ADS7844_TB
	generic(
	n: integer :=8
	);
	port(
	RST,CLK: in std_logic;				--Master Reset and Clock
	CLR: in std_logic;					--Zero Set
	BT: out std_logic                  	--Time Base Out
	);
end component;

--Time base to serial clock generator
component ADS7844_SCLKGEN 
	port(
	RST,CLK: in std_logic;					--Master Reset and Clock
	BT: in std_logic;	                  	--Time Base Out
	CLR: in std_logic;						--Zero Set
	SCLK: out std_logic						--Serial Clock Out
	);
end component;

component Multiplexor_8_1
	port(
	D0,D1,D2,D3,D4,D5,D6,D7: in std_logic;		--Multiplexer inputs
	S: in std_logic_vector(2 downto 0);			--Selector input
	Y: out std_logic							--Multiplexer output
	);
end component;

component ADS7844_FSM_TX
	port(
	RST,CLK: in std_logic;						--Master Reset and Clock
	STT: in std_logic;							--Start transmission input
	TB: in std_logic;							--Time Base Input
	OPCMUX: out std_logic_vector(2 downto 0);	--Multiplexer selection output
	EOT: out std_logic                		 	--End of transmision flag output
	);
end component;

signal SBT,SSCLK,SEOT: std_logic;
signal SOPCMUX: std_logic_vector(2 downto 0);

begin
	
TIMEBASE : ADS7844_TB port map (RST,CLK,CLRTB,SBT);
SERIALCLOCKGEN : ADS7844_SCLKGEN port map (RST,CLK,SBT,CLRTB,SSCLK);
TX_MUX:	Multiplexor_8_1 port map ('0','1',ACH(2),ACH(1),ACH(0),SGLDIF,PD,PD,SOPCMUX,ADSDIN);
FSM_Master: ADS7844_FSM_TX port map (RST,CLK,STC,SBT,SOPCMUX,SEOT);

EOT <=SEOT;
TB  <=SBT;
ADSSCLK <= SSCLK;

end modular;
	
	