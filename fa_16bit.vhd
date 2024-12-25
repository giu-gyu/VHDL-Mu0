library ieee;
use ieee.std_logic_1164.all;

entity fa_16bit is
	port(
		a,b : in std_logic_vector(15 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(15 downto 0);
		cout : out std_logic
		);
end fa_16bit;

architecture sample of fa_16bit is
	component fa is
		port(a,b,cin : in std_logic; s,c : out std_logic);
	end component;

	signal s : std_logic_vector(14 downto 0);

begin
	fa0 : fa port map (a(0),b(0),cin,sum(0),s(0));
	fa1 : fa port map (a(1),b(1),s(0),sum(1),s(1));
	fa2 : fa port map (a(2),b(2),s(1),sum(2),s(2));
	fa3 : fa port map (a(3),b(3),s(2),sum(3),s(3));
	fa4 : fa port map (a(4),b(4),s(3),sum(4),s(4));
	fa5 : fa port map (a(5),b(5),s(4),sum(5),s(5));
	fa6 : fa port map (a(6),b(6),s(5),sum(6),s(6));
	fa7 : fa port map (a(7),b(7),s(6),sum(7),s(7));
	fa8 : fa port map (a(8),b(8),s(7),sum(8),s(8));
	fa9 : fa port map (a(9),b(9),s(8),sum(9),s(9));
	fa10: fa port map (a(10),b(10),s(9),sum(10),s(10));
	fa11: fa port map (a(11),b(11),s(10),sum(11),s(11));
	fa12: fa port map (a(12),b(12),s(11),sum(12),s(12));
	fa13: fa port map (a(13),b(13),s(12),sum(13),s(13));
	fa14: fa port map (a(14),b(14),s(13),sum(14),s(14));
	fa15: fa port map (a(15),b(15),s(14),sum(15),cout);
end sample;

