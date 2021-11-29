----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:30 11/21/2018 
-- Design Name: 
-- Module Name:    Resultado - Simple 
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

entity Resultado is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LDR : in  STD_LOGIC;
           U : in  STD_LOGIC_VECTOR (59 downto 0);
           R : out  STD_LOGIC_VECTOR (59 downto 0));
end Resultado;

architecture Simple of Resultado is

signal Qn, Qp: STD_LOGIC_vector (59 downto 0);

begin

combinacional : process (Qp, LDR , U )
begin

if(LDR='0') then
	Qn <= Qp;
else
	Qn <= U;
	end if;
	
	r <= Qp;
end process combinacional;





secuencial: process(RST,CLK)
begin


if (RST = '0') then
    Qp <= (others => '0');
elsif(CLK'event and CLK = '1') then
    QP <= Qn;
	
end if;

end process secuencial;


end Simple;