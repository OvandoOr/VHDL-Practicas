-----------------------------------------------
-- ADS7844 Serial Receiver FSM 
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ADS7844_FSM_RX is
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
end ADS7844_FSM_RX;



architecture FSM of ADS7844_FSM_RX is

signal QP,QN: std_logic_vector(2 downto 0);   --Sequential process present and next state signals

begin
	
		
	combinational: process(QP,STR,ADSBUSY,TB,EOC)
	begin
		case QP is
			
			--S0 Initial state waiting for STR and End of reception
			when "000" =>
			
			if(STR='0') then
				QN<=QP;
			else
				QN<="001";
			end if;
		  	
			HRSP <=	'0';
			OPCC <= "11";
			EOR  <= '1';
			
			--S1 Waiting 1 from ADS7844 Busy terminal
			when "001" =>
			
			if(ADSBUSY='0') then
				QN<=QP;
			else
				QN<="010";
			end if;
		  	
			HRSP <=	'0';
			OPCC <= "00";
			EOR  <= '0';
			
			--S2 Waiting 0 from ADS7844 Busy terminal
			when "010" =>
			
			if(ADSBUSY='1') then
				QN<=QP;
			else
				QN<="011";
			end if;
		  	
			HRSP <=	'0';
			OPCC <= "00";
			EOR  <= '0';
			
			--S3 Waiting Time Base Delay 2
			when "011" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="100";
			end if;
		  	
			HRSP <=	'0';
			OPCC <= "00";
			EOR  <= '0';
			
			--S4 Sampling State / Increase bit counter
			when "100" =>
			
				QN <= "101";
				
			HRSP <=	'1';
			OPCC <= "01";
			EOR  <= '0';
			
			--S5 Waiting Time Base Delay 1 and checking end of reception
			when "101" =>
			
			if(EOC='0' and TB='1') then		   --Go to delay 2
				QN <= "011";
				
			elsif(EOC='1' and TB='1') then	   --End of reception
				QN <= "000";
				
			else							   --Waiting time base
				QN <= QP;
			end if;
		  	
			HRSP <=	'0';
			OPCC <= "00";
			EOR  <= '0';
			
			--Invalid states
			when others	=>
			
			QN <= "000";
			HRSP <=	'0';
			OPCC <= "11";
			EOR  <= '1';
			
		end case;
	end process combinational;
	
	secuencial: process(RST,CLK)	   
	begin
		if(RST='0') then			   --Active in Low Reset (ALTERA)
			QP<=(others=>'0');
		elsif(CLK'event and CLK='1') then
			QP<=QN;
		end if;
	end process secuencial;
end FSM;