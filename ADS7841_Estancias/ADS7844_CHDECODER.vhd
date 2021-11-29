library	IEEE;
use IEEE.std_logic_1164.all;

entity ADS7844_CHDECODER is
	port(
	CHNUM: in std_logic_vector(2 downto 0);
	CHCOD: out std_logic_vector(2 downto 0)
	);
end ADS7844_CHDECODER;

architecture LUT of ADS7844_CHDECODER is

begin
	
	Decoder:process(CHNUM)
	begin
		case CHNUM is
		--ADS7844
--			when "000" =>	CHCOD<="000";
--			when "001" =>	CHCOD<="100";
--			when "010" =>	CHCOD<="001";
--			when "011" =>	CHCOD<="101";
--			when "100" =>	CHCOD<="010";
--			when "101" =>	CHCOD<="110";
--			when "110" =>	CHCOD<="011";
--			when others =>	CHCOD<="111";
		--ADS7841
			when "000" =>	CHCOD<="001";
			when "001" =>	CHCOD<="101";
			when "010" =>	CHCOD<="010";
			when "011" =>	CHCOD<="110";
			when "100" =>	CHCOD<="010";
			when "101" =>	CHCOD<="110";
			when "110" =>	CHCOD<="011";
			when others =>	CHCOD<="110";
			
		end case;
	end process;
end LUT;