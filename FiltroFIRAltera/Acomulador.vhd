----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:40:49 11/20/2018 
-- Design Name: 
-- Module Name:    Acomulador - Simple 
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

entity Acomulador is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LDA : in  STD_LOGIC;
           U : in  STD_LOGIC_VECTOR (59 downto 0);
           Q : out  STD_LOGIC_VECTOR (59 downto 0));
end Acomulador;

architecture Simple of Acomulador is

signal qn,qp : std_logic_vector(59 downto 0);

begin

combinacional: process(QP,LDA,U)
begin

if (LDA='0') then
   qn <= (others => '0');
	else
	qn <= u;
end if;
Q<= Qp;

end process combinacional;

secuencial: process(RST,CLK)
begin


if (RST = '0') then
    Qp <= (others => '0');
elsif(CLK'event and CLK = '1') then
    QP <= Qn;
	
end if;

end process secuencial;


end simple;	
	 

