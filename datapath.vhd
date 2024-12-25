library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 

entity datapath is
	port(
		Clk,Rst,MEMrq,RnW,IRce,PCce,ACCce,Asel,Bsel : in std_logic;
		ALUfs : in std_logic_vector(1 downto 0);
		ACC15, ACCz : out std_logic;
		Opcode : out std_logic_vector(3 downto 0);
		regPC,regIR,regACC : out std_logic_vector(15 downto 0)
		);
end datapath;
		
architecture sample of datapath is
	component mem is
		port(Clk,Rst : in std_logic ; 
        	MEMrq,RnW :in std_logic; 
        	Addr : in std_logic_vector(11 downto 0); 		
        	DataIn : in std_logic_vector(15 downto 0); 
        	DataOut : out std_logic_vector(15 downto 0)
		);
	end component;

	component IR is
		port(
			Clk,Rst,IRce : in std_logic;
			IRin : in std_logic_vector(15 downto 0);
			Opcode : out std_logic_vector(3 downto 0);
			IRout : out std_logic_vector(15 downto 0)
		);
	end component;
 
	component PC is
		port(
			Clk, Rst, PCce : in std_logic;
			PCin : in std_logic_vector(15 downto 0);
			PCout : out std_logic_vector(15 downto 0)
		);
	end component;

	component ACC is
		port(
			Clk, Rst, ACCce : in std_logic;				
			ACCin : in std_logic_vector (15 downto 0);
			ACCout : out std_logic_vector(15 downto 0);		
			ACC15, ACCz : out std_logic
		);
	end component;

	component ALU is
		port(
			A,B 	: in std_logic_vector(15 downto 0);
			ALUfs	: in std_logic_vector(1 downto 0);
			ALUout	: out std_logic_vector(15 downto 0)
		);
	end component;

	component MUX2x1 is
		port(
			A1,A0 : in std_logic_vector (15 downto 0);
  		 	Sel   : in std_logic;  
		 	Y 	  : out std_logic_vector(15 downto 0)
		);		
	end component;

	signal 	AddrBus, DataOut, IRout_sig, PCout_sig, ALUout_sig, ALU_Bin, ALU_Ain : std_logic_vector(15 downto 0);
	signal	Addr : std_logic_vector(11 downto 0);

begin
	IR1 : IR port map (Clk,Rst,IRce,Dataout,opcode,IRout_sig);
	PC1 : PC port map (Clk,Rst,PCce,ALUout_sig,PCout_sig);
	ACC1: ACC port map(Clk,Rst,ACCce,ALUout_sig,ALU_Ain,ACC15,ACCz);
	ALU1: ALU port map(ALU_Ain,ALU_Bin,ALUfs,ALUout_sig);
	mem1: mem port map(Clk,Rst,MEMrq,RnW,Addr,ALU_Ain,DataOut); 
	mux1: MUX2x1 port map(IROut_sig,PCout_sig,Asel,AddrBus);
	mux2: MUX2x1 port map(DataOut,AddrBus,Bsel,ALU_Bin);

	Addr <= AddrBus(11 downto 0);
	regPC <= PCout_sig;
	regIR <= IRout_sig;
	regACC<= ALU_Ain;

end sample;
