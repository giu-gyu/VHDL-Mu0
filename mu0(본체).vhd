library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_arith.all; 

entity mu0 is
	port(
		Clk,Rst : in std_logic;							--Clock, Reset
		STATE : out std_logic_vector(2 downto 0);
		regPC, regIR, regACC : out std_logic_vector(15 downto 0)	--PC register, IR register, ACC register
	);
end mu0;

architecture sample of mu0 is
	component Controller is
		port(
			Clk,Rst,Acc15,ACCz : in std_logic;
			Opcode : in std_logic_vector(3 downto 0);
			STATE : out std_logic_vector(2 downto 0);
			MEMrq,RnW,IRce,PCce,ACCce,Asel,Bsel : out std_logic;		--control signal
			ALUfs : out std_logic_vector(1 downto 0)
		);
	end component;

	component datapath is
		port(
			Clk,Rst,MEMrq,RnW,IRce,PCce,ACCce,Asel,Bsel : in std_logic;
			ALUfs : in std_logic_vector(1 downto 0);
			ACC15, ACCz : out std_logic;
			Opcode : out std_logic_vector(3 downto 0);
			regPC,regIR,regACC : out std_logic_vector(15 downto 0)
		);
	end component;

	signal ACC15_sig, ACCz_sig : std_logic;
	signal Opcode_sig : std_logic_vector(3 downto 0);
	signal STATE_sig : std_logic_vector(2 downto 0);
	signal MEMrq_s,RnW_s,IRce_s,PCce_s,ACCce_s,Asel_s,Bsel_s : std_logic;
	signal ALUfs_s : std_logic_vector(1 downto 0);
	signal regPC_sig, regIR_sig, regACC_sig : std_logic_vector(15 downto 0);
	signal regPC_sig_2 : std_logic_vector(11 downto 0);
		
begin
	mu0_con : controller port map (Clk,Rst,ACC15_sig,ACCz_sig,Opcode_sig,STATE_sig,MEMrq_s,RnW_s,IRce_s,PCce_s,ACCce_s,Asel_s,Bsel_s,ALUfs_s);
	mu0_dat : datapath port map (Clk,Rst,MEMrq_s,RnW_s,IRce_s,PCce_s,ACCce_s,Asel_s,Bsel_s,ALUfs_s,ACC15_sig,ACCz_sig,Opcode_sig,regPC_sig,regIR_sig,regACC_sig);

	STATE <= STATE_sig;
    regPC_sig_2 <= regPC_sig(11 downto 0);
	regPC <= "0000"&regPC_sig_2;
	regIR <= regIR_sig;
	regACC<= regACC_sig;

end sample;
