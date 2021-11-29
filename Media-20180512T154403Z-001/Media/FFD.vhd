library IEEE;
use IEEE.std_logic_1164.all;

entity Candado is 
	port(
	D	:	in std_logic;
	LD	:	in std_logic;
	RST	:	in std_logic;
	CLK	:	in std_logic;
	Q	:	out std_logic 
	);
end Candado;

architecture simple of Candado is 
begin
	process (D,LD,RST, CLK)
	begin
		if (CLK'event and CLK ='1' and RST = '0') then
			Q <= '0';
		elsif (
			
			CLK'event and CLK ='1' and LD = '1') then
			Q <= D;
		end if; 
	end process;
	end simple; 