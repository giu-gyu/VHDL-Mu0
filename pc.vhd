library ieee;
use ieee.std_logic_1164.all;

entity PC is
	port(
		Clk, Rst, PCce : in std_logic;
		PCin : in std_logic_vector(15 downto 0);
		PCout : out std_logic_vector(15 downto 0));
end PC;


architecture sample of PC is
	component d_ff16 is
	port(Clk,Rst : in std_logic; 
        Din : in std_logic_vector(15 downto 0); 
        Dout : out std_logic_vector(15 downto 0)); 
	end component;	

	signal PCins, PCouts : std_logic_vector(15 downto 0);

begin
	PC_dff : d_ff16 port map (Clk,Rst,PCins,PCouts);
	PCins <= PCin when (PCce='1') else 
			 PCouts;
	PCout <= PCouts;
end sample;


