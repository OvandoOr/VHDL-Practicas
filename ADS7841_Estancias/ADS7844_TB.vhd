-----------------------------------------------
-- Counter for 31.25 microseconds time base
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ADS7844_TB is
	generic(
	n: integer :=10
	);
	port(
	RST,CLK: in std_logic;				--Master Reset and Clock
	CLR: in std_logic;					--Zero Set
	BT: out std_logic                  	--Time Base Out
	);
end ADS7844_TB;

architecture algoritmica of ADS7844_TB is

signal QP,QN: std_logic_vector(n-1 downto 0);   --Sequential process present and next state signals
signal CBT: std_logic;							--Time base comparator signal
signal OPC: std_logic_vector(1 downto 0);							--Counter operation selector

begin
	
	BT  <= CBT;
	OPC <= CLR & CBT;
	
	comparator1561:process(QP)
	begin
	--	if (QP="0100100000") then	 --For 342.465Khz SCLK 1460ns TB firmware luis (o version 2.0)
	--	if (QP="0001001000") then	 --For 342.465Khz SCLK 1460ns TB firmware luis (o version 2.0)
		if (QP="0000110000") then	 -- 11 For 2Mhz SCLK 250ns TB firmware de roberto
	--	if (QP="0000001010") then	 
			CBT<='1';
		else
			CBT<='0';
		end if;
	end process comparator1561;
		
	combinational: process(QP,OPC)
	begin
		
		if (OPC="00") then
			QN<=QP+1;
		else
			QN<=(others=>'0');
		end if;
	end process combinational;
	
	secuencial: process(RST,CLK)	   
	begin
		if(RST='0') then			   --Active in Low Reset (ALTERA)
			QP<=(others=>'0');
		elsif(CLK'event and CLK='1') then
			QP<=QN;
		end if;
	end process secuencial;
end algoritmica;