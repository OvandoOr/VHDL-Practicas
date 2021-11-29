----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:16:31 11/21/2018 
-- Design Name: 
-- Module Name:    RegistroDeEntrada - Behavioral 
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

entity Registro is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           LDR : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (17 downto 0);
           Q : out  STD_LOGIC_VECTOR (17 downto 0));
end Registro;

architecture Behavioral of Registro is

signal Qn, Qp : std_logic_vector(17 downto 0);

begin

	combinacional: process(Qp,LDR,D)
	begin
		if(LDR='0') then
			Qn <= Qp;
		else
			Qn <= D;
		end if;
		Q <= Qp;
	end process Combinacional;
	
	Secuencial: process(RST,CLK)
	begin
		if(RST='0') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK='1')then
			Qp <= Qn;
		end if;
	end process Secuencial;

end Behavioral;

