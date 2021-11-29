library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM_TR_16 is
	 port(
		 RST 			: in STD_LOGIC;
		 CLK 			: in STD_LOGIC;
		 EOT_8 			: in STD_LOGIC;
		 STT_16 		: in STD_LOGIC;
		 EOT_16 		: out STD_LOGIC;
		 STT_8			: out STD_LOGIC;
		 S				: out STD_LOGIC
	     );
end FSM_TR_16;


architecture Control of FSM_TR_16 is

	signal Qn, Qp : std_logic_vector(3 downto 0); --Estados Internos

begin

   	Combinacional: process(Qp,STT_16,EOT_8)
	begin
		case Qp is
			when "0000" =>
				if (STT_16 = '0') then
					Qn <= Qp;
				else
					Qn <= "0001";
				end if;	 
				
				EOT_16 <= '1';
				STT_8 <= '0';
				S <= '0';
				
			when "0001" =>	 
			
				Qn <= "0010";
				EOT_16 <= '0';
				STT_8 <= '1';
				S <= '0';
			
				
			when "0010" => 
				if (EOT_8 = '0') then
					Qn <= Qp;
				else
					Qn <= "0011";
				end if;
				EOT_16 <= '0';
				STT_8 <= '0';
				S <= '0';
				
				
			when "0011" =>
				Qn <= "0100";
				EOT_16 <= '0';
				STT_8 <= '0';
				S <= '1';
				
				
				
				
				
			when "0100" => 
				Qn <= "0101";
				EOT_16 <= '0';
				STT_8 <= '1';
				S <= '1';
				
			when others =>	 
				if (EOT_8 = '0') then
					Qn <= Qp;
				else
					Qn <= "0000";
				end if;
				EOT_16 <= '0';
				STT_8 <= '0';
				S <= '1';
				
				
			--when "0110" =>	  
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "0111";
--				end if;
--				EOT <= '0';
--				M   <= "0100";
--			when "0111" =>	  
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "1000";
--				end if;
--				EOT <= '0';
--				M   <= "0101";
--			when "1000" => 
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "1001";
--				end if;
--				EOT <= '0';
--				M   <= "0110";
--			when "1001" =>	 
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "1010";
--				end if;
--				EOT <= '0';
--				M   <= "0111";
--			when "1010" =>	 
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "1011";
--				end if;
--				EOT <= '0';
--				M   <= "1000";
--			when "1011" =>	 
--				if (B = '0') then
--					Qn <= Qp;
--				else
--					Qn <= "0000";
--				end if;
--				EOT <= '0';
--				M   <= "1001";
--			when others =>	 
--				Qn <= "0000";
--				EOT <= '0';
--				M   <= "1111";
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
