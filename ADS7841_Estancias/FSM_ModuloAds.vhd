----------------------------------------------------------------------------------
-- Company: UAQ (Estancias II 2018).
-- Engineer: Carrllo Zatarain Juan Alfredo.
-- 
-- Create Date:    17:28:22 11/15/2018.
-- Design Name: 
-- Module Name:    FSM_ModuloAds - simple.
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
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.NUMERIC_STD.ALL;

	entity FSM_ModuloAds is
		 Port ( RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  STP : in  STD_LOGIC;
				  EOTADS : in  STD_LOGIC;
				  IGUAL : in  STD_LOGIC;
				  EOTB : in  STD_LOGIC;
				  OPC1 : out  STD_LOGIC_VECTOR (1 downto 0);
				  OPC2 : out  STD_LOGIC_VECTOR (1 downto 0);
				  STPADS : out  STD_LOGIC;
				  EOP : out  STD_LOGIC;
				  ENWRITE : out  STD_LOGIC);
	end FSM_ModuloAds;

architecture simple of FSM_ModuloAds is

signal QP,QN: std_logic_vector(2 downto 0);   --Sequential process present and next state signals
	begin
		combinational: process(QP,STP,EOTADS,IGUAL,EOTB)
		begin
			case QP is	
				--S0 Initial state waiting for STC
				when "000" =>
						if(STP='0') then
							QN<=QP;
						else
							QN<="001";
						end if;
						--Asignación de valores 
						  OPC1 <= "11";
						  OPC2 <= "11";
						  STPADS <= '0';
						  EOP <= '1';
						  ENWRITE <= '0';
			
				--S1 
				when "001" =>
						if(EOTADS='1') then
							QN<=QP;
						else
							QN<="010";
						end if;
						--Asignación de valores 
						  OPC1 <= "00";
						  OPC2 <= "01";
						  STPADS <= '1';
						  EOP <= '0';
						  ENWRITE <= '0';
						  
				--S2
				when "010" =>
					if(EOTADS='0') then 
						QN<=QP;
					else
						QN<="011";
					end if;
					--Asignación de valores 
						  OPC1 <= "00";
						  OPC2 <= "01";
						  STPADS <= '0';
						  EOP <= '0';
						  ENWRITE <= '0';
				
				--S3
				when "011" =>
					if(EOTB='0') then 
						QN<=QP;
					else
						QN<="100";
					end if;
					--Asignación de valores 
						  OPC1 <= "00";
						  OPC2 <= "01";
						  STPADS <= '0';
						  EOP <= '0';
						  ENWRITE <= '1';
						  
				--S4
				when "100" =>
					if(EOTB='0') then 
						QN<=QP;
					else
						QN<="101";
					end if;
					--Asignación de valores 
						  OPC1 <= "00";
						  OPC2 <= "01";
						  STPADS <= '0';
						  EOP <= '0';
						  ENWRITE <= '0'; --Duda en este, no se especificó en el pizarrón.
						  
				--S5
				when "101" =>
					if(IGUAL='0') then 
						QN<="001";
					else
						QN<="000";
					end if;
					--Asignación de valores 
						  OPC1 <= "01";
						  OPC2 <= "11";
						  STPADS <= '0';
						  EOP <= '0';
						  ENWRITE <= '0'; --Duda en este, no se especificó en el pizarrón.
				
				-- Invalid states
				when others =>
				
				QN <= "000";
				OPC1 <= "11";
				OPC2 <= "11";
				STPADS <= '0';
				EOP <= '1';
				ENWRITE <= '0';
				
			end case;
			
		end process combinational;
		
		secuencial: process(RST,CLK)	   
		begin
			if(RST='0') then			   --Active in Low Reset (ALTERA)
				QP<=(others=>'0');
			
			elsif(CLK'event and CLK='1') then
				QP<=QN;
			
			end if;
			
		end process secuencial;

	end simple;