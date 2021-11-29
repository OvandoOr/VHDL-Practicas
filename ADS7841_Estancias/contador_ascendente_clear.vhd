----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:25 11/13/2018 
-- Design Name: 
-- Module Name:    contador_ascendente_clear - Behavioral 
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
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

	entity contador_ascendente_clear is
		generic(
			n: integer :=10
		); 
		 Port ( RST : in  STD_LOGIC; --Master reset 
				  CLK : in  STD_LOGIC; -- Clock
				  OPC : in  STD_LOGIC_VECTOR(1 downto 0); --Operation selector
				  Q : out  STD_LOGIC_VECTOR(n-1 downto 0) -- Salida
				);
	end contador_ascendente_clear;

architecture simple of contador_ascendente_clear is
	signal QP, QN: std_logic_vector(n-1 downto 0); 
	begin
	--
			Combinacional: process(QP,OPC)
			begin
				case OPC is 
					when "00" => QN<=QP;
					when "01" => QN<=QP+1; --aumento
					when others => QN<=(others=>'0'); --clear
				end case;
			end process Combinacional;
			
			--
			Secuencial: process(RST, CLK)
				begin
					
					if(RST='0') then
						QP<=(others=>'0');
					
					elsif(CLK' event and CLK='1') then
						QP<=QN;
					
					end if;
				end process Secuencial;
				
			Q <= QP;
			--

	end simple;

