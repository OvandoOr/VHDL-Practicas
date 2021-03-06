----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:07 11/13/2018 
-- Design Name: 
-- Module Name:    Sintetizador - DAC_sint 
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


entity Sintetizador is
	generic(
	n: 	integer:= 12;		-- No. de bits informacion
	m:	integer:= 10; 		-- No. de bits para datos
	x: integer:=10;
	y: integer:=16
		); 
	
   Port ( 
		  RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STP : in  STD_LOGIC;
           SYNC : out  STD_LOGIC;
           DCLK : out  STD_LOGIC;
           DIN : out  STD_LOGIC;
           EOP : out  STD_LOGIC
			  
			  );
end Sintetizador;

architecture DAC_sint of Sintetizador is

component FSM_sintetizer is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STE : in  STD_LOGIC;
           EOEDAC : in  STD_LOGIC;
           IGUAL : in  STD_LOGIC;
           EOTC : in  STD_LOGIC;
           STEDAC : out  STD_LOGIC;
           EOC : out  STD_LOGIC;
           OPC1 : out  STD_LOGIC_VECTOR (1 downto 0);
           OPC2 : out  STD_LOGIC_VECTOR (1 downto 0)
			 );
end component;


component DAC7565_DRIVER is
	port( 
	
	RST			:		IN  STD_LOGIC;
	CLK			:		IN  STD_LOGIC;
	MSB			:		IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	LSB			:		IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	STC			:		IN  STD_LOGIC;
	SYNC			:		OUT STD_LOGIC;
	DIN			:		OUT STD_LOGIC;
	SCLK			:		OUT STD_LOGIC;
	EOC			:		OUT STD_LOGIC
	
	);
end component;


component Contador_chirp is
	generic(
	n: 	integer:= 10		-- No. de bits informacion
	); 
	port(  
	
	RST		:			in std_logic;
	CLK		:			in std_logic;
	OPC		:		in  std_logic_vector(1 downto 0);
	SETPOINT	:			in std_logic_vector (n-1 downto 0);
	steps		:				in std_logic_vector (n-1 downto 0);
	End_count:			in std_logic_vector (n-1 downto 0);
	count		:				out std_logic_vector (n-1 downto 0);
	Y			:				out	std_logic
	
	);
end component;

component basetiempo is
	
	generic(
	n: 	integer:= 10		-- No. de bits informacion
	); 
	
	port(  
	
	RST		:		in  std_logic;
	CLK		:		in  std_logic;
	OPC		:		in  std_logic_vector(1 downto 0);
	DATA_I	:		in	std_logic_vector (n-1 downto 0);	
	DATA_F	:		in	std_logic_vector (n-1 downto 0);	
	Y			:		out	std_logic
	
	
	);
end component;


--component Rom_Histograma_triangle is
--	generic(
--	n: 	integer:= 12;		-- No. de bits informacion
--	m:	integer:= 9 		-- No. de bits para datos
--	); 
--	port 
--	(
--		CLK		: in std_logic;
--		addr	: in std_logic_vector (m-1 downto 0);
--		q		: out std_logic_vector((n -1) downto 0)
--	);
--end component;

component Rom_Histograma_sine_12bits is
	generic(
	n: 	integer:= 12;		-- No. de bits informacion
	m:	integer:= 10 		-- No. de bits para datos
	); 
	port 
	(
		CLK		: in std_logic;
		addr	: in std_logic_vector (m-1 downto 0);
		q		: out std_logic_vector((n -1) downto 0)
	);
end component;

--component Rom_Histograma_square is
--	generic(
--	n: 	integer:= 12;		-- No. de bits informacion
--	m:	integer:= 9 		-- No. de bits para datos
--	); 
--	port 
--	(
--		CLK		: in std_logic;
--		addr	: in std_logic_vector (m-1 downto 0);
--		q		: out std_logic_vector((n -1) downto 0)
--	);
--end component;

--component Rom_Histograma_sawtooth is
--	generic(
--	n: 	integer:= 12;		-- No. de bits informacion
--	m:	integer:= 9 		-- No. de bits para datos
--	); 
--	port 
--	(
--		CLK		: in std_logic;
--		addr	: in std_logic_vector (m-1 downto 0);
--		q		: out std_logic_vector((n -1) downto 0)
--	);
--end component Rom_Histograma_sawtooth;

signal 	adrr		:std_logic_vector (m-1 downto 0);
signal 	sig	:std_logic_vector(n-1 downto 0);
signal 	EOTB, EOCONT, STEDAC, EOTDAC		:std_logic;
signal 	opcBT,opcCONT		:std_logic_vector (1 downto 0);
signal 	cuenta:	   std_logic_vector(m-1 downto 0);
signal 	MSB_DAC:		std_logic_vector (11 downto 4);
signal 	LSB_DAC:		std_logic_vector (3 downto 0);
--signal 	MSB_DAC:		std_logic_vector (7 downto 0);
--signal 	LSB_DAC:		std_logic_vector (3 downto 0);

begin

	FSM_sint	:		FSM_sintetizer					port map(RST,CLK,STP,EOTDAC,EOCONT,EOTB,STEDAC,EOP,opcCONT,opcBT);
	bloque1		:		DAC7565_DRIVER					port map(RST,CLK,MSB_DAC,LSB_DAC,STEDAC,SYNC,DIN,DCLK,EOTDAC);
	bloque2		:		Contador_chirp					generic map(x) port map(RST,CLK,opcCONT,"0000000000","0000000001","1111111111",cuenta,EOCONT);
	bloque3		:		basetiempo						generic map(y) port map(RST,CLK,opcBT,"1100001101010000","0000000000000001",EOTB);	
--	rom_triangle:		Rom_Histograma_triangle 	generic map(n,m) 		port map (clk,adrr,sig);
	rom_sine	:		Rom_Histograma_sine_12bits generic map(n,m) 		port map (clk,cuenta,sig);
--	rom_square	:		Rom_Histograma_square 		generic map(n,m) 		port map (clk,adrr,sig);
--	rom_saw		:		Rom_Histograma_sawtooth 	generic map(n,m) 		port map (clk,adrr,sig);


	MSB_DAC <= sig (11 downto 4);
	LSB_DAC <= sig (3 downto 0);

end DAC_sint;

