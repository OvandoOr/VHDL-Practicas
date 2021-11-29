----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:33 11/20/2018 
-- Design Name: 
-- Module Name:    MAC - Bloques 
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


entity MAC is
    Port ( RST : in  STD_LOGIC;--reset
           CLK : in  STD_LOGIC;--clock
           STF : in  STD_LOGIC;-- comenzar proceso
           X : in  STD_LOGIC_VECTOR(17 downto 0);--Señar 
           A : in  STD_LOGIC_VECTOR(35 downto 0);--coeficientes
           N : in  STD_LOGIC_VECTOR(5 downto 0);--Orden
           S : in  STD_LOGIC_VECTOR(5 downto 0);
           EOF : out  STD_LOGIC;--fin del proceso
           I : out  STD_LOGIC_VECTOR(5 downto 0);--contador
           Y : out  STD_LOGIC_VECTOR(17 downto 0));--salida
end MAC;

architecture Bloques of MAC is

component Multiplicador is
    Port ( X : in  STD_LOGIC_VECTOR (17 downto 0);--señal
           A : in  STD_LOGIC_VECTOR (35 downto 0);--coeficiente
           M : out  STD_LOGIC_VECTOR (53 downto 0)--resultado de la multiplicacion
			  );
end Component;

component Sumador is
    Port ( Q : in  STD_LOGIC_VECTOR (59 downto 0); -- salida del registro
           P : in  STD_LOGIC_VECTOR (59 downto 0);--p reultado de la multiplicacion
           U : out  STD_LOGIC_VECTOR (59 downto 0)--la suma de Q + P
			  );
 end component;
 
 component Acomulador is -- registo de suma 
    Port ( RST : in  STD_LOGIC;--reset
           CLK : in  STD_LOGIC;--reloj
           LDA : in  STD_LOGIC;--control
           U : in  STD_LOGIC_VECTOR (59 downto 0);--resultado de suma
           Q : out  STD_LOGIC_VECTOR (59 downto 0)--variable para volver a sumar
);
end component;

Component contador is
    Port ( RST : in  STD_LOGIC;--Reset
           CLK : in  STD_LOGIC;--Reloj
           OPC : in  STD_LOGIC_VECTOR (1 downto 0);--control por medio de la FMS
           N : in  STD_LOGIC_VECTOR (5 downto 0);--Numero de orden
           Z : out  STD_LOGIC;-- indica si llega al tope
           I : out  STD_LOGIC_VECTOR (5 downto 0));--salida para el multiplexor
end component;

component Resultado is
    Port ( RST : in  STD_LOGIC;--Reset
           CLK : in  STD_LOGIC;--Reloj
           LDR : in  STD_LOGIC;--Control registro final
           U : in  STD_LOGIC_VECTOR (59 downto 0);--entra la suma 
           R : out  STD_LOGIC_VECTOR (59 downto 0));--sale para el ajuste final
end component;


 component Ajuste is -- 
    Port ( R : in  STD_LOGIC_VECTOR (59 downto 0);--entrada de ajuste
           S : in  STD_LOGIC_VECTOR (5 downto 0);
           Y : out  STD_LOGIC_VECTOR (17 downto 0));--Salida
end component ;

component FMS is --Componentes de la maquina de estados 
    Port ( RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           STF : in  STD_LOGIC;
           Z   : in  STD_LOGIC;
           LDA : out  STD_LOGIC;
           LDR : out  STD_LOGIC;
           EOF : out  STD_LOGIC;
           OPC : out  STD_LOGIC_VECTOR (1 downto 0));
			  
end component;

signal P,U,Q,R    : STD_LOGIC_vector (59 downto 0);
signal M          : STD_LOGIC_vector (53 downto 0); 
signal OPC        : STD_LOGIC_vector (1 downto 0);
signal Z,LDR,LDA  : std_logic;

begin

p(59 downto 54) <= (others => M(53));
P(53 downto 0) <= M;--Igualamos el resultado de la multiplicacion para pasar al bloque de suma




Bloqueo_1 : Multiplicador port map(X,A,M);
Bloqueo_2 : Sumador       port map(Q,P,U);
Bloqueo_3 : Acomulador    port map(RST,CLK,LDA,U,Q);
Bloqueo_4 : Resultado     port map(RST,CLK,LDR,U,R);
Bloqueo_5 : Contador      port map(RST,CLK,OPC,N,Z,I);
Bloqueo_6 : Ajuste        port map(R,S,Y);
Bloqueo_7 : FMS           port map(RST,CLK,STF,Z,LDA,LDR,EOF,OPC);

end Bloques;

