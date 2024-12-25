library ieee;
use ieee.std_logic_1164.all;

entity test_d_ff is
	port(
		Clk, Rst, D: in std_logic;	
		Q : out std_logic
		);			
end test_d_ff;

architecture sample of test_d_ff is
begin 
	process(Clk,Rst)			-- process

	begin
		if(Rst='1') then
			Q<='0';			-- reset=1 �̸� ��� Q=0
		else
			if(Clk'event and Clk='1') then --Ŭ���� rising edge���� 1�϶
			Q<=D;
			end if;
		end if;
	end process;
end sample;


