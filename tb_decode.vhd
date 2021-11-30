library ieee;
    
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity tb_decode is end;

architecture tb_decode_arch of tb_decode is

component decode8
   port (
        A : in std_logic_vector (2 downto 0);
        Y : out std_logic_vector (7 downto 0));
end component;

signal A : std_logic_vector (2 downto 0);
signal Y : std_logic_vector (7 downto 0);

begin

dut: component decode8
port map (
    A=>A,
    Y=>Y);

-- PROCESS :COUNT THROUGH ENCODED SIGNAL FROM 0 TO 7    
test :process
begin
A<="000";
for i in 0 to 7 loop
   wait for 100 ns;
   A<=A+1;
end loop;
wait for 100 ns;
end process;
end tb_decode_arch;
