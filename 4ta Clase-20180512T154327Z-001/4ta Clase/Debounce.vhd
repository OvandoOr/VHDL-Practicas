library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Debounce is

port(
	B_SET:			IN std_logic;
	B_RESET:	IN std_logic;
	B_OUT:		buffer std_logic;
	B_NOUT:		buffer std_logic
	);

end Debounce;

architecture Behavioral of Debounce is

begin


	B_NOUT <= B_OUT NAND B_RESET;
	B_OUT <= B_NOUT NAND B_SET;
	
	end behavioral;