library ieee;
    
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_tally is end;

architecture tb_tally_arch of tb_tally is

component tally
    port (
        A : in std_logic_vector (3 downto 0);
        Y : out std_logic_vector (4 downto 0));
end component;
    
signal A : std_logic_vector (3 downto 0);
signal Y : std_logic_vector (4 downto 0);

begin

dut : component tally
   port map (
       A=>A,
       Y=>Y);

-- PROCESS : CHECK EVERY POSSIBLE INPUT COMBINATION
test : process
begin
A<="0000";
wait for 100 ns;
for i in 0 to 15 loop
   A<=A+1;
   wait for 100 ns;
end loop;
end process;
    
end tb_tally_arch;