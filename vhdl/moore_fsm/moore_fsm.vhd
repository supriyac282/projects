library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;


entity moore_fsm is

    port( 
	    clk  : in std_logic;
		reset :in std_logic;
		input : in std_logic;
		op_detected : out std_logic );
		
end entity;

architecture behavioral of moore_fsm is 

type fsm is (ini_state , state_1 , state_11 , state_110);

signal present_state , next_state : fsm ;

begin 

clk_reset_process : process(clk,reset)

begin 

    if(reset = '1' ) then
	
	    present_state <= ini_state ;  -- continues to stay in present state (initial state)
		
	elsif( rising_edge(clk) ) then
        
        present_state <= next_state ; -- all sequence inputs are forwarded in clock edges 

	end if;

end process ;


sequence_input : process(present_state,input) -- since the moore system depends on present state and input value

begin 

    case present_state is
	when ini_state =>
        if(input = '1') then  -- "1"
		    
            next_state <= state_1;
       			
		else      -- "0"
            
            next_state <= ini_state;
		end if;	

    when state_1 =>          
	    if(input = '1') then  -- "11"
		    
			next_state <= state_11;
			
		else   -- "10"
		   
		    next_state <= ini_state;
		end if;	
	
    when state_11 =>
        
        if(input ='0') then  -- "110"

            next_state <= state_110;

        else   -- "111"
             
            next_state <= state_11;
		end if;	

    when state_110 =>
        
        if(input ='1') then -- " sequence starts again from 1 "
		
		    next_state <= state_1;
			
		else  -- " back to inital state "

            next_state <= ini_state;
		end if;
    end case;

end process;


detection_process : process(present_state)

begin 

    case present_state is
	when ini_state =>
     	op_detected <= '0' ;
    when state_1 =>
		op_detected <= '0' ;
	when state_11 =>
		op_detected <= '0' ;
	when state_110 =>
		op_detected <= '1' ;
    end case;

end process;

end behavioral ;	


    			
        		
			
			

        	