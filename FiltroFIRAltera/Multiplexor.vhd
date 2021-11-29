----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:10 11/21/2018 
-- Design Name: 
-- Module Name:    Multiplexor - Behavioral 
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

entity Multiplexor is
    Port ( I : in  STD_LOGIC_VECTOR (5 downto 0);
           X : in  STD_LOGIC_VECTOR (17 downto 0);
           X1 : in  STD_LOGIC_VECTOR (17 downto 0);
           X2 : in  STD_LOGIC_VECTOR (17 downto 0);
           X3 : in  STD_LOGIC_VECTOR (17 downto 0);
           X4 : in  STD_LOGIC_VECTOR (17 downto 0);
           M : out  STD_LOGIC_VECTOR (17 downto 0));
end Multiplexor;

architecture Behavioral of Multiplexor is

begin

	process(I,X,X1,X2,X3,X4)
	begin
		case I is
			when "000000" => M <= X;
			when "000001" => M <= X1;
			when "000010" => M <= X2;
			when "000011" => M <= X3;
			When others   => M <= X4;
		end case;
	end process;

end Behavioral;
