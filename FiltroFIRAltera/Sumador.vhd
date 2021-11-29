----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:35 11/20/2018 
-- Design Name: 
-- Module Name:    Sumador - Behavioral 
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



entity Sumador is
    Port ( Q : in  STD_LOGIC_VECTOR (59 downto 0);
           P : in  STD_LOGIC_VECTOR (59 downto 0);
           U : out  STD_LOGIC_VECTOR (59 downto 0));
end Sumador;

architecture ARITMETICA of Sumador is

begin

PROCESS(Q,P)
variable w : unsigned(60 downto 0);
begin
w := unsigned('0'&Q) + unsigned('0'&p);
U<= std_logic_vector (w(59 downto 0));

end process;


end ARITMETICA;

