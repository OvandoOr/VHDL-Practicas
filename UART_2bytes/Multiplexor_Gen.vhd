Library IEEE;
use IEEE.std_logic_1164.all;

entity Mux_n is
	generic(
		n : integer := 6	
		);
	
	port(
		A	 	: in std_logic_vector (n-1 downto 0);
		B		: in std_logic_vector (n-1 downto 0);
		S		: in std_logic;
		Z		: out std_logic_vector (n-1 downto 0)
		);
	end Mux_n;
	
	architecture behavioral of Mux_n is
	begin 
	process (S, A, B)
	begin 
	if (S ='0') then
		Z <= A;
	else
		Z <= B;
	end if;
end process;
end behavioral;