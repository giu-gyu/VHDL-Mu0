library ieee; use ieee.std_logic_1164.all; use ieee.std_logic_arith.all; 

entity mem is
    port(Clk,Rst : in std_logic ; 
        MEMrq,RnW :in std_logic; 
        Addr : in std_logic_vector(11 downto 0);	
        DataIn : in std_logic_vector(15 downto 0); 
        DataOut : out std_logic_vector(15 downto 0)); 
end mem; 

architecture sample of mem is 
    constant resAdrLength: integer := 6; -- address length restricted within architecture 
    constant memSize: integer := 2**resAdrLength; 

    component d_ff16 is 
        port(Clk,Rst : in std_logic ; 
            Din :in std_logic_vector(15 downto 0); 
            Dout : out std_logic_vector(15 downto 0) ); 
    end component; 

    signal zV : std_logic;
	signal DataOutS : std_logic_vector(15 downto 0);
	signal Address : std_logic_vector(resAdrLength-1 downto 0);

    signal Din0,Dout0 : std_logic_vector(15 downto 0); 
    signal Din1,Dout1 : std_logic_vector(15 downto 0); 
    signal Din2,Dout2 : std_logic_vector(15 downto 0); 
    signal Din3,Dout3 : std_logic_vector(15 downto 0); 
    signal Din4,Dout4 : std_logic_vector(15 downto 0); 
    signal Din5,Dout5 : std_logic_vector(15 downto 0); 
    signal Din6,Dout6 : std_logic_vector(15 downto 0); 
    signal Din7,Dout7 : std_logic_vector(15 downto 0); 
    signal Din8,Dout8 : std_logic_vector(15 downto 0); 
    signal Din9,Dout9 : std_logic_vector(15 downto 0); 
    signal Din10,Dout10 : std_logic_vector(15 downto 0); 
    signal Din11,Dout11 : std_logic_vector(15 downto 0); 
    signal Din12,Dout12 : std_logic_vector(15 downto 0); 
    signal Din13,Dout13 : std_logic_vector(15 downto 0); 
    signal Din14,Dout14 : std_logic_vector(15 downto 0); 
    signal Din15,Dout15 : std_logic_vector(15 downto 0); 
    signal Din16,Dout16 : std_logic_vector(15 downto 0); 
    signal Din17,Dout17 : std_logic_vector(15 downto 0); 
    signal Din18,Dout18 : std_logic_vector(15 downto 0); 
    signal Din19,Dout19 : std_logic_vector(15 downto 0); 
    signal Din20,Dout20 : std_logic_vector(15 downto 0); 
    signal Din21,Dout21 : std_logic_vector(15 downto 0); 
    signal Din22,Dout22 : std_logic_vector(15 downto 0); 
    signal Din23,Dout23 : std_logic_vector(15 downto 0); 
    signal Din24,Dout24 : std_logic_vector(15 downto 0); 
    signal Din25,Dout25 : std_logic_vector(15 downto 0); 
    signal Din26,Dout26 : std_logic_vector(15 downto 0); 
    signal Din27,Dout27 : std_logic_vector(15 downto 0); 
    signal Din28,Dout28 : std_logic_vector(15 downto 0); 
    signal Din29,Dout29 : std_logic_vector(15 downto 0); 
    signal Din30,Dout30 : std_logic_vector(15 downto 0); 
    signal Din31,Dout31 : std_logic_vector(15 downto 0); 
    signal Din32,Dout32 : std_logic_vector(15 downto 0); 
    signal Din33,Dout33 : std_logic_vector(15 downto 0); 
    signal Din34,Dout34 : std_logic_vector(15 downto 0); 
    signal Din35,Dout35 : std_logic_vector(15 downto 0); 
    signal Din36,Dout36 : std_logic_vector(15 downto 0); 
    signal Din37,Dout37 : std_logic_vector(15 downto 0); 
    signal Din38,Dout38 : std_logic_vector(15 downto 0); 
    signal Din39,Dout39 : std_logic_vector(15 downto 0); 
    signal Din40,Dout40 : std_logic_vector(15 downto 0); 
    signal Din41,Dout41 : std_logic_vector(15 downto 0); 
    signal Din42,Dout42 : std_logic_vector(15 downto 0); 
    signal Din43,Dout43 : std_logic_vector(15 downto 0); 
    signal Din44,Dout44 : std_logic_vector(15 downto 0); 
    signal Din45,Dout45 : std_logic_vector(15 downto 0); 
    signal Din46,Dout46 : std_logic_vector(15 downto 0); 
    signal Din47,Dout47 : std_logic_vector(15 downto 0); 
    signal Din48,Dout48 : std_logic_vector(15 downto 0); 
    signal Din49,Dout49 : std_logic_vector(15 downto 0); 
    signal Din50,Dout50 : std_logic_vector(15 downto 0); 
    signal Din51,Dout51 : std_logic_vector(15 downto 0); 
    signal Din52,Dout52 : std_logic_vector(15 downto 0); 
    signal Din53,Dout53 : std_logic_vector(15 downto 0); 
    signal Din54,Dout54 : std_logic_vector(15 downto 0); 
    signal Din55,Dout55 : std_logic_vector(15 downto 0); 
    signal Din56,Dout56 : std_logic_vector(15 downto 0); 
    signal Din57,Dout57 : std_logic_vector(15 downto 0); 
    signal Din58,Dout58 : std_logic_vector(15 downto 0); 
    signal Din59,Dout59 : std_logic_vector(15 downto 0); 
    signal Din60,Dout60 : std_logic_vector(15 downto 0); 
    signal Din61,Dout61 : std_logic_vector(15 downto 0); 
    signal Din62,Dout62 : std_logic_vector(15 downto 0); 
    signal Din63,Dout63 : std_logic_vector(15 downto 0); 

begin 
    zV <= '0'; 
    Address <=  Addr(resAdrLength-1 downto 0);

	Din0 <=  "0000000000001010" when (Rst='1') else     -- 0. LDA D10 (0x000a) 
        DataIn when(Address= x"000" and MEMrq ='1' and RnW='1') else
        Dout0; 
    Din1 <=  "0010000000001011" when (Rst='1') else     -- 1. ADD D11 (0x000b) 
        DataIn when(Address= x"001" and MEMrq ='1' and RnW='1') else 
        Dout1; 
    Din2 <=  "0001000000010100" when (Rst='1') else     -- 2. STO D20 (0x0014) 
        DataIn when(Address= x"002" and MEMrq ='1' and RnW='1') else 
        Dout2; 
    Din3 <=  "0011000000001100" when (Rst='1') else     -- 3. SUB D12 (0x000c) 
        DataIn when(Address= x"003" and MEMrq ='1' and RnW='1') else 
        Dout3; 
    Din4 <=  "0110000000000110" when (Rst='1') else     -- 4. JNE D6 (0x0006) 
        DataIn when(Address= x"004" and MEMrq ='1' and RnW='1') else 
        Dout4; 
    Din5 <=  "0111000000000000" when (Rst='1') else     -- 5. STP D0 (0x0000) 
        DataIn when(Address= x"005" and MEMrq ='1' and RnW='1') else 
        Dout5; 
    Din6 <=  "0011000000001100" when (Rst='1') else     -- 6. SUB D12 (0x000c) 
        DataIn when(Address= x"006" and MEMrq ='1' and RnW='1') else 
        Dout6; 
    Din7 <=  "0101000000001101" when (Rst='1') else     -- 7. JGE D13 (0x000d) 
        DataIn when(Address= x"007" and MEMrq ='1' and RnW='1') else 
        Dout7; 
    Din8 <=  "0010000000001010" when (Rst='1') else     -- 8. ADD D10 (0x000a) 
        DataIn when(Address= x"008" and MEMrq ='1' and RnW='1') else 
        Dout8; 
    Din9 <=  "0100000000001101" when (Rst='1') else     -- 9. JMP D13 (0x000d) 
        DataIn when(Address= x"009" and MEMrq ='1' and RnW='1') else 
        Dout9; 
    Din10 <=  "0000000000110010" when (Rst='1') else     -- 10. DAT D50 (0x0032) 
        DataIn when(Address= x"00a" and MEMrq ='1' and RnW='1') else 
        Dout10; 
    Din11 <=  "0000000001100100" when (Rst='1') else     -- 11. DAT D100 (0x0064) 
        DataIn when(Address= x"00b" and MEMrq ='1' and RnW='1') else 
        Dout11; 
    Din12 <=  "0000000001000110" when (Rst='1') else     -- 12. DAT D70 (0x0046) 
        DataIn when(Address= x"00c" and MEMrq ='1' and RnW='1') else 
        Dout12; 
    Din13 <=  "0001000000010101" when (Rst='1') else     -- 13. STO D21 (0x0015) 
        DataIn when(Address= x"00d" and MEMrq ='1' and RnW='1') else 
        Dout13; 
    Din14 <=  "0000000000010100" when (Rst='1') else     -- 14. LDA D20 (0x0014) 
        DataIn when(Address= x"00e" and MEMrq ='1' and RnW='1') else 
        Dout14; 
    Din15 <=  "0011000000010101" when (Rst='1') else     -- 15. SUB D21 (0x0015) 
        DataIn when(Address= x"00f" and MEMrq ='1' and RnW='1') else 
        Dout15; 
    Din16 <=  "0111000000000000" when (Rst='1') else     -- 16. STP D0 (0x0000) 
        DataIn when(Address= x"010" and MEMrq ='1' and RnW='1') else 
        Dout16; 
    Din17 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"011" and MEMrq ='1' and RnW='1') else 
        Dout17; 
    Din18 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"012" and MEMrq ='1' and RnW='1') else 
        Dout18; 
    Din19 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"013" and MEMrq ='1' and RnW='1') else 
        Dout19; 
    Din20 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"014" and MEMrq ='1' and RnW='1') else 
        Dout20; 
    Din21 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"015" and MEMrq ='1' and RnW='1') else 
        Dout21; 
    Din22 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"016" and MEMrq ='1' and RnW='1') else 
        Dout22; 
    Din23 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"017" and MEMrq ='1' and RnW='1') else 
        Dout23; 
    Din24 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"018" and MEMrq ='1' and RnW='1') else 
        Dout24; 
    Din25 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"019" and MEMrq ='1' and RnW='1') else 
        Dout25; 
    Din26 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01a" and MEMrq ='1' and RnW='1') else 
        Dout26; 
    Din27 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01b" and MEMrq ='1' and RnW='1') else 
        Dout27; 
    Din28 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01c" and MEMrq ='1' and RnW='1') else 
        Dout28; 
    Din29 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01d" and MEMrq ='1' and RnW='1') else 
        Dout29; 
    Din30 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01e" and MEMrq ='1' and RnW='1') else 
        Dout30; 
    Din31 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"01f" and MEMrq ='1' and RnW='1') else 
        Dout31; 
    Din32 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"020" and MEMrq ='1' and RnW='1') else 
        Dout32; 
    Din33 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"021" and MEMrq ='1' and RnW='1') else 
        Dout33; 
    Din34 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"022" and MEMrq ='1' and RnW='1') else 
        Dout34; 
    Din35 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"023" and MEMrq ='1' and RnW='1') else 
        Dout35; 
    Din36 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"024" and MEMrq ='1' and RnW='1') else 
        Dout36; 
    Din37 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"025" and MEMrq ='1' and RnW='1') else 
        Dout37; 
    Din38 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"026" and MEMrq ='1' and RnW='1') else 
        Dout38; 
    Din39 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"027" and MEMrq ='1' and RnW='1') else 
        Dout39; 
    Din40 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"028" and MEMrq ='1' and RnW='1') else 
        Dout40; 
    Din41 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"029" and MEMrq ='1' and RnW='1') else 
        Dout41; 
    Din42 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02a" and MEMrq ='1' and RnW='1') else 
        Dout42; 
    Din43 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02b" and MEMrq ='1' and RnW='1') else 
        Dout43; 
    Din44 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02c" and MEMrq ='1' and RnW='1') else 
        Dout44; 
    Din45 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02d" and MEMrq ='1' and RnW='1') else 
        Dout45; 
    Din46 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02e" and MEMrq ='1' and RnW='1') else 
        Dout46; 
    Din47 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"02f" and MEMrq ='1' and RnW='1') else 
        Dout47; 
    Din48 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"030" and MEMrq ='1' and RnW='1') else 
        Dout48; 
    Din49 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"031" and MEMrq ='1' and RnW='1') else 
        Dout49; 
    Din50 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"032" and MEMrq ='1' and RnW='1') else 
        Dout50; 
    Din51 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"033" and MEMrq ='1' and RnW='1') else 
        Dout51; 
    Din52 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"034" and MEMrq ='1' and RnW='1') else 
        Dout52; 
    Din53 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"035" and MEMrq ='1' and RnW='1') else 
        Dout53; 
    Din54 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"036" and MEMrq ='1' and RnW='1') else 
        Dout54; 
    Din55 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"037" and MEMrq ='1' and RnW='1') else 
        Dout55; 
    Din56 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"038" and MEMrq ='1' and RnW='1') else 
        Dout56; 
    Din57 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"039" and MEMrq ='1' and RnW='1') else 
        Dout57; 
    Din58 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03a" and MEMrq ='1' and RnW='1') else 
        Dout58; 
    Din59 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03b" and MEMrq ='1' and RnW='1') else 
        Dout59; 
    Din60 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03c" and MEMrq ='1' and RnW='1') else 
        Dout60; 
    Din61 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03d" and MEMrq ='1' and RnW='1') else 
        Dout61; 
    Din62 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03e" and MEMrq ='1' and RnW='1') else 
        Dout62; 
    Din63 <=  "0000000000000000" when (Rst='1') else     -- Data Memory Area 
        DataIn when(Address= x"03f" and MEMrq ='1' and RnW='1') else
		Dout63; 

    D1 : d_ff16 port map (Clk,zV,Din0,Dout0); 
    D2 : d_ff16 port map (Clk,zV,Din1,Dout1);
    D3 : d_ff16 port map (Clk,zV,Din2,Dout2); 
    D4 : d_ff16 port map (Clk,zV,Din3,Dout3); 
    D5 : d_ff16 port map (Clk,zV,Din4,Dout4); 
    D6 : d_ff16 port map (Clk,zV,Din5,Dout5); 
    D7 : d_ff16 port map (Clk,zV,Din6,Dout6); 
    D8 : d_ff16 port map (Clk,zV,Din7,Dout7); 
    D9 : d_ff16 port map (Clk,zV,Din8,Dout8); 
    D10 : d_ff16 port map (Clk,zV,Din9,Dout9); 
    D11 : d_ff16 port map (Clk,zV,Din10,Dout10); 
    D12 : d_ff16 port map (Clk,zV,Din11,Dout11); 
    D13 : d_ff16 port map (Clk,zV,Din12,Dout12); 
    D14 : d_ff16 port map (Clk,zV,Din13,Dout13); 
    D15 : d_ff16 port map (Clk,zV,Din14,Dout14); 
    D16 : d_ff16 port map (Clk,zV,Din15,Dout15); 
    D17 : d_ff16 port map (Clk,zV,Din16,Dout16); 
    D18 : d_ff16 port map (Clk,zV,Din17,Dout17); 
    D19 : d_ff16 port map (Clk,zV,Din18,Dout18); 
    D20 : d_ff16 port map (Clk,zV,Din19,Dout19); 
    D21 : d_ff16 port map (Clk,zV,Din20,Dout20); 
    D22 : d_ff16 port map (Clk,zV,Din21,Dout21); 
    D23 : d_ff16 port map (Clk,zV,Din22,Dout22); 
    D24 : d_ff16 port map (Clk,zV,Din23,Dout23); 
    D25 : d_ff16 port map (Clk,zV,Din24,Dout24); 
    D26 : d_ff16 port map (Clk,zV,Din25,Dout25); 
    D27 : d_ff16 port map (Clk,zV,Din26,Dout26); 
    D28 : d_ff16 port map (Clk,zV,Din27,Dout27); 
    D29 : d_ff16 port map (Clk,zV,Din28,Dout28); 
    D30 : d_ff16 port map (Clk,zV,Din29,Dout29); 
    D31 : d_ff16 port map (Clk,zV,Din30,Dout30); 
    D32 : d_ff16 port map (Clk,zV,Din31,Dout31); 
    D33 : d_ff16 port map (Clk,zV,Din32,Dout32); 
    D34 : d_ff16 port map (Clk,zV,Din33,Dout33); 
    D35 : d_ff16 port map (Clk,zV,Din34,Dout34); 
    D36 : d_ff16 port map (Clk,zV,Din35,Dout35); 
    D37 : d_ff16 port map (Clk,zV,Din36,Dout36); 
    D38 : d_ff16 port map (Clk,zV,Din37,Dout37); 
    D39 : d_ff16 port map (Clk,zV,Din38,Dout38); 
    D40 : d_ff16 port map (Clk,zV,Din39,Dout39); 
    D41 : d_ff16 port map (Clk,zV,Din40,Dout40); 
    D42 : d_ff16 port map (Clk,zV,Din41,Dout41); 
    D43 : d_ff16 port map (Clk,zV,Din42,Dout42); 
    D44 : d_ff16 port map (Clk,zV,Din43,Dout43); 
    D45 : d_ff16 port map (Clk,zV,Din44,Dout44); 
    D46 : d_ff16 port map (Clk,zV,Din45,Dout45); 
    D47 : d_ff16 port map (Clk,zV,Din46,Dout46); 
    D48 : d_ff16 port map (Clk,zV,Din47,Dout47); 
    D49 : d_ff16 port map (Clk,zV,Din48,Dout48); 
    D50 : d_ff16 port map (Clk,zV,Din49,Dout49); 
    D51 : d_ff16 port map (Clk,zV,Din50,Dout50); 
    D52 : d_ff16 port map (Clk,zV,Din51,Dout51); 
    D53 : d_ff16 port map (Clk,zV,Din52,Dout52); 
    D54 : d_ff16 port map (Clk,zV,Din53,Dout53); 
    D55 : d_ff16 port map (Clk,zV,Din54,Dout54); 
    D56 : d_ff16 port map (Clk,zV,Din55,Dout55); 
    D57 : d_ff16 port map (Clk,zV,Din56,Dout56); 
    D58 : d_ff16 port map (Clk,zV,Din57,Dout57); 
    D59 : d_ff16 port map (Clk,zV,Din58,Dout58); 
    D60 : d_ff16 port map (Clk,zV,Din59,Dout59); 
    D61 : d_ff16 port map (Clk,zV,Din60,Dout60); 
    D62 : d_ff16 port map (Clk,zV,Din61,Dout61); 
    D63 : d_ff16 port map (Clk,zV,Din62,Dout62); 
    D64 : d_ff16 port map (Clk,zV,Din63,Dout63); 

    DataOuts <= Dout0 when ( Address= x"000" ) else
				Dout1 when ( Address= x"001" ) else 
              	Dout2 when ( Address= x"002" ) else 
              	Dout3 when ( Address= x"003" ) else 
              	Dout4 when ( Address= x"004" ) else 
              	Dout5 when ( Address= x"005" ) else 
              	Dout6 when ( Address= x"006" ) else 
              	Dout7 when ( Address= x"007" ) else 
              	Dout8 when ( Address= x"008" ) else 
              	Dout9 when ( Address= x"009" ) else 
              	Dout10 when ( Address= x"00a" ) else 
              	Dout11 when ( Address= x"00b" ) else 
              	Dout12 when ( Address= x"00c" ) else 
              	Dout13 when ( Address= x"00d" ) else 
              	Dout14 when ( Address= x"00e" ) else 
              	Dout15 when ( Address= x"00f" ) else 
              	Dout16 when ( Address= x"010" ) else 
              	Dout17 when ( Address= x"011" ) else 
              	Dout18 when ( Address= x"012" ) else 
              	Dout19 when ( Address= x"013" ) else 
              	Dout20 when ( Address= x"014" ) else 
              	Dout21 when ( Address= x"015" ) else 
              	Dout22 when ( Address= x"016" ) else 
              	Dout23 when ( Address= x"017" ) else 
              	Dout24 when ( Address= x"018" ) else 
              	Dout25 when ( Address= x"019" ) else 
              	Dout26 when ( Address= x"01a" ) else 
              	Dout27 when ( Address= x"01b" ) else 
              	Dout28 when ( Address= x"01c" ) else 
              	Dout29 when ( Address= x"01d" ) else 
              	Dout30 when ( Address= x"01e" ) else 
              	Dout31 when ( Address= x"01f" ) else 
              	Dout32 when ( Address= x"020" ) else 
              	Dout33 when ( Address= x"021" ) else 
              	Dout34 when ( Address= x"022" ) else 
              	Dout35 when ( Address= x"023" ) else 
              	Dout36 when ( Address= x"024" ) else 
              	Dout37 when ( Address= x"025" ) else 
              	Dout38 when ( Address= x"026" ) else 
              	Dout39 when ( Address= x"027" ) else 
              	Dout40 when ( Address= x"028" ) else 
              	Dout41 when ( Address= x"029" ) else 
              	Dout42 when ( Address= x"02a" ) else 
              	Dout43 when ( Address= x"02b" ) else 
              	Dout44 when ( Address= x"02c" ) else 
              	Dout45 when ( Address= x"02d" ) else 
              	Dout46 when ( Address= x"02e" ) else 
              	Dout47 when ( Address= x"02f" ) else 
              	Dout48 when ( Address= x"030" ) else 
              	Dout49 when ( Address= x"031" ) else 
              	Dout50 when ( Address= x"032" ) else 
              	Dout51 when ( Address= x"033" ) else 
              	Dout52 when ( Address= x"034" ) else 
              	Dout53 when ( Address= x"035" ) else 
              	Dout54 when ( Address= x"036" ) else 
              	Dout55 when ( Address= x"037" ) else 
              	Dout56 when ( Address= x"038" ) else 
              	Dout57 when ( Address= x"039" ) else 
              	Dout58 when ( Address= x"03a" ) else 
              	Dout59 when ( Address= x"03b" ) else 
              	Dout60 when ( Address= x"03c" ) else 
              	Dout61 when ( Address= x"03d" ) else 
              	Dout62 when ( Address= x"03e" ) else 
              	Dout63 when ( Address= x"03f" );
		
	DataOut <= "0000000000000000" when (Rst = '1') else 
            DataOutS when (MEMrq ='1' and RnW='0') else 
            DataIn; 
end sample;


