library ieee;
    
use ieee.std_logic_1164.all;

entity tally is
    port (
        A : in std_logic_vector (3 downto 0); -- 4 BIT BINARY INPUT
        Y : out std_logic_vector (4 downto 0)); -- 5 BIT TALLY OUTPUT
end tally;

architecture tally_arch of tally is

begin

Y<= "00001" when A="0000" else -- SET BIT 0 WHEN ALL BITS IN A ARE LOW
    "00010" when (A="0001" or A="0010" or A="0100" or A="1000") else --SET BIT 1 WHEN ONLY 1 BIT OF A IS SET
    --Complete this construction using the when-else syntax
    "11111"; --leave this line in.  It will act as a check that you have covered all possible cases.
end tally_arch;

