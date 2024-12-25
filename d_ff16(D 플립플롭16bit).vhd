library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 

entity d_ff16 is 
    port(
		Clk,Rst : in std_logic; 
        Din :in std_logic_vector(15 downto 0); 
        Dout : out std_logic_vector(15 downto 0)
		); 
end d_ff16; 

architecture sample of d_ff16 is 

begin 
    process(Rst,Clk) 
    begin 
        if (Rst = '1') then 					--reset이면 Dout 초기화
            Dout <= "0000000000000000"; 
        else 
            if (Clk'event and Clk = '1') then 	--rising edge 일�
                Dout<= Din; 					--입력이 load
            end if; 
        end if; 
    end process; 
end sample; 
