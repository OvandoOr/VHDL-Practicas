----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:25 11/21/2018 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity contador is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OPC : in  STD_LOGIC_VECTOR (1 downto 0);
           N : in  STD_LOGIC_VECTOR (5 downto 0);
           Z : out  STD_LOGIC;
           I : out  STD_LOGIC_VECTOR (5 downto 0));
end contador;

architecture Seleccion of contador is

Signal Qn, Qp : std_logic_vector(5 downto 0);
begin
Combinacional: process(OPC,Qp,N)
begin


case OPC is 

   when "10" => Qn <= Qp - 1; --decrementar
	when "11" => Qn <= N; --incrementar
	when others => Qn <= Qp ; --Mantener
	
	end case;
	
	if (Qp ="000001") then
	   Z <='1';
		else
		
		z <= '0';
		end if;
		
		I <= Qp;
	
end process combinacional;

secuencial: process(RST,CLK)
begin


if (RST = '0') then
    Qp <= (others => '0');
elsif(CLK'event and CLK = '1') then
    QP <= Qn;
	
end if;

end process secuencial;

end Seleccion;

