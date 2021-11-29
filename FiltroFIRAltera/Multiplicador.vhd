----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:04 11/20/2018 
-- Design Name: 
-- Module Name:    Multiplicador - Behavioral 
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

entity Multiplicador is
    Port ( X : in  STD_LOGIC_VECTOR (17 downto 0);-- Señal del adc
           A : in  STD_LOGIC_VECTOR (35 downto 0);-- coeficiente a
           M : out  STD_LOGIC_VECTOR (53 downto 0));--Resultado de la multiplicaion
end Multiplicador;

architecture Aritmetica of Multiplicador is

begin

Process(X,A)
variable p: signed (53 downto 0); --declaramos una variable de 54 bits
begin
p := signed(x)* signed(A); --Multiplicamos x*a 
M <= std_logic_vector(p);--igualamos M a la variable de resultado

end process;

end Aritmetica;

