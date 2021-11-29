library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



entity ALU is
	generic(
	n: integer :=4
	);
	
	port (
	A: in std_logic_vector (n-1 downto 0);
	B: in std_logic_vector (n-1 downto 0);
	Ci:in std_logic;
	F: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (n-1 downto 0);
	S: out std_logic;
	Z: out std_logic;
	V: out std_logic;
	C: out std_logic
	);
end ALU;

architecture Behavioral of ALU is
signal M,P : std_logic_vector (n-1 downto 0);
begin
process (A,B,Ci,F,M,P)
variable S1: unsigned (n downto 0);
variable S2: unsigned (n downto 0);
variable S3: unsigned (n downto 0);

begin
	
	S1 := unsigned ('0' & A) + unsigned ('0' &B) + Ci;
	S2 := unsigned ('0' & A) + unsigned ('0' & not(B)) + Ci;
	S3 := unsigned ('0' & not (A)) + unsigned ('0' & B) + Ci;
	
	case F is 
	
		when "000" =>
		M <= std_logic_vector (S1(n-1 downto 0));
		C <= std_logic (S1(n));
		V <= (A(n-1) and not (B(n-1)) and not(M(n-1))) or (not(A(n-1)) and not (B(n-1)) and M(n-1));
		
		when "001" =>
		M <= std_logic_vector (S2(n-1 downto 0));
		C <= std_logic (S2(n));
		V <= (A(n-1) and not (B(n-1)) and not(M(n-1))) or (not(A(n-1)) and (B(n-1)) and M(n-1));
		
		when "010" =>
		M <= std_logic_vector (S3(n-1 downto 0));
		C <= std_logic (S3(n));
		V <= (not(A(n-1)) and B(n-1) and not(M(n-1))) or (A(n-1) and not (B(n-1)) and M(n-1));
		
		when "011" =>
		M <= A xor B;
		C <= '0';
		V <= '0';
		
		when "100" =>
		M <= A AND B;
		C <= '0';
		V <= '0';
		
		when "101" =>
		M <= NOT(A) AND B;
		C <= '0';
		V <= '0';
		
		when "110" =>
		M <= A OR B;
		C <= '0';
		V <= '0';
		
		when others =>
		M <= A xnor B;
		C <= '0';
		V <= '0';
		end case;
	
		R <= M;
		S <= M(n-1);
		P(0) <= M(0);
		
		for i in 1 to n-1 loop
		P(i) <= P(i-1) or M(i);
		end loop;
		
		Z <= not (P(N-1));
		end process;
	end Behavioral;

