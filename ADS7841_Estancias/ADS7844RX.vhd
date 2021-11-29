-------------------------------------------------------------
-- ADS7844 Analog to digital converter receiver interface
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-------------------------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
										
entity ADS7844RX is
	port(
	RST:     in std_logic;				      --Master reset
	CLK:     in std_logic;					  --Master clock
	STR:     in std_logic;					  --Start reception
	TB:      in std_logic;				      --Time base signal
	ADSBUSY: in std_logic;				      --ADS7844 Busy terminal
	ADSDOUT: in std_logic;				      --ADS7844 Data out terminal
	DOUT:    out std_logic_vector(11 downto 0); -- 12 bit Data out vector
	--QRX: out std_logic_vector(2 downto 0);  --Salida de estado de rx
	EOR:     out std_logic				      --End of reception
	);
end ADS7844RX;

architecture modular of ADS7844RX is

-- Counter mod 12
component contador_mod12
	generic(
	n: integer :=4
	);
	port(
	RST,CLK: in std_logic;					  -- Master reset and clock
	OPC: in std_logic_vector(1 downto 0);	  -- Operation selector
	EOC: out std_logic						  -- End of count
	);
end component;

-- 12 bit Serial to parallel register
component reg_s_p_12b
	generic(
	n: integer :=12
	);
	
	port(
	RST: in std_logic;	--Reset maestro
	CLK: in std_logic;	--Reloj maestro
	S:   in std_logic;	--Entrada serial de datos
	H:   in std_logic;	--Entrada de habilitacion
	Q:	 out std_logic_vector(n-1 downto 0) --Salida paralela de datos
	);
	
end component;

-- Reception Finite states machine
component ADS7844_FSM_RX
	port(
	RST,CLK: in std_logic;						--Master Reset and Clock
	STR: in std_logic;							--Start reception input
	TB: in std_logic;							--Time Base Input
	ADSBUSY: in std_logic;						--ADS7844 Busy Terminal
	EOC: in std_logic; 							--End of mod 12 counter
	HRSP: out std_logic;						--Enable 12 bit serial to parallel register
	OPCC: out std_logic_vector(1 downto 0);		--Mod 12 counter operation selector
	EOR: out std_logic                		 	--End of reception flag output
	
	);
end component;

signal SOPCC: std_logic_vector(1 downto 0);		--Counter operation signal
signal SEOC:  std_logic;						--End of counter signal
signal SHRSP: std_logic;						--Serial to parallel register enable signal
signal SDOUT: std_logic_vector(11 downto 0);	--12 bit parallel data out signal
signal SEOR:  std_logic;						--End of reception signal
--signal SQRX: std_logic_vector(2 downto 0);  --Estado de fsm

begin	  
	
BIT_COUNTER   : contador_mod12 port map (RST,CLK,SOPCC,SEOC);
SP_REGISTER   : reg_s_p_12b    port map (RST,CLK,ADSDOUT,SHRSP,SDOUT);
RECEPTION_FSM : ADS7844_FSM_RX port map (RST,CLK,STR,TB,ADSBUSY,SEOC,SHRSP,SOPCC,SEOR);

DOUT <= SDOUT;		--Data Out vector
EOR  <= SEOR;		--End of reception
--QRX <= SQRX;
end modular;