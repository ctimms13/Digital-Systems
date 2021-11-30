library ieee;

use ieee.std_logic_1164.all;

entity control is
    port (CLK : in std_logic; -- CLOCK
          Q : in std_logic_vector(7 downto 3); -- COUNTER VALUE
          RESET : in std_logic; -- RESET
          SI : in std_logic; -- SERIAL DATA INPUT
          CLR : out std_logic; -- CLEAR COUNTERS/REGSITERS ETC
          DRDY : out std_logic; -- DATA READY FLAG
          ENSR : out std_logic -- ENABLE SHIFT
          );
end control;

architecture control_arch of control is

type state_type is(s0,s1,s2,s3,s4,s5); --Definition of custom type to hold states.  You may add or remove states here.

signal next_state,current_state :state_type  ; -- Signal declaration of state vectors

begin

control : process(current_state,si,q) --process for combinatorial logic

--Declaration of Variables
variable v_state :state_type;
variable v_clr,v_drdy,v_ensr : std_logic;

begin
--YOU SHOULD INITIALISE YOUR VARIABLES HERE
v_state:=current_state;
case v_state is
    
    when s0 =>
        --ENTER CODE FOR STATE S0
    
    when s1 =>
        --ENTER CODE FOR STATE S1        
        
    when s2 =>
        --ENTER CODE FOR STATE S2
        
    when s3 =>
        --ENTER CODE FOR STATE S3
                
    when s4 =>
        --ENTER CODE FOR STATE S4
                
    when s5 =>
        --ENTER CODE FOR STATE S5
	 
    when others => --ENTER DEFAULT CODE FOR OTHER EVENTUALITIES    

    end case;

--ASSIGN VARIABLES TO SIGNALS
next_state<=v_state;      
end process;

registers :process(clk,reset) --process for registers

begin
    --ENTER CODE TO COPY NEW STATE TO REGISTER ON RISING CLOCK EDGE
    --AND RESET STATE TO s0 ON ASYNC RESET
end process;

end control_arch;