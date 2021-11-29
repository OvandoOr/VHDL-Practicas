----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:48 11/13/2018 
-- Design Name: 
-- Module Name:    comparador_igual - Behavioral 
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

	entity comparador_igual is
	generic (
			n: integer:=24
			);
		 Port ( Q : in  STD_LOGIC_VECTOR(N-1 downto 0);
				  REF : in  STD_LOGIC_VECTOR(N-1 downto 0);
				  IGUAL : out  STD_LOGIC
				  );
	end comparador_igual;

architecture simple of comparador_igual is

begin
	Comaprador: process(Q,Ref)
		begin
			if (Q=REF) then
				IGUAL<='1';
			else 
				IGUAL<='0';
			end if;
		end process Comaprador;
end simple;

