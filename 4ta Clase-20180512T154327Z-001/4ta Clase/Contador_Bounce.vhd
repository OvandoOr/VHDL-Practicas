library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Contador_Bounce is
	generic(
	n: 	integer:= 24		-- No. de bits informacion
	); 	
	port (
	P_0, P_1: 			in std_logic;
	CLK:						in std_logic;
	RST: 						in std_logic;
	cuenta:				out std_logic_vector (2 downto 0)
	);
end Contador_Bounce;

architecture Behavioral of Contador_Bounce is


component Contador_n is
generic(
	n: 	integer:= 24		-- No. de bits informacion
	); 

	port(
	RST : in  std_logic;
	CLK : in  std_logic;
--	OPC : in  std_logic_vector(1 downto 0);
--	K   : in  std_logic_vector(7 downto 0);
	Z   : out std_logic;
	I   : out std_logic_vector(n-1 downto 0)
	);
end component;


component Debounce is
port(
	B_SET:			IN std_logic;
	B_RESET:	IN std_logic;
	B_OUT:		buffer std_logic;
	B_NOUT:		buffer std_logic
	);

end component;


signal step : std_logic;
signal Q_not : std_logic;
signal cuenta_S : std_logic_vector (n-1 downto 0);


begin

			contador:	contador_n generic map (24)	port map (RST,CLK,STEP,cuenta_s);
			FF: 				debounce											port map (P_0,P_1,STEP, open );
			
			cuenta <= cuenta_S (2 downto 0);
			
end Behavioral;

