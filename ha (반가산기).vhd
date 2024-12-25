library ieee;
use ieee.std_logic_1164.all;

entity ha is
	port(a,b : in std_logic; 
		s,c : out std_logic);
end ha;
--entity ha�� �Է� a,b ��� s,c�� ������.

architecture sample of ha is
begin
	c <= a and b;
	s <= a xor b;
end sample;
--��� c�� �Է� �� ���� and����, ��� s�� �Է� �� ���� xor����.

