library ieee;

use ieee.std_logic_1164.all;

entity shift is
    port (
        din : in std_logic; -- DATA IN
        en : in std_logic; -- CHIP ENABLE
        clk : in std_logic; -- CLOCK
        y : out std_logic_vector(7 downto 0) -- SHIFTER OUTPUT
        );
end shift;

architecture shift_arch of shift is
    
--SIGNALS
signal s_register : std_logic_vector (7 downto 0); -- REGISTER CONTENTS
 
begin

--PROCESS : SHIFT
shift : process (clk)
begin
    if rising_edge(clk) and en='1' then -- FULLY SYNCHRONOUS AND ENABLED
       for i in 7 downto 1 loop 
          s_register(i) <= s_register(i-1); -- SHIFT ALL BITS UP 1
       end loop;
       s_register(0) <= din;  -- INSERT DATA BIT IN LSB
    else null;
    end if;
end process;
y <= s_register; -- WRITE REGISTER CONTENTS TO OUTPUT
end shift_arch;


