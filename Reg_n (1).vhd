library IEEE;
use IEEE.std_logic_1164.all;


entity registro is
	generic(
	n : integer := 8
	);
	
	
	port(
	RST: in std_logic; 
	CLK: in std_logic;
	LDR: in std_logic;
	D: in std_logic_vector (n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0)
	);
end registro;	   


architecture behavioral of registro is
	signal Qp,Qn: std_logic_vector(n-1 downto 0);	
begin		   
	process(ldr,Qp,D)
	begin
		if(ldr='0')then
			Qn<=Qp;
		else
			Qn<=D;
		end if;
		Q<=Qp;
	end process;		

	process(rst,clk)
	begin
		if (rst = '1') then
			Qp<=(others=>'0');
		elsif(clk'event and clk='0') then
			Qp<=Qn;
		end if;
    end process;
	
	
	
	
	
	
	
	
--	secuencial:process(RST,L,CLK)
--	begin
--		if(RST='1')then
--			Q<=(others=>'0');
--		elsif(clk'event and L='1')then
--			Q <= D;
--		end if;	
--	end process secuencial;
end behavioral;
