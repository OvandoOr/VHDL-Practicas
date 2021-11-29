library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Tx_Divisor is
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 B : out STD_LOGIC
	     );
end Tx_Divisor;


architecture Interna of Tx_Divisor is	  

signal Qn, Qp : std_logic_vector(13 downto 0); --Estados Internos

begin
	
	Combinacional: process(Qp)
	begin
		if(Qp = "00000000000000") then
			B  <= '1';	 
			Qn <= "10100010110000"; 				--9600 Baudios, 50 MHz
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

end Interna;
