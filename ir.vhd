library ieee;
use ieee.std_logic_1164.all;

entity ir is
	port(
		Clk,Rst,IRce : in std_logic;
		IRin : in std_logic_vector(15 downto 0);
		Opcode : out std_logic_vector(3 downto 0);
		IRout : out std_logic_vector(15 downto 0)
		);
end ir;

architecture sample of ir is
	component d_ff16 is
		port(
			Clk,Rst : in std_logic;
			Din : in std_logic_vector(15 downto 0);
			Dout : out std_logic_vector(15 downto 0)
			);
	end component;

	signal IRsigin, IRsigout : std_logic_vector(15 downto 0);

begin
	sgIRout: d_ff16 port map (clk,Rst,IRsigin,IRsigout);

	IRsigin <=IRin when (IRce='1') else
			 IRsigout;
	IRout <= IRsigout;

	Opcode(3) <= IRsigout(15);
	Opcode(2) <= IRsigout(14);
	Opcode(1) <= IRsigout(13);
	Opcode(0) <= IRsigout(12);

end sample;

