----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:02 11/22/2018 
-- Design Name: 
-- Module Name:    FSM_Filtro - Maquina 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_Filtro is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STF : in  STD_LOGIC;
           EOF : in  STD_LOGIC;
           LDR : out  STD_LOGIC;
           RDY : out  STD_LOGIC);
end FSM_Filtro;

architecture Maquina of FSM_Filtro is

signal Qp, Qn	: std_logic_vector (1 downto 0); --Estados internos

begin


	Combinacional:	process(Qp,STF,EOF)
	begin
		case Qp is
			When "00" =>
				LDR <=	'0';
				RDY <=	'1';
				if(STF='1') then
					Qn <= "01";
				else
					Qn <= Qp;
				end if;
			when "01" =>
				
				LDR <=	'0';
				RDY <=	'0';
				if	(EOF='1') then	
					Qn <=	"10";
				else
					Qn	<=	Qp;
				end if;
			When others =>
				LDR <= '1';
				RDY <= '0';
				Qn	 <= "00";
			end case;
		end process Combinacional;
		
		Secuencial: process(RST,CLK)
		begin
			if(RST='0')	then
				Qp	<=	(others => '0');
			elsif	(CLK'event and CLK='1') then
				Qp	<= Qn;
			end if;
		end process Secuencial;
					
end Maquina;

