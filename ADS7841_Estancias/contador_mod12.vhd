-----------------------------------------------
-- Zero to 12, 4 bit Multifunction Counter 
-- M. I. Jesus Roberto Millan Almaraz
-- Ph D. Thesis
-----------------------------------------------	 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador_mod12 is
	generic(
	n: integer :=4
	);
	port(
	RST,CLK: in std_logic;					  -- Master reset and clock
	OPC: in std_logic_vector(1 downto 0);	  -- Operation selector
	EOC: out std_logic						  -- End of count
	);
end contador_mod12;

architecture algoritmica of contador_mod12 is
signal QP,QN: std_logic_vector(n-1 downto 0);	--states signals


begin
	
	comparator12:process(QP)
	begin
		if (QP=12) then
			EOC<='1';
		else
			EOC<='0';
		end if;
	end process comparator12;
	
	combinacional: process(QP,OPC)
	begin
		case OPC is
			when "00" =>
			QN<=QP;
			when "01" =>
			QN<=QP+1;
			when "10" =>
			QN<=(others=>'0');
			when others =>
			QN<=(others=>'0');
		end case;
		
	end process combinacional;
	
	secuencial: process(RST,CLK)
	begin
		if(RST='0') then		 --0 for ALTERA
			QP<=(others=>'0');
		elsif(CLK'event and CLK='1') then
			QP<=QN;
		end if;
	end process secuencial;
end algoritmica;