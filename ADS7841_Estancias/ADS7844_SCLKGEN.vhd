-----------------------------------------------
-- Time base to clock generator
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ADS7844_SCLKGEN is
	port(
	RST,CLK: in std_logic;					--Master Reset and Clock
	BT: in std_logic;	                  	--Time Base Out
	CLR: in std_logic;						--Zero Set
	SCLK: out std_logic						--Serial Clock Out
	);
end ADS7844_SCLKGEN;

architecture algoritmica of ADS7844_SCLKGEN is
signal QP,QN: std_logic; 							--Sequential process present and next state signals
signal OPC: std_logic_vector(1 downto 0);							--Counter operation selector


begin	 
	
	OPC <= CLR & BT;  
	
	combinational: process(QP,OPC)
	begin
		
		case OPC is
			when "00" =>
			QN<=QP;
			when "01" =>
			QN<=not(QP);
			when others =>
			QN<='0';
		end case;
		SCLK<=QP;
	end process combinational;
	
	secuencial: process(RST,CLK)	   
	begin
		if(RST='0') then			   --Active in Low Reset (ALTERA)
			QP<='0';
		elsif(CLK'event and CLK='1') then
			QP<=QN;
		end if;
	end process secuencial;
end algoritmica;
