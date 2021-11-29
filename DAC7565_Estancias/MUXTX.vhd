library ieee;
use ieee.std_logic_1164.all;


entity MUXTX is
	port( 
	
	OPCTX	:		in std_logic_vector(2 downto 0);
	X		:		in  std_logic_vector(7 downto 0);
	Y		:		out std_logic
	
	);
end MUXTX;

architecture simple of MUXTX is 
begin  
	
	process(OPCTX,X)
	begin
		case OPCTX is
			when "000"   => Y <= X(7);
			when "001"   => Y <= X(6);
			when "010"   => Y <= X(5);
			when "011"   => Y <= X(4);
			when "100"   => Y <= X(3);
			when "101"   => Y <= X(2);
			when "110"   => Y <= X(1);
			when others	 => Y <= X(0);
		end case;
	end process;
end simple;