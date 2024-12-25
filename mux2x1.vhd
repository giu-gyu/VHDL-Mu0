library ieee;
use ieee.std_logic_1164.all;

entity MUX2x1 is 
	port(A1,A0 : in std_logic_vector (15 downto 0);
  		 Sel : in std_logic;  
		 Y : out std_logic_vector(15 downto 0));		
end MUX2x1;

architecture sample of MUX2x1 is
begin
	Y<=A1 when (Sel='1') else
	A0;
end sample;
