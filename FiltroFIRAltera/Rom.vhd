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

entity ROM is
    Port ( I : in  STD_LOGIC_VECTOR (5 downto 0);
           A : out  STD_LOGIC_VECTOR (35 downto 0));
end ROM;

architecture Seleccion of ROM is
begin
	process(I)
	begin
		case I is -- formato 2.34
			when "000000" => A <= "000010110000101111100000110111101101";----0.1726
			when "000001" => A <= "000011011010100001011000011110010011";----0.2134
			when "000010" => A <= "000011101001100100110000101111100000";----0.2281
			when "000011" => A <= "000011011010100001011000011110010011";----0.2134
			when "000100" => A <= "000010110000101111100000110111101101";----0.1726
			when others => A <= (others => '0');
				end case;
			end process;


end Seleccion;

--000010110000101111100000110111101101 --0.1726

--000011011010100001011000011110010011 --0.2134

--000011101001100100110000101111100000 --0.2281

--000011011010100001011000011110010011 --0.2134

--000010110000101111100000110111101101 --0.1726

