library ieee;
use ieee.std_logic_1164.all;

entity ha is
	port(a,b : in std_logic; 
		s,c : out std_logic);
end ha;
--entity ha는 입력 a,b 출력 s,c를 가진다.

architecture sample of ha is
begin
	c <= a and b;
	s <= a xor b;
end sample;
--출력 c는 입력 두 개의 and연산, 출력 s는 입력 두 개의 xor연산.

