library	IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
	
entity Contador_n is
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
end Contador_n;

architecture Programable of Contador_n is

signal Qn, Qp : std_logic_vector(n-1 downto 0);
signal OPC	: std_logic_vector (1 downto 0);
signal K		: std_logic_vector (n-1 downto 0);


begin
	
	Combinacional: process(Qp,OPC,K)
	begin
		case OPC is						 
			when "00"	=> Qn <= Qp;
			when "01"   => Qn <= (others => '0');
			when "10"   => Qn <= K;
			when others => Qn <= Qp - 1;
		end case;
		if (Qp="000000000000000000000001") then
			Z <= '1';
			Qn <= K;
		else
			Z <= '0';
		end if;
		I <= Qp;
	end process Combinacional;
		
	Secuencial: process(RST,CLK)
	begin		  
		if (RST='0') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process Secuencial;
	
	OPC <= "11";
	K <= "101111101011110000100000";
	
end Programable;





--
--library	IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_unsigned.all;
---- 12.5 M
--entity Contador_step is
--	generic(
--	n: 	integer:= 24		-- No. de bits informacion
--	); 
--
--	port(
--	RST 	: in  std_logic;
--	CLK 	: in  std_logic; 
--	STEP   	: buffer std_logic
--	);
--end Contador_step;
--
--architecture Programable of Contador_step is
--
--signal Qn, Qp, zeros: 	std_logic_vector (n-1 downto 0);
--signal x: 	std_logic;
--signal K:  std_logic_vector(n-1 downto 0);
----signal K:		std_logic_vector (n-1 downto 0);
--
----constant One : std_logic_vector(n-1 downto 0) := (others=>'0');
--
--begin
--	
--	Combinacional: process(Qp)
--	begin
--							 
--		Qn <= Qp-1;	-- EN OPC siempre pongan el estado 10 para ser ascendente
--		
--		
--	end process Combinacional;
--		
--	Secuencial: process (RST,CLK,Qn,K, zeros)
--	begin		  
--	
--		if (CLK'event and CLK='1') then
--			Qp <= Qn;
--			STEP <= '0';
--			
--			if (RST='0' and CLK'event and CLK='1') then
--			Qp <= K;
--			STEP <= '0';
--			elsif (Qp = zeros and CLK'event and CLK='1') then
--			Qp <= K;
--			STEP <= '1';
--			end if;
--		end if;	  
--		
--
--	end process Secuencial;	
--	
--	zeros <= (others=>'0');  
--	K <= "101111101011110000100000";   -- 500 ms
--end Programable;
