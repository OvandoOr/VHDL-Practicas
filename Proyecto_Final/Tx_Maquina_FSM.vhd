library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Tx_Maquina_FSM is
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 B : in STD_LOGIC;
		 STT : in STD_LOGIC;
		 EOT : out STD_LOGIC;
		 M : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end Tx_Maquina_FSM;


architecture Control of Tx_Maquina_FSM is

	signal Qn, Qp : std_logic_vector(3 downto 0); --Estados Internos

begin

   	Combinacional: process(Qp,STT,B)
	begin
		case Qp is
			when "0000" =>
				if (STT = '1') then
					Qn <= Qp;
				else
					Qn <= "0001";
				end if;
				EOT <= '1';
				M   <= "1111";
			when "0001" =>	 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0010";
				end if;
				EOT <= '0';
				M   <= "1111";
			when "0010" => 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0011";
				end if;
				EOT <= '0';
				M   <= "0000";
			when "0011" =>
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0100";
				end if;
				EOT <= '0';
				M   <= "0001";
			when "0100" => 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0101";
				end if;
				EOT <= '0';
				M   <= "0010";
			when "0101" =>	 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0110";
				end if;
				EOT <= '0';
				M   <= "0011";
			when "0110" =>	  
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0111";
				end if;
				EOT <= '0';
				M   <= "0100";
			when "0111" =>	  
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "1000";
				end if;
				EOT <= '0';
				M   <= "0101";
			when "1000" => 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "1001";
				end if;
				EOT <= '0';
				M   <= "0110";
			when "1001" =>	 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "1010";
				end if;
				EOT <= '0';
				M   <= "0111";
			when "1010" =>	 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "1011";
				end if;
				EOT <= '0';
				M   <= "1000";
			when "1011" =>	 
				if (B = '0') then
					Qn <= Qp;
				else
					Qn <= "0000";
				end if;
				EOT <= '0';
				M   <= "1001";
			when others =>	 
				Qn <= "0000";
				EOT <= '0';
				M   <= "1111";
		end case;
	end process Combinacional;
	
	Secuencial: process(RST,CLK)
	begin
		if (RST = '0') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			Qp <= Qn;
		end if;
	end process Secuencial;
	
end Control;
