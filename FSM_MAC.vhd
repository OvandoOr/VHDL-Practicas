library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity FSM_MAC is
	port(
	RST:	in std_logic;
	CLK:	in std_logic;
	STP:	in std_logic;
	Igual:	in std_logic;
	OPC1:	out std_logic_vector(1 downto 0);
	OPC2:	out std_logic_vector(1 downto 0);
	EN:		out std_logic;
	EOP:	out std_logic
	);
end FSM_MAC;

architecture maquina of FSM_MAC is
type FSM_STATES is (S0,S1,S2,S3);
signal Qn,Qp: FSM_STATES;
begin
	
	combinacional: process(Qp,Igual,STP)
		begin
			case Qp is
				when S0 =>
				if(STP = '1') then
					Qn <= S1;
				else
					Qn <= S0;
				end if;		
				OPC1 <= "11";	-- limpia
				OPC2 <= "11";	-- limpia
				EN <= '0';		-- mantiene
				EOP <= '1';
				
				when S1 =>
				Qn <= S2;
				OPC1 <= "00";	-- mantiene
				OPC2 <= "01";	-- carga
				EN <= '0';		-- mantiene
				EOP <= '0';				   
				
				when S2 =>
				if(Igual = '1') then
					Qn <= S3;
				else
					Qn <= S1;
				end if;
				OPC1 <= "01";	-- incrementa
				OPC2 <= "00";	-- mantiene
				EN <= '0';		-- mantiene
				EOP <= '0';
				
				when others =>
				Qn <= S0;
				OPC1 <= "11";	-- limpia
				OPC2 <= "11";	-- limpia
				EN <= '1';		-- carga
				EOP <= '0';				
				
			end case;
		end process combinacional;
		
		secuencial: process(RST,CLK)
		begin
		if(RST = '1') then
			Qp <= S0;
		elsif(CLK'event and CLK = '1') then
			Qp <= Qn;
		end if;
	end process secuencial;
		
end maquina;
		
			
				
				
				
		
