library ieee;
use ieee.std_logic_1164.all;

entity ALU is 
	port(
		A,B 	: in std_logic_vector(15 downto 0);
		ALUfs	: in std_logic_vector(1 downto 0);
		ALUout	: out std_logic_vector(15 downto 0)
		);
end ALU;

architecture sample of ALU is
	component fa_16bit is
	port(
		a,b : in std_logic_vector(15 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(15 downto 0);
		cout : out std_logic
		);		
	end component;

	signal Ain, Bin  : std_logic_vector(15 downto 0);
	signal Cin, Cout : std_logic;

--MUX�� component���Ͽ� coding�ϸ� �ϵ���������� �����Ҽ� ������ �������� ��������, �ڵ尡 ����������.
begin
	Ain <= A when (ALUfs(1)='1') else "0000000000000000";	
	Bin <= not B when((ALUfs(1) and ALUfs(0))='1') else B;
	Cin <= '1' when (ALUfs(0)='1') else '0';
	
	sg_alu : fa_16bit port map (Ain, Bin, Cin, ALUout, Cout);

end sample;

