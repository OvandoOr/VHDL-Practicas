library ieee;
use ieee.std_logic_1164.all;


entity FSM_TXDAC is
	port(
	
	RST		:		in std_logic; 						--reset maestro
	CLK		:		in std_logic;					    --reloj marestro
	STX		:		in std_logic;					    --start tranmision
	TB		:		in std_logic;						--base de tiempo
	OPCTX	:		out std_logic_vector(2 downto 0);   --selector para el multiplexor
	EOT		:		out std_logic						--señal de fin de transmisión
	
	);
end FSM_TXDAC;



architecture simple of FSM_TXDAC is
signal qn,qp : std_logic_vector(4 downto 0);
begin
	
	
	
	
	combinacional : process(qp,STX,TB)
	begin
		case qp is	
			
			--estado cero 'reset' 
			when "00000" =>
			if(STX = '0') then
				qn <= qp;
			else
				qn <= "00001";
			end if;
			OPCTX <= "000";
			EOT	  <= '1';
			
			
			--estado uno d(7)
			when "00001" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00010";
			end if;
			OPCTX <= "000";
			EOT   <= '0';
			
			
			--estado dos d(7)
			when "00010" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00011";
			end if;
			OPCTX <= "000";
			EOT   <= '0';
			
			
			--estado tres d(6)
			when "00011" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00100";
			end if;
			OPCTX <= "001";
			EOT   <= '0';
			
			
			--estado cuatro d(6)
			when "00100" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00101";
			end if;
			OPCTX <= "001";
			EOT   <= '0';
			
			
			--estado cinco d(5)
			when "00101" =>
			if(TB = '0') then
				qn <=qp;
			else
				qn <= "00110";
			end if;
			OPCTX <= "010";
			EOT   <= '0';
			
			
			--estado seis d(5)
			when "00110" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00111";
			end if;
			OPCTX <= "010";
			EOT   <= '0';
			
			
			--estado siete d(4)
			when "00111" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01000";
			end if;
			OPCTX <= "011";
			EOT   <= '0';
			
			
			--estado ocho d(4)
			when "01000" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01001";
			end if;
			OPCTX <= "011";
			EOT   <= '0';
			
			
			--estado nueve d(3)
			when "01001" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01010";
			end if;
			OPCTX <= "100";
			EOT   <= '0';
			
			
			--estado diez d(3)
			when "01010" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01011";
			end if;
			OPCTX <= "100";
			EOT   <= '0';
			
			
			--estado once d(2)
			when "01011" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01100";
			end if;
			OPCTX <= "101";
			EOT   <= '0';
			
			
			--estado doce d(2)
			when "01100" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01101";
			end if;
			OPCTX <= "101";
			EOT   <= '0';
			
			
			--estado trece d(1)
			when "01101" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01110";
			end if;
			OPCTX <= "110";
			EOT   <= '0';
			
			
			--estado catorce d(1)
			when "01110" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "01111";
			end if;
			OPCTX <= "110";
			EOT   <= '0';
			
			
			--estado quince d(0)
			when "01111" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "10000";
			end if;
			OPCTX <= "111";
			EOT   <= '0';
			
			
			--estado dieciseis d(0)
			when "10000" =>
			if(TB = '0') then
				qn <= qp;
			else
				qn <= "00000";
			end if;
			OPCTX <= "111";
			EOT   <= '0'; 
			
			
			
			--demas posibilidades
			when others =>
			qn <= "00000";
			OPCTX <= "000";	 --Checar esto puede ser "000"
			EOT   <= '1';
			
		end case;
	end process combinacional;
	
	secuencial : process (RST, CLK)
	begin
		if(RST = '0') then
			qp <= (others => '0');
		elsif(CLK'event and CLK = '1') then
			qp <= qn;
		end if;
	end process secuencial;
end simple;