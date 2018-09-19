library IEEE;
use IEEE.STD_LOGIC_1164.ALL ;
use IEEE.STD_LOGIC_ARITH.ALL ;
use IEEE.STD_LOGIC_UNSIGNED.ALL ;
 
-- entity declaration 
entity tb_comp_circuit_top is
end entity;

architecture behavior of tb_comp_circuit_top is

component comp_circuit_top
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
		
end component;

signal in_a , in_b : std_logic_vector(3 downto 0);		
signal temp   : std_logic_vector(2 downto 0);
signal seg_out      : std_logic_vector(6 downto 0) ;
signal clk          : std_logic ;
signal reset          : std_logic ;


begin 

    uut:comp_circuit_top port map(

        in_a => in_a,
        in_b => in_b,
        seg_out => seg_out,
		clk => clk,
		reset => reset,
		op => temp
		 );
		
    clock_process :process
    begin
	
     clk <= '1';
     wait for 10 ns;
     clk <= '0';
     wait for 10 ns;
    end process;		
		
    stim_process : process

    begin
    
    
	reset <= '1';
    in_a <= "1000" ;
    in_b <= "1000";
    wait for 100 ns;
    
    reset <= '0';
    in_a <= "1000" ;
    in_b <= "1001";
    wait for 100 ns;
    
    reset <= '0';
    in_a <= "1001";
    in_b <= "1000";
    wait for 100 ns;	

	end process;

end behavior;



	


