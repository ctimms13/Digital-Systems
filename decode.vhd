library ieee;

use ieee.std_logic_1164.all;

entity decode8 is
    port (
        A : in std_logic_vector (2 downto 0); -- 3 bit encoded signal
        Y : out std_logic_vector (7 downto 0)); -- 8 bit 1 hot decoded signal
end decode8;

architecture decode8_arch of decode8 is

begin

y<= "00000001" when A="000" else -- SET BIT 0 HIGH WHEN ENCODED WITH 0
    "00000010" when A="001" else -- SET BIT 1 HIGH WHEN ENCODED WITH 1
    "00000100" when A="010" else --
    "00001000" when A="011" else --
    "00010000" when A="100" else --
    "00100000" when A="101" else --
    "01000000" when A="110" else --
    "10000000" when A="111" else --
    --INSERT OTHER CONDITIONS HERE	
    "00000000";                  -- OTHERWISE SET ALL BITS LOW
      
end decode8_arch;
