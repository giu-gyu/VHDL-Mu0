library ieee;
use ieee.std_logic_1164.all;

entity fa is
	port(a,b,cin : in std_logic; 
		s, c : out std_logic);
end fa;

architecture sample of fa is

	component ha is
		port(a,b : in std_logic; 
			s,c: out std_logic);
	end component;

	signal s1,s2,s3 : std_logic;

	begin
		u0 : ha port map(a,b,s1,s2);
		u1 : ha port map(s1,cin,s,s3);

		c <= s2 or s3;
end sample;


