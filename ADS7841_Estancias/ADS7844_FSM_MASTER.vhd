-----------------------------------------------
-- ADS7844 Master Control FSM 
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;

entity ADS7844_FSM_MASTER is
	port(
	RST,CLK: in std_logic;						--Master Reset and Clock
	STC: in std_logic;							--Start conversion
	EOT: in std_logic;							--End of transmission
	EOR: in std_logic;							--End of reception
	STT: out std_logic;							--Start transmission
	STR: out std_logic;							--Start reception
	EOC: out std_logic                		 	--End of conversion
	);
end ADS7844_FSM_MASTER;

architecture FSM of ADS7844_FSM_MASTER is

signal QP,QN: std_logic_vector(2 downto 0);   --Sequential process present and next state signals


begin
			
	combinational: process(QP,STC,EOT,EOR)
	begin
		case QP is
			
			--S0 Initial state waiting for STC
			when "000" =>
			
			if(STC='0') then
				QN<=QP;
			else
				QN<="001";
			end if;
		  	
			STT<='0';
			STR<='0';
			EOC<='1';
			
			--S1 TX flag activation
			when "001" =>
			
			QN<="010";
					  	
			STT<='1';
			STR<='0';
			EOC<='0';
			
			--S2 Wait for end of TX
			when "010" =>
			
			if(EOT='0') then
				QN<=QP;
			else
				QN<="011";
			end if;
		  	
			STT<='0';
			STR<='0';
			EOC<='0';
			
			--S3 RX flag activation
			when "011" =>
			
			QN<="100";
					  	
			STT<='0';
			STR<='1';
			EOC<='0';
			
			--S4 Wait for end of RX
			when "100" =>
			
			if(EOR='0') then
				QN<=QP;
			else
				QN<="000";
			end if;
		  	
			STT<='0';
			STR<='0';
			EOC<='0';
			
			-- Invalid states
			when others =>
			
			QN <= "000";
			STT<='0';
			STR<='0';
			EOC<='1';
			
			  			
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