library ieee;
use ieee.std_logic_1164.all;

entity FSM_MASTER is
	port( 
	
	RST			:		in  std_logic;
	CLK			:		in  std_logic;
	STC			:		in  std_logic;
	TB			:		in  std_logic;
	EOT			:		in  std_logic;
	STX			:		out	std_logic;
	SYNC		:		out std_logic;
	OPCBYTE		:		out std_logic_vector(1 downto 0);
	OPCSCLK		:		out std_logic;
	CLEARTB		:		out std_logic;
	CLEARSCLK	:		out std_logic;
	EOC			:		out std_logic
	
	);
end FSM_MASTER;


architecture simple of FSM_MASTER is
signal qn,qp	:	std_logic_vector(3 downto 0);
begin	
	
	
	combinacional : process (qp,STC,TB,EOT)
	begin
		
		case qp is
			
			
			--estado '0'
			when "0000" =>
			if(STC = '1') then
				qn <= "0001";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '1';
			CLEARSCLK	<= '1';
			EOC			<= '1';
			
			
			--estado '1'
			when "0001" =>
			if(TB = '1') then
				qn <= "0010";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '2'
			when "0010" =>
			if(TB = '1') then
				qn <= "0011";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '3'
			when "0011" =>
			if(TB = '1') then
				qn <= "0100";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';	
			
			
			--estado '4'
			when "0100" =>
			if(TB = '1') then
				qn <= "0101";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '5'
			when "0101" =>
			if(TB = '1') then
				qn <= "0110";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '6'
			when "0110" =>
			
			STX			<= '1';
			SYNC     	<= '0';
			OPCBYTE		<= "00";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			qn <= "0111";
			
			
			
			--estado '7'
			when "0111" =>
			if(EOT = '1') then
				qn <= "1000";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '0';
			OPCBYTE		<= "00";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '8'
			when "1000" =>
			
			STX			<= '1';
			SYNC     	<= '0';
			OPCBYTE		<= "01";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			qn <= "1001";
			
			
			--estado '9'
			when "1001" =>
			if(EOT = '1') then
				qn <= "1010";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '0';
			OPCBYTE		<= "01";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--estado '10'
			when "1010" =>
			
			STX			<= '1';
			SYNC     	<= '0';
			OPCBYTE		<= "10";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			qn <= "1011";
			
			
			--estado '9'
			when "1011" =>
			if(EOT = '1') then
				qn <= "0000";
			else
				qn <= qp;
			end if;
			STX			<= '0';
			SYNC     	<= '0';
			OPCBYTE		<= "10";
			OPCSCLK		<= '0';
			CLEARTB		<= '0';
			CLEARSCLK	<= '0';
			EOC			<= '0';
			
			
			--demas estados
			when others =>
			
			qn <= "0000";
			
			STX			<= '0';
			SYNC     	<= '1';
			OPCBYTE		<= "00";
			OPCSCLK		<= '1';
			CLEARTB		<= '1';
			CLEARSCLK	<= '1';
			EOC			<= '1';
			
			
		end case;
	end process combinacional;
	
	
	secuencial : process(RST,CLK)
	begin
		if(RST = '0') then
			qp <= (others => '0');
		elsif(CLK'event and CLK = '1') then
			qp <= qn;
		end if;
	end process secuencial;
end simple;

			
			
			