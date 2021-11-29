-----------------------------------------------
-- ADS7844 Serial Transmission FSM 
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;

entity ADS7844_FSM_TX is
	port(
	RST,CLK: in std_logic;						--Master Reset and Clock
	STT: in std_logic;							--Start transmission input
	TB: in std_logic;							--Time Base Input
	OPCMUX: out std_logic_vector(2 downto 0);	--Multiplexer selection output
	EOT: out std_logic                		 	--End of transmision flag output
	);
end ADS7844_FSM_TX;

architecture FSM of ADS7844_FSM_TX is

signal QP,QN: std_logic_vector(4 downto 0);   --Sequential process present and next state signals


begin
	
		
	combinational: process(QP,STT,TB)
	begin
		case QP is
			
			--S0 Initial state waiting for STT
			when "00000" =>
			
			if(STT='0') then
				QN<=QP;
			else
				QN<="00001";
			end if;
		  	OPCMUX<="000";
			EOT<='1';
			
			--S1 Starting Serial clock and time base, Sending Start Bit Clock 0
			when "00001" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00010";
			end if;
		  	OPCMUX<="001";
			EOT<='0';
			
			--S2 Sending Start Bit Clock 1
			when "00010" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00011";
			end if;
		  	OPCMUX<="001";
			EOT<='0';
			
			--S3 Sending A2 Bit Clock 0
			when "00011" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00100";
			end if;
		  	OPCMUX<="010";
			EOT<='0';
			
			--S4 Sending A2 Bit Clock 1
			when "00100" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00101";
			end if;
		  	OPCMUX<="010";
			EOT<='0';
			
			--S5 Sending A1 Bit Clock 0
			when "00101" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00110";
			end if;
		  	OPCMUX<="011";
			EOT<='0';
			
			--S6 Sending A1 Bit Clock 1
			when "00110" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00111";
			end if;
		  	OPCMUX<="011";
			EOT<='0';
			
			--S7 Sending A0 Bit Clock 0
			when "00111" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01000";
			end if;
		  	OPCMUX<="100";
			EOT<='0';
			
			--S8 Sending A0 Bit Clock 1
			when "01000" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01001";
			end if;
		  	OPCMUX<="100";
			EOT<='0';
			
			--S9 Sending Non useful bit, clock 0
			when "01001" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01010";
			end if;
		  	OPCMUX<="000";
			EOT<='0';
			
			--S10 Sending Non useful bit, clock 1
			when "01010" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01011";
			end if;
		  	OPCMUX<="000";
			EOT<='0';
			
			--S11 Sending SGLDIF bit, clock 0
			when "01011" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01100";
			end if;
		  	OPCMUX<="101";
			EOT<='0';
			
			--S12 Sending SGLDIF bit, clock 1
			when "01100" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01101";
			end if;
		  	OPCMUX<="101";
			EOT<='0';
			
			--S13 Sending PD1 bit, clock 0
			when "01101" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01110";
			end if;
		  	OPCMUX<="110";
			EOT<='0';
			
			--S14 Sending PD1 bit, clock 1
			when "01110" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="01111";
			end if;
		  	OPCMUX<="110";
			EOT<='0';
			
			--S15 Sending PD0 bit, clock 0
			when "01111" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="10000";
			end if;
		  	OPCMUX<="111";
			EOT<='0';
			
			--S16 Sending PD0 bit, clock 1
			when "10000" =>
			
			if(TB='0') then
				QN<=QP;
			else
				QN<="00000";
			end if;
		  	OPCMUX<="111";
			EOT<='0';
			
			--Invalid states
			when others =>
			
			QN<="00000";
		  	OPCMUX<="000";
			EOT<='1';
			
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