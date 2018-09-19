-- Library's used by this design
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity tb_comp is

end tb_comp;

-- Architecture Body
architecture behavior of tb_comp is

component comp_circuit 

port (
    seg_in             : in std_logic_vector(2 downto 0);
	seven_seg		: out std_logic_vector(6 downto 0)
   	);
	
end component;

signal seg_out		: std_logic_vector(6 downto 0);
signal seg_in       : std_logic_vector(2 downto 0);

begin  
	
	uut:comp_circuit port map(
	
	seven_seg => seg_out,
	seg_in => seg_in );
	
	
	stim_proc : process
	
	begin
	    
	seg_in <= "001" ;
    wait for 100 ns ;
	seg_in <= "010"; 
    wait for 100 ns ;
	seg_in <= "100" ;
    wait for 100 ns ;	
	end process;			
end behavior;
	