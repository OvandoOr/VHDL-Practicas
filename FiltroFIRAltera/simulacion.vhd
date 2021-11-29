----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:46 12/06/2018 
-- Design Name: 
-- Module Name:    Simulacion - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simulacion IS
END simulacion;
 
ARCHITECTURE behavior OF simulacion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component FIR_4 is
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STF : in  STD_LOGIC;
           X   : in  STD_LOGIC_VECTOR (17 downto 0);
           RDY : out  STD_LOGIC;
           Y   : out  STD_LOGIC_VECTOR (17 downto 0));
end component;

   --Inputs
   signal X : std_logic_vector(17 downto 0) ;
	signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
	signal STF :   STD_LOGIC:= '0';-- comenzar proceso

 	--Outputs
   signal y : std_logic_vector(17 downto 0);


   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
 
BEGIN
 	-- Instantiate the Unit Under Test (UUT)
 
 
     

   -- Clock process definitions
  CLK_process :process
   begin
		CLK <= '0';
		wait for 50 ns;
		CLK <= '1';
		wait for 50 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     RST <= '0';
      wait for 110 ns;
		
	  RST <= '1';
		wait;

        end process;
	
	Entrada : process
	
	begin --aqui el banco de pruebas
	
	STF <= '1';
	wait for 20 ns;
	X <= "000000000000000000"; -- Indice 0   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 1   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 2   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 3   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 4   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 5   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 6   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 7   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 8   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 9   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 10   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 11   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 12   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 13   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 14   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 15   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 16   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 17   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 18   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 19   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 20   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 21   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 22   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 23   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 24   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 25   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 26   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 27   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 28   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 29   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 30   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 31   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 32   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 33   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 34   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 35   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 36   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 37   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 38   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 39   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 40   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 41   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 42   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 43   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 44   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 45   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 46   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 47   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 48   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 49   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 50   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 51   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 52   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 53   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 54   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 55   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 56   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 57   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 58   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 59   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 60   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 61   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 62   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 63   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 64   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 65   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 66   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 67   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 68   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 69   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 70   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 71   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 72   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 73   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 74   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 75   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 76   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 77   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 78   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 79   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 80   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 81   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 82   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 83   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 84   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 85   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 86   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 87   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 88   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 89   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 90   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 91   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 92   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 93   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 94   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 95   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 96   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 97   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 98   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 99   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 100   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 101   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 102   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 103   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 104   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 105   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 106   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 107   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 108   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 109   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 110   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 111   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 112   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 113   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 114   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 115   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 116   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 117   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 118   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 119   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 120   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 121   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 122   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 123   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 124   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 125   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 126   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 127   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 128   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 129   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 130   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 131   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 132   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 133   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 134   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 135   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 136   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 137   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 138   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 139   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 140   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 141   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 142   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 143   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 144   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 145   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 146   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 147   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 148   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 149   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 150   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 151   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 152   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 153   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 154   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 155   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 156   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 157   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 158   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 159   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 160   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 161   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 162   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 163   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 164   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 165   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 166   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 167   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 168   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 169   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 170   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 171   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 172   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 173   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 174   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 175   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 176   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 177   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 178   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 179   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 180   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 181   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 182   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 183   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 184   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 185   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 186   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 187   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 188   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 189   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 190   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 191   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 192   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 193   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 194   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 195   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 196   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 197   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 198   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 199   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 200   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 201   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 202   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 203   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 204   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 205   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 206   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 207   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 208   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 209   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 210   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 211   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 212   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 213   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 214   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 215   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 216   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 217   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 218   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 219   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 220   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 221   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 222   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 223   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 224   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 225   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 226   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 227   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 228   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 229   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 230   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 231   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 232   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 233   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 234   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 235   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 236   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 237   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 238   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 239   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 240   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 241   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 242   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 243   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 244   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 245   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 246   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 247   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 248   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 249   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 250   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 251   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 252   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 253   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 254   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 255   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 256   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 257   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 258   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 259   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 260   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 261   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 262   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 263   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 264   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 265   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 266   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 267   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 268   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 269   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 270   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 271   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 272   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 273   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 274   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 275   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 276   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 277   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 278   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 279   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 280   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 281   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 282   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 283   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 284   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 285   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 286   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 287   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 288   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 289   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 290   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 291   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 292   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 293   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 294   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 295   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 296   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 297   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 298   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 299   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 300   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 301   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 302   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 303   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 304   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 305   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 306   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 307   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 308   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 309   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 310   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 311   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 312   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 313   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 314   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 315   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 316   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 317   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 318   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 319   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 320   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 321   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 322   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 323   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 324   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 325   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 326   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 327   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 328   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 329   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 330   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 331   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 332   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 333   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 334   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 335   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 336   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 337   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 338   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 339   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 340   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 341   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 342   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 343   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 344   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 345   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 346   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 347   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 348   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 349   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 350   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 351   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 352   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 353   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 354   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 355   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 356   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 357   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 358   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 359   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 360   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 361   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 362   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 363   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 364   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 365   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 366   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 367   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 368   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 369   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 370   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 371   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 372   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 373   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 374   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 375   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 376   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 377   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 378   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 379   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 380   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 381   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 382   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 383   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 384   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 385   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 386   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 387   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 388   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 389   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 390   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 391   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 392   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 393   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 394   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 395   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 396   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 397   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 398   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 399   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 400   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 401   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 402   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 403   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 404   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 405   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 406   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 407   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 408   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 409   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 410   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 411   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 412   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 413   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 414   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 415   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 416   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 417   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 418   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 419   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 420   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 421   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 422   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 423   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 424   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 425   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 426   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 427   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 428   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 429   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 430   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 431   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 432   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 433   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 434   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 435   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 436   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 437   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 438   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 439   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 440   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 441   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 442   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 443   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 444   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 445   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 446   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 447   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 448   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 449   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 450   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 451   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 452   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 453   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 454   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 455   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 456   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 457   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 458   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 459   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 460   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 461   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 462   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 463   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 464   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 465   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 466   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 467   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 468   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 469   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 470   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 471   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 472   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 473   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 474   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 475   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 476   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 477   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 478   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 479   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 480   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 481   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 482   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 483   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 484   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 485   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 486   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 487   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 488   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 489   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 490   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 491   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 492   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 493   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 494   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 495   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 496   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 497   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 498   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 499   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 500   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 501   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 502   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 503   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 504   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 505   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 506   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 507   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 508   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 509   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 510   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 511   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 512   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 513   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 514   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 515   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 516   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 517   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 518   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 519   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 520   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 521   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 522   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 523   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 524   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 525   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 526   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 527   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 528   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 529   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 530   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 531   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 532   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 533   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 534   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 535   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 536   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 537   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 538   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 539   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 540   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 541   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 542   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 543   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 544   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 545   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 546   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 547   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 548   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 549   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 550   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 551   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 552   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 553   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 554   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 555   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 556   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 557   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 558   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 559   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 560   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 561   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 562   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 563   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 564   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 565   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 566   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 567   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 568   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 569   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 570   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 571   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 572   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 573   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 574   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 575   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 576   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 577   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 578   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 579   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 580   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 581   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 582   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 583   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 584   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 585   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 586   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 587   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 588   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 589   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 590   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 591   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 592   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 593   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 594   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 595   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 596   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 597   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 598   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 599   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 600   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 601   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 602   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 603   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 604   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 605   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 606   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 607   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 608   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 609   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 610   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 611   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 612   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 613   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 614   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 615   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 616   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 617   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 618   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 619   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 620   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 621   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 622   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 623   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 624   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 625   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 626   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 627   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 628   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 629   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 630   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 631   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 632   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 633   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 634   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 635   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 636   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 637   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 638   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 639   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 640   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 641   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 642   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 643   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 644   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 645   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 646   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 647   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 648   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 649   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 650   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 651   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 652   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 653   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 654   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 655   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 656   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 657   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 658   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 659   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 660   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 661   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 662   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 663   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 664   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 665   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 666   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 667   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 668   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 669   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 670   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 671   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 672   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 673   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 674   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 675   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 676   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 677   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 678   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 679   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 680   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 681   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 682   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 683   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 684   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 685   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 686   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 687   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 688   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 689   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 690   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 691   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 692   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 693   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 694   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 695   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 696   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 697   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 698   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 699   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 700   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 701   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 702   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 703   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 704   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 705   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 706   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 707   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 708   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 709   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 710   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 711   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 712   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 713   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 714   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 715   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 716   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 717   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 718   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 719   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 720   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 721   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 722   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 723   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 724   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 725   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 726   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 727   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 728   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 729   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 730   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 731   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 732   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 733   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 734   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 735   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 736   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 737   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 738   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 739   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 740   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 741   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 742   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 743   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 744   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 745   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 746   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 747   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 748   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 749   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 750   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 751   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 752   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 753   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 754   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 755   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 756   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 757   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 758   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 759   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 760   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 761   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 762   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 763   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 764   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 765   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 766   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 767   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 768   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 769   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 770   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 771   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 772   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 773   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 774   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 775   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 776   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 777   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 778   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 779   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 780   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 781   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 782   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 783   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 784   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 785   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 786   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 787   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 788   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 789   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 790   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 791   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 792   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 793   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 794   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 795   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 796   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 797   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 798   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 799   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 800   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 801   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 802   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 803   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 804   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 805   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 806   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 807   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 808   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 809   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 810   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 811   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 812   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 813   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 814   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 815   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 816   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 817   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 818   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 819   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 820   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 821   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 822   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 823   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 824   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 825   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 826   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 827   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 828   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 829   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 830   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 831   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 832   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 833   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 834   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 835   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 836   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 837   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 838   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 839   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 840   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 841   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 842   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 843   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 844   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 845   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 846   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 847   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 848   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 849   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 850   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 851   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 852   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 853   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 854   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 855   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 856   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 857   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 858   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 859   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 860   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 861   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 862   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 863   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 864   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 865   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 866   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 867   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 868   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 869   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 870   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 871   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 872   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 873   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 874   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 875   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 876   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 877   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 878   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 879   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 880   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 881   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 882   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 883   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 884   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 885   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 886   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 887   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 888   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 889   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 890   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 891   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 892   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 893   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 894   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 895   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 896   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 897   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 898   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 899   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 900   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 901   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 902   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 903   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 904   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 905   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 906   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 907   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 908   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 909   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 910   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 911   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 912   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 913   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 914   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 915   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 916   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 917   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 918   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 919   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 920   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 921   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 922   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 923   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 924   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 925   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 926   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 927   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 928   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 929   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 930   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 931   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 932   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 933   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 934   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 935   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 936   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 937   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 938   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 939   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 940   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 941   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 942   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 943   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 944   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 945   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 946   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 947   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 948   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 949   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 950   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 951   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 952   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 953   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 954   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 955   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 956   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 957   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 958   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 959   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 960   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 961   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 962   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 963   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 964   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 965   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 966   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 967   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 968   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 969   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 970   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 971   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 972   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 973   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 974   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 975   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 976   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 977   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 978   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 979   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 980   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 981   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 982   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 983   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 984   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 985   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 986   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 987   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001111101101110111"; -- Indice 988   Valor de la funcion 0.98228455
wait for 1000000 ns;
X <= "001101100000100110"; -- Indice 989   Valor de la funcion 0.84432983
wait for 1000000 ns;
X <= "001001011001111001"; -- Indice 990   Valor de la funcion 0.58778381
wait for 1000000 ns;
X <= "000011111110101010"; -- Indice 991   Valor de la funcion 0.24868774
wait for 1000000 ns;
X <= "111101111111101010"; -- Indice 992   Valor de la funcion -0.12533569
wait for 1000000 ns;
X <= "111000010010101100"; -- Indice 993   Valor de la funcion -0.48175049
wait for 1000000 ns;
X <= "110011101011000000"; -- Indice 994   Valor de la funcion -0.77050781
wait for 1000000 ns;
X <= "110000110010001000"; -- Indice 995   Valor de la funcion -0.95104980
wait for 1000000 ns;
X <= "110000000010000001"; -- Indice 996   Valor de la funcion -0.99803162
wait for 1000000 ns;
X <= "110001100001011101"; -- Indice 997   Valor de la funcion -0.90483093
wait for 1000000 ns;
X <= "110101000011000010"; -- Indice 998   Valor de la funcion -0.68453979
wait for 1000000 ns;
X <= "111010000111000011"; -- Indice 999   Valor de la funcion -0.36811829
wait for 1000000 ns;
X <= "000000000000000000"; -- Indice 1000   Valor de la funcion 0.00000000
wait for 1000000 ns;
X <= "000101111000111101"; -- Indice 1001   Valor de la funcion 0.36811829
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 1002   Valor de la funcion 0.68453979
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 1003   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 1004   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 1005   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 1006   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 1007   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 1008   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 1009   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 1010   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 1011   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 1012   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110000010010001001"; -- Indice 1013   Valor de la funcion -0.98228455
wait for 1000000 ns;
X <= "110010011111011010"; -- Indice 1014   Valor de la funcion -0.84432983
wait for 1000000 ns;
X <= "110110100110000111"; -- Indice 1015   Valor de la funcion -0.58778381
wait for 1000000 ns;
X <= "111100000001010110"; -- Indice 1016   Valor de la funcion -0.24868774
wait for 1000000 ns;
X <= "000010000000010110"; -- Indice 1017   Valor de la funcion 0.12533569
wait for 1000000 ns;
X <= "000111101101010100"; -- Indice 1018   Valor de la funcion 0.48175049
wait for 1000000 ns;
X <= "001100010101000000"; -- Indice 1019   Valor de la funcion 0.77050781
wait for 1000000 ns;
X <= "001111001101111000"; -- Indice 1020   Valor de la funcion 0.95104980
wait for 1000000 ns;
X <= "001111111101111111"; -- Indice 1021   Valor de la funcion 0.99803162
wait for 1000000 ns;
X <= "001110011110100011"; -- Indice 1022   Valor de la funcion 0.90483093
wait for 1000000 ns;
X <= "001010111100111110"; -- Indice 1023   Valor de la funcion 0.68453979
wait for 1000000 ns;


	
	END PROCESS ENTRADA;

END;


