library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_arith.all; 

entity controller is
	port(
		Clk,Rst,Acc15,ACCz : in std_logic;
		Opcode : in std_logic_vector(3 downto 0);
		STATE : out std_logic_vector(2 downto 0);
		MEMrq,RnW,IRce,PCce,ACCce,Asel,Bsel : out std_logic;
		ALUfs : out std_logic_vector(1 downto 0)
		);
end controller;

architecture sample of controller is
	component test_d_ff is
		port(
			Clk, Rst, D: in std_logic;	
			Q : out std_logic
		);	
	end component;

	signal T0in, T1in, T2in : std_logic;
	signal T0,T1,T2 : std_logic;
	signal Seqstop : std_logic;

	signal LDA, STO, ADD, SUB, JMP, JGE, JNE, STP : std_logic;
	signal zv : std_logic;

--T0 : Fetch
--T1 : Decode
--T2 : Execute
begin
	zV <= '0';			
----- Combination Logic for Next State
	T0in <= Rst or (T2 and not(SeqStop));				-- T0in=1이면 inst. Fetch 시작 
	T1in <= not(Rst) and T0;							-- T1in=1이면 Decode & PC증가 실시
	T2in <= (not(Rst) and T1) or (not(Rst) and T2 and SeqStop);	-- T2in=1이면 Execute 실시
----- Memory Elements
	D0 : test_d_ff port map (Clk, zV, T0in, T0);		-- T0in=1이면 1cycle 후에 T0=1
	D1 : test_d_ff port map (Clk, zV, T1in, T1);		-- test_d_ff은 1bit D-flipflop
	D2 : test_d_ff port map (Clk, zV, T2in, T2);
----- Combination Logic for Output

	-- Opcode Signals
	LDA <= '1' when (Opcode = "0000") else '0';	-- opcode를 문자화하여 가독성을 높였다
 	STO <= '1' when (Opcode = "0001") else '0';
	ADD <= '1' when (Opcode = "0010") else '0';
	SUB <= '1' when (Opcode = "0011") else '0';
	JMP <= '1' when (Opcode = "0100") else '0';
	JGE <= '1' when (Opcode = "0101") else '0';
	JNE <= '1' when (Opcode = "0110") else '0';
	STP <= '1' when (Opcode = "0111") else '0';

	-- Control Signals
	MEMrq <= T0 or (T2 and (LDA or STO or ADD or SUB));
	Asel <= T2 and (LDA or STO or ADD or SUB or JMP or JGE or JNE);
	IRce <= T0;			--IR register`s value is only changed when Instruction Fetch step
	PCce <= T1 or (T2 and (JMP or (JGE and not(ACC15)) or (JNE and not(ACCz ))));
	ALUfs(1) <= T2 and (ADD or SUB);
	ALUfs(0) <= T1 or (T2 and SUB);
	Bsel <= T2 and (LDA or ADD or SUB);
	ACCce <= T2 and (LDA or ADD or SUB);
	SeqStop <= T2 and STP;		--STP 실행에만 사용된다.
	RnW <= T2 and STO;			--Memory store 명령어인 경우에만 Memory Wright동작. LDA, ADD, SUB경우 Read동작만 수행

	-- STATE
	STATE(2) <= T0;			-- 오른쪽과 같이 한줄에 코딩가능 'STATE <=T0&T1&T2;'
	STATE(1) <= T1;			-- 하지만 3줄로 나누는 것이 가독성이 더 좋다.
	STATE(0) <= T2;

end sample;

