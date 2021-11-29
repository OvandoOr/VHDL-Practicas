library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tx_Divisor2 is
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 B : out STD_LOGIC
	     );
end Tx_Divisor2;


architecture Interna2 of Tx_Divisor2 is	  

signal Qn, Qp : std_logic_vector(13 downto 0); --Estados Internos

begin
	
	Combinacional: process(Qp)
	begin
		if(Qp = "00000000000000") then
			B  <= '1';	 
--			Qn <= "01010001011000"; 				--9600 Baudios, 50 MHz
			Qn <= "00000110110010";					
		else
			B  <= '0';
			Qn <= Qp - 1;
		end if;
	end process Combinacional;	   
	
	Secuencial: process(RST,CLK)
	begin
		if (RST = '0') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			Qp <= Qn;
		end if;
	end process Secuencial;

end Interna2;
