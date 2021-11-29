---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:37 11/21/2018 
-- Design Name: 
-- Module Name:    Ajuste - Simple 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Ajuste is
    Port ( R : in  STD_LOGIC_VECTOR (59 downto 0);
           S : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (17 downto 0));
end Ajuste;

architecture Simple of Ajuste is

begin
	process(R,S)
	begin
		case S is
				when "000000" => Y <= R(17 downto 0);
				when "000001" => Y <= R(18 downto 1);
				when "000010" => Y <= R(19 downto 2);
				when "000011" => Y <= R(20 downto 3);
				when "000100" => Y <= R(21 downto 4);
				when "000101" => Y <= R(22 downto 5);
				when "000110" => Y <= R(23 downto 6);
				when "000111" => Y <= R(24 downto 7);
				when "001000" => Y <= R(25 downto 8);
				when "001001" => Y <= R(26 downto 9);
				when "001010" => Y <= R(27 downto 10);
				when "001011" => Y <= R(28 downto 11);
				when "001100" => Y <= R(29 downto 12);
				when "001101" => Y <= R(30 downto 13);
				when "001110" => Y <= R(31 downto 14);
				when "001111" => Y <= R(32 downto 15);
				when "010000" => Y <= R(33 downto 16);
				when "010001" => Y <= R(34 downto 17);
				when "010010" => Y <= R(35 downto 18);
				when "010011" => Y <= R(36 downto 19);
				when "010100" => Y <= R(37 downto 20);
				when "010101" => Y <= R(38 downto 21);
				when "010110" => Y <= R(39 downto 22);
				when "010111" => Y <= R(40 downto 23);
				when "011000" => Y <= R(41 downto 24);
				when "011001" => Y <= R(42 downto 25);
				when "011010" => Y <= R(43 downto 26);
				when "011011" => Y <= R(44 downto 27);
				when "011100" => Y <= R(45 downto 28);
				when "011101" => Y <= R(46 downto 29);
				when "011110" => Y <= R(47 downto 30);
				when "011111" => Y <= R(48 downto 31);
				when "100000" => Y <= R(49 downto 32);
				when "100001" => Y <= R(50 downto 33);
				when "100010" => Y <= R(51 downto 34);
				when "100011" => Y <= R(52 downto 35);
				when "100100" => Y <= R(53 downto 36);
				when "100101" => Y <= R(54 downto 37);
				when "100110" => Y <= R(55 downto 38);
				when "100111" => Y <= R(56 downto 39);
				when "101000" => Y <= R(57 downto 40);
				when "101001" => Y <= R(58 downto 41);
				when others   => Y <= R(59 downto 42);
				end case;
				end process;
				
				
				
end Simple;
