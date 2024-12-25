library ieee; 
use ieee.std_logic_1164.all; 

entity acc is 
	port(
		Clk, Rst, ACCce : in std_logic;				--input
		ACCin : in std_logic_vector (15 downto 0);
		ACCout : out std_logic_vector(15 downto 0);		--output
		ACC15, ACCz : out std_logic
		);
end acc;

architecture sample of acc is
	component d_ff16 is
		port(Clk,Rst : in std_logic; 
     	  	 Din :in std_logic_vector(15 downto 0); 
       		 Dout : out std_logic_vector(15 downto 0)
			); 
	end component;
	
	signal din, dout : std_logic_vector(15 downto 0);
	
begin
	ACC_dff : d_ff16 port map(clk, Rst, din, dout);

	din <= 	ACCin when (ACCce='1') else dout;
	ACC15 <= dout(15);
	ACCz <= '1' when (dout="0000000000000000") else '0';
	ACCout <= dout;
	
end sample;

