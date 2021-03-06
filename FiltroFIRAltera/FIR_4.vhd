----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:32 11/21/2018 
-- Design Name: 
-- Module Name:    FIR_4 - FILTRO 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR_4 is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STF : in  STD_LOGIC;
           X : in  STD_LOGIC_VECTOR (17 downto 0);
           RDY : out  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (17 downto 0));
end FIR_4;

architecture FILTRO of FIR_4 is

component MAC
	port(
		RST : in std_logic;
		CLK : in std_logic;
		STF : in std_logic;
		X   : in std_logic_vector(17 downto 0);
		A   : in std_logic_vector(35 downto 0);
		N   : in std_logic_vector(5  downto 0);
		S   : in std_logic_vector(5  downto 0);
		EOF : out std_logic;
		I   : out std_logic_vector(5  downto 0);
		Y   : out std_logic_vector(17 downto 0)
		);
	end component;
	
Component Registro
	port(
		RST : in  std_logic;
		CLK : in  std_logic;
		LDR : in  std_logic;
		D   : in  std_logic_vector(17 downto 0);
		Q   : out std_logic_vector(17 downto 0)
		);
	end component;
	
component Multiplexor
	port(
		I  : in  std_logic_vector(5  downto 0);
		X  : in  std_logic_vector(17 downto 0);
		X1 : in  std_logic_vector(17 downto 0);
		X2 : in  std_logic_vector(17 downto 0);
		X3 : in  std_logic_vector(17 downto 0);
		X4 : in  std_logic_vector(17 downto 0);
		M  : out std_logic_vector(17 downto 0)
		);
		end component;
		
component ROM
	port(
		I : in	std_logic_vector(5 downto 0);
		A : out  std_logic_vector(35 downto 0)
		);
		end component;
		
component FSM_Filtro
	port(
		RST : in  std_logic;
		CLK : in  std_logic;
		STF : in  std_logic;
		EOF : in  std_logic;
		LDR : out std_logic;
		RDY : out std_logic
		);
		end component;
		
signal EOF,LDR			: std_logic;
signal M,X1,X2,X3,X4 : std_logic_vector(17 downto 0);
signal N,S,I			: std_logic_vector (5 downto 0);
signal A					: std_logic_vector(35 downto 0);

begin

	N <= "000100";
	S <= "100010";

	Bloque_1	:	MAC	  		port map(RST,CLK,STF,M,A,N,S,EOF,I,Y);
	Bloque_2	:	Registro		port map(RST,CLK,LDR,X,X1);	
	Bloque_3	:	Registro 	port map(RST,CLK,LDR,X1,X2);
	Bloque_4 	:	Registro	 	port map(RST,CLK,LDR,X2,X3);
	Bloque_5	:	Registro 	port map(RST,CLK,LDR,X3,X4);
	Bloque_6	:	Multiplexor port map(I,X,X1,X2,X3,X4,M);
	Bloque_7	:	ROM			port map(I,A);
	Bloque_8	:	FSM_Filtro 	port map(RST,CLK,STF,EOF,LDR,RDY);
	
end FILTRO;

