
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_sintetizer is
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
end FSM_sintetizer;

architecture FSM_sint of FSM_sintetizer is

signal QP,QN: std_logic_vector(2 downto 0);

begin

combinational: process(QP, STE, EOEDAC, IGUAL, EOTC)
	begin
		case QP is
			
			when "000" =>
			
			if(STE='1') then
				QN<="001";
			else
				QN<=QP;
			end if;
		  	OPC1<="00";
			OPC2<="00";
			STEDAC<='0';
			EOC<='1';
			
			when "001" =>
			
			if(EOEDAC='0') then
				QN<="010";
			else
				QN<=QP;
			end if;	 
			OPC1<="00";
			OPC2<="01";
			STEDAC<='1';
			EOC<='0';
			
			when "010" =>
			
			if(EOEDAC='1' and EOTC='1') then
				QN<="011";
			else
				QN<=QP;
			end if;
			OPC1<="00";
			OPC2<="01";
			STEDAC<='0';
			EOC<='0';

			when "011" =>
			
			if(IGUAL='1') then
				QN<="100";
			else
				QN<="001";
			end if;
		  	OPC1<="01";
			OPC2<="11";
			STEDAC<='0';
			EOC<='0';
			
			when "100" =>
			
			QN<="000";

		  	OPC1<="11";
			OPC2<="11";
			STEDAC<='0';
			EOC<='0';	

			
			--Invalid states
			when others =>
			QN<="000";
		  	OPC1<="11";
			OPC2<="11";
			STEDAC<='0';
			EOC<='0';
			
		end case;
	end process combinational;
	
	secuencial: process(RST,CLK)	   
	begin
		if(RST='0') then			  
			QP<=(others=>'0');
		elsif(CLK'event and CLK='1') then
			QP<=QN;
		end if;
	end process secuencial;

end FSM_sint;

