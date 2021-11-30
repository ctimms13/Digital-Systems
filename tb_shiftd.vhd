library ieee;
    
use ieee.std_logic_1164.all;

entity tb_shiftd is end;

architecture tb_shiftd_arch of tb_shiftd is

component shiftd
    port (
        din : in std_logic;
        en : in std_logic;
        clk : in std_logic;
        y : out std_logic_vector(7 downto 0);
        dirup : in std_logic
        );
end component;

signal din,en,clk,dirup : std_logic;
signal y : std_logic_vector (7 downto 0);

begin

uut : shiftd
port map (
    din => din,
    en => en,
    clk => clk,
    y =>y,
    dirup => dirup
    );

-- PROCESS : CLOCK WITH 100ns TIME PERIOD     
clock : process
begin
    clk<='1';
    wait for 50 ns;
    clk<='0';
    wait for 50 ns;
end process;

-- PROCESS : DATA INPUT,ENABLE AND DIRECTION
-- SHIFT DOWN ("011010000010101")
-- SHIFT UP ("01001010111101")
data : process
begin
    en<='1';
    din<='0';
    dirup<='0';
    wait for 100 ns;
    din<='1';
    wait for 200 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 500 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    dirup<='1';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 200 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 400 ns;
    din<='0';
    wait for 100 ns;
    din<='1';
    wait for 100 ns;
    
end process;

end tb_shiftd_arch;
