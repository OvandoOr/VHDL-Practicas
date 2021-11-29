----------------------------------------------------------------------------------
-- Company: UAQ (Estancias II 2018).
-- Engineer: Carrllo Zatarain Juan Alfredo.
-- 
-- Create Date:    14:57:23 11/13/2018. 
-- Design Name: 
-- Module Name:    Modulo_ADS - Behavioral. 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;



	entity Modulo_ADS is
		 Port ( RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  STP : in  STD_LOGIC;
--				  ACH:     in std_logic_vector(2 downto 0);
--				  SYNC : out  STD_LOGIC;
--				  DLCK : out  STD_LOGIC;
--				  DIN : out  STD_LOGIC;
--				  EOP : out  STD_LOGIC;
--				  DATO : out  STD_LOGIC;
				  ENWRITE : out  STD_LOGIC;
--				  WR : out  STD_LOGIC;
				   
				  -- Para los pines del ADS 
				  --
				  ACH:     in std_logic_vector(2 downto 0);
				  DOUT:    out std_logic_vector(11 downto 0); --12 bit Data out vector
				  --
				  ADSSCLK: out std_logic;						--ADS7844 Serial clock terminal SCLK
				  ADSDIN:  out std_logic;						--ADS7844 Data in terminal DIN
				  ADSBUSY: in std_logic;						--ADS7844 Busy terminal	BUSY
				  ADSDOUT: in std_logic						--ADS7844 Data out terminal DOUT
					);
	end Modulo_ADS;

architecture Behavioral of Modulo_ADS is

	component contador_ascendente_clear 
		generic(
			n: integer :=10
		); 
		 Port ( RST : in  STD_LOGIC; --Master reset 
				  CLK : in  STD_LOGIC; -- Clock
				  OPC : in  STD_LOGIC_VECTOR(1 downto 0); --Operation selector
				  Q : out  STD_LOGIC_VECTOR(n-1 downto 0) -- Salida
				);
	end component;

	component comparador_igual is
	generic (
			n: integer:=24
			);
		 Port ( Q : in  STD_LOGIC_VECTOR(N-1 downto 0);
				  REF : in  STD_LOGIC_VECTOR(N-1 downto 0);
				  IGUAL : out  STD_LOGIC
				  );
	end component;

	component DRIVER_ADS7844 is
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
	end component;

	component base_tiempo is
		generic (
			n: integer:=24
			);
		 Port ( RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  OPC : in  STD_LOGIC_VECTOR(1 downto 0);
				  DATO : in  STD_LOGIC_VECTOR(n-1 downto 0);
				  EOT : out  STD_LOGIC);
	end component;

	component FSM_ModuloAds is
		 Port ( RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  STP : in  STD_LOGIC;
				  EOTADS : in  STD_LOGIC;
				  IGUAL : in  STD_LOGIC;
				  EOTB : in  STD_LOGIC;
				  OPC1 : out  STD_LOGIC_VECTOR (1 downto 0);
				  OPC2 : out  STD_LOGIC_VECTOR (1 downto 0);
				  STPADS : out  STD_LOGIC;
				  EOP : out  STD_LOGIC;
				  ENWRITE : out  STD_LOGIC);
	end component;
	
	Signal Q: STD_LOGIC_VECTOR(10 downto 0); --Variable del contador y del comparador 
	Signal IGUAL,EOP: STD_LOGIC; -- Resultado del comparador
	Signal OPC1 : STD_LOGIC_VECTOR(1 downto 0);
	Signal OPC2 : STD_LOGIC_VECTOR(1 downto 0);
	Signal EOTB : STD_LOGIC;
	Signal STPADS: STD_LOGIC;
	--Signal DOUT: std_logic_vector(11 downto 0);
	Signal EOTADS:  STD_LOGIC;
	
	--
	
begin
		FSM: FSM_ModuloAds port map (RST, CLK, STP, EOTADS, IGUAL, EOTB, OPC1, OPC2, STPADS, EOP, ENWRITE);
		Contador: contador_ascendente_clear generic map(11) port map (RST,CLK, OPC1, Q);
		Comparador: comparador_igual generic map(11) port map(Q, "11111111111", IGUAL);
		Driver_Ads7841: DRIVER_ADS7844 port map(RST, CLK, STPADS, ACH, DOUT, ADSSCLK, ADSDIN, ADSBUSY,ADSDOUT,EOTADS);
		BaseTiempo: base_tiempo generic map(13) port map (RST,CLK, OPC2, "1001110001000",EOTB);
		
end Behavioral;