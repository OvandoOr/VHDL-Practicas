library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Tx_MUX_Salida is
	 port(
		 P : in STD_LOGIC;
		 M : in STD_LOGIC_VECTOR(3 downto 0);
		 D : in STD_LOGIC_VECTOR(7 downto 0);
		 Tx : out STD_LOGIC
	     );
end Tx_MUX_Salida;
 

architecture Seleccion of Tx_MUX_Salida is
begin
	process(M,D,P)
	begin
		case M is
			when "0000" => Tx <= '0';
			when "0001" => Tx <= D(0);
			when "0010" => Tx <= D(1);
			when "0011" => Tx <= D(2);
			when "0100" => Tx <= D(3);
			when "0101" => Tx <= D(4);
			when "0110" => Tx <= D(5);
			when "0111" => Tx <= D(6);
			when "1000" => Tx <= D(7);
			when "1001" => Tx <= P;
			when others => Tx <= '1';
		end case;
	end process;
end Seleccion;
