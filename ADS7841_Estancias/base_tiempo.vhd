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
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.NUMERIC_STD.ALL;

	entity base_tiempo is
		generic (
			n: integer:=10
			);
		 Port ( RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  OPC : in  STD_LOGIC_VECTOR(1 downto 0);
				  DATO : in  STD_LOGIC_VECTOR(n-1 downto 0);
				  EOT : out  STD_LOGIC);
	end base_tiempo;

	architecture simple of base_tiempo is
		signal QN, QP: STD_LOGIC_VECTOR (n-1 downto 0);
		begin
			
			Combinacional : process (QP, OPC, DATO)
				begin
					if(OPC="10" OR OPC="11") then 
						QN<=(others=>'0');
					elsif (OPC="00") then
						QN<=QP;
					else 	
						QN<=QP+1;
					end if;
					
				end process Combinacional;
			
			Salida : process (QP,DATO)
				begin
					if(QP>DATO) then 
						EOT <='1';
					else
						EOT <='0'; 
					end if;
					
				end process Salida;
				
			Secuencial: process(RST, CLK)
				begin
					if(RST='0') then
						QP<=(others=>'0');
					elsif(CLK' event and CLK='1') then
						QP<=QN;
					end if;
				end process Secuencial;
				
		end simple;

-- 00		Mantiene
-- 01		Incrementa
-- 10		Limpia
-- 11		Limpia