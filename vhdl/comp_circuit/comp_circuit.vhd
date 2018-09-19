-- Library's used by this design
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity comp_circuit is
port (
	seven_seg		: out std_logic_vector(6 downto 0);
    seg_in             : in std_logic_vector(2 downto 0)	);
end comp_circuit;

-- Architecture Body
architecture behavior of comp_circuit is

--			   0
--			 -----
--			|	  |
--		  5 |     | 1
--			|  6  |
--			 -----
--			|	  |
--		  4 |     | 2
--			|	  |
--			 -----
--			   3
 
-- Signal used to hold 7 segment display value
signal seg_out 		: std_logic_vector(6 downto 0);
begin  
	--  7 Segment displays are active Low
	-- So we invert the output
	seven_seg <= not seg_out;
	
	seg_proc : process(seg_in)
	
	begin
	    
		case seg_in is
		    when "001" => seg_out <= "0111101" ; --G
			when "010" => seg_out <= "1111001" ; --E
			when "100" => seg_out <= "1101101" ; --S
	        when others =>
				seg_out <= (others => 'X');
		end case;
	end process seg_proc;			
end behavior;
	
			
