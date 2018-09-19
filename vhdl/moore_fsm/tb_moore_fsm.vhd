library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all;
use IEEE.numeric_std.all;

entity tb_moore_fsm is
end entity;


architecture behavioral of tb_moore_fsm is

component moore_fsm is

port(
    clk  : in std_logic;
	reset :in std_logic;
	input : in std_logic;
	op_detected : out std_logic ); 
	 
end component;

signal clk,reset,input : std_logic := '0';
signal op_detected : std_logic;

begin 

    uut : moore_fsm port map (
	
	    clk => clk,
		reset => reset ,
		input => input ,
		op_detected => op_detected );
		
	clock_process : process
    begin
    clk <= '1';
    wait for 100 ns;
    end process;


    stim_process : process
    begin         wait for 40 ns;

        input <= '0';
        reset <= '1';

        wait for 10 ns;
    
    reset <= '0' ;
        
        input <= '1';
        wait for 20 ns;
        input <= '1';
        wait for 30 ns;	
        input <= '0';
        wait for 40 ns;

    end process;

end behavioral;	