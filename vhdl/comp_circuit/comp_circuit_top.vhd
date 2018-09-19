
library IEEE;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.STD_LOGIC_ARITH.ALL ;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;
 
-- entity declaration 
entity comp_circuit_top is
    port(
	    in_a, in_b : in std_logic_vector( 3 downto 0);
      	op         : inout std_logic_vector(2 downto 0) ;
		seg_out      : out std_logic_vector(6 downto 0) ;
		clk          : in std_logic ;
		reset        : in std_logic;
		enable0		: out std_logic ;
	    enable1		: out std_logic ;
	    enable2		: out std_logic ;
	    enable3		: out std_logic );
end comp_circuit_top;
 
architecture behavioral of comp_circuit_top is

component comp_circuit 
port(  
        seven_seg		: out std_logic_vector(6 downto 0);
        seg_in             : in std_logic_vector(2 downto 0) );
		
end component ;

signal Seg_0	: std_logic_vector(6 downto 0);
signal temp     : std_logic_vector(2 downto 0);
		
begin
      
	comp_process : process(clk,in_a,in_b)
	begin
	     
		if (rising_edge(clk)) then 
		
		    if( reset = '1' ) then 
			    
				temp <= "000";
			else 	
	
                if(in_a > in_b) then
					temp <= "100";
					
                elsif(in_a = in_b ) then
					temp <= "010";
					
				elsif(in_a < in_b) then	
                    temp <= "001" ;
					
				end if;					
	      
	        end if;
		end if;
	end process comp_process;	
        
	op <= temp;
	
	seg0 : comp_circuit
			port map (seven_seg => Seg_0, seg_in => op);
			
			
	enable0 <= '0'; 
	enable1 <= '1'; 
	enable2 <= '1';
	enable3 <= '1';	
	
	seg_out <= Seg_0 ;
	
end behavioral;
 

