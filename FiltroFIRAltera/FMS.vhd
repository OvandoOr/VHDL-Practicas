----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:47 11/21/2018 
-- Design Name: 
-- Module Name:    FMS - Maquina 
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



entity FMS is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STF : in  STD_LOGIC;
           Z   : in  STD_LOGIC;
           LDA : out  STD_LOGIC;
           LDR : out  STD_LOGIC;
           EOF : out  STD_LOGIC;
           OPC : out  STD_LOGIC_VECTOR (1 downto 0));
end FMS;

architecture Maquina of FMS is

signal Qn, Qp : std_logic_vector(1 downto 0); --estados internos
begin
 
process(Qp,STF,Z)
begin
case Qp is
 when "00" =>
 
 LDA <= '0'; --desactiva el acomulador
 LDR <= '0'; -- registro final desactivado
 EOF <= '1'; --fin de proceso acomulado
 OPC <= "11";--incrementa
 
 if (STF ='1')then -- si inicia el proceso 
 qn <= "01";--pasa al estado 2
 
 else
 Qn <= Qp;
 
 end if;
 
 when "01" =>
 
 LDA <= '1';--Activa el acomulador
 LDR <= '0';-- registro final desactivado
 EOF <= '0';-- fin de proceso desactivado
 OPC <= "10";-- decrementa
 
 if (z = '1')then
 qn <= "10";
 
 else
 Qn <= Qp;
 
 end if;
 when others =>
 
 LDA <= '0';--desactiva el acomulador
 LDR <= '1';-- activa el registro final
 EOF <= '0';--fin de proceso desactivado
 OPC <= "00";
 Qn <= "00";
 end case;
 end process;
 
 
secuencial: process(RST,CLK)
begin


if (RST = '0') then
    Qp <= (others => '0');
elsif(CLK'event and CLK = '1') then
    QP <= Qn;
	
end if;

end process secuencial;
 
 end Maquina;

