-------------------------------------------------------------
-- ADS7844 Analog to digital converter controller core
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-------------------------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
										
entity DRIVER_ADS7844 is
	port(
	RST:     in std_logic;				        --Master reset
	CLK:     in std_logic;				   	  --Master clock
	STC:     in std_logic;					     --Start conversion
	--SGLDIF:  in std_logic;				        --Single line / differential input configuration flag
	--PD:      in std_logic;				        --Power down mode configuration flag
	ACH:     in std_logic_vector(2 downto 0);   --Number of ADS channel
	DOUT:    out std_logic_vector(11 downto 0); --12 bit Data out vector
	---------------------------------------------------------------------------------------------------
	ADSSCLK: out std_logic;						--ADS7844 Serial clock terminal SCLK
	ADSDIN:  out std_logic;						--ADS7844 Data in terminal DIN
	ADSBUSY: in std_logic;						--ADS7844 Busy terminal	BUSY
	ADSDOUT: in std_logic;						--ADS7844 Data out terminal DOUT
	---------------------------------------------------------------------------------------------------
	EOC:     out std_logic				        --End of conversion
	--RST_ADS: out std_logic;
	--STC_ADS: out std_logic
	
	);
end DRIVER_ADS7844;

architecture modular of DRIVER_ADS7844 is



-- ADS7844 TX BLOCK
component ADS7844TX
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
end component;

-- ADS7844 RX BLOCK
component ADS7844RX
	port(
	RST:     in std_logic;				      --Master reset
	CLK:     in std_logic;					  --Master clock
	STR:     in std_logic;					  --Start reception
	TB:      in std_logic;				      --Time base signal
	ADSBUSY: in std_logic;				      --ADS7844 Busy terminal
	ADSDOUT: in std_logic;				      --ADS7844 Data out terminal
	DOUT:    out std_logic_vector(11 downto 0); -- 12 bit Data out vector
	EOR:     out std_logic				      --End of reception
	);
end component;

-- ADS7844 MASTER FSM
component ADS7844_FSM_MASTER
	port(
	RST,CLK: in std_logic;						--Master Reset and Clock
	STC: in std_logic;							--Start conversion
	EOT: in std_logic;							--End of transmission
	EOR: in std_logic;							--End of reception
	STT: out std_logic;							--Start transmission
	STR: out std_logic;							--Start reception
	EOC: out std_logic                		 	--End of conversion
	);
end component;

component ADS7844_CHDECODER
	port(
	CHNUM: in std_logic_vector(2 downto 0);
	CHCOD: out std_logic_vector(2 downto 0)
	);
end component;	 

--component basetiempo_20ns
--	port(
--	RST		:		in  std_logic;
--	CLK		:		in  std_logic;
--	CLEAR	:		in  std_logic;
--	Y		:		out	std_logic
--	);
--end component;	 


--component ONE_SHOT is
--port(
--	RST: in std_logic;		--Master Reset
--	CLK: in std_logic;		--Master Clock
--	BUTTON: in std_logic;   --Input button
--	SHOT: out std_logic		--One Shot Out
--	);
--end component ONE_SHOT;

signal SSTT:  std_logic;						--Start transmission flag 
signal SSTR:  std_logic;						--Start reception flag
signal SADSSCLK:  std_logic;					--ADS7844 SCLK signal
signal SADSDIN:   std_logic;					--ADS7844 DIN signal
signal SBT:   std_logic;					    --Time base signal 
signal SEOT:  std_logic;						--End of transmission signal
signal SEOR:  std_logic;						--End of reception signal 
signal SDOUT:  std_logic_vector(11 downto 0);	--12 Data out vector signal
signal SEOC:  std_logic;						--End of counter signal
signal SCH:   std_logic_vector(2 downto 0);     --Channel number decoder signal	  
signal SHOT_S : std_logic;						--Señal para el one shot del start
--signal CLK_50Mhz : std_logic;					--clk de 20ns

begin	  


	                                                    --SGLDIF and PD
--BLOCK_CLK		:  basetiempo_20ns port map(RST,CLK,'0',CLK_50Mhz);
BLOCK1_TX		:	ADS7844TX port map (RST,CLK,SSTT,SCH,'1','1',SEOC,SADSSCLK,SADSDIN,SBT,SEOT);
BLOCK2_RX		:	ADS7844RX port map (RST,CLK,SSTR,SBT,ADSBUSY,ADSDOUT,SDOUT,SEOR);
BLOCK3_FSM		:	ADS7844_FSM_MASTER port map (RST,CLK,STC,SEOT,SEOR,SSTT,SSTR,SEOC);
BLOCK4_CHDECODER	:   ADS7844_CHDECODER port map (ACH,SCH); 

-- BLOCK5_ONESHOT	:	ONE_SHOT port map (RST,CLK,STC,SHOT_S);

ADSSCLK	<= SADSSCLK;	--ADS7844 Serial clock terminal
ADSDIN	<= SADSDIN;		--ADS7844 Data in terminal
DOUT <= SDOUT;			--Data Out vector
EOC  <= SEOC;			--End of reception
--RST_ADS <= '1';
--STC_ADS <= '1';

end modular;