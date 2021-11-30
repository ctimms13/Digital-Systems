library ieee;
    
use ieee.std_logic_1164.all;

entity tb_shift is end;

architecture tb_shift_arch of tb_shift is

component shift
    port (
        din : in std_logic;
        en : in std_logic;
        clk : in std_logic;
        y : out std_logic_vector(7 downto 0)
        );
end component;

signal din,en,clk : std_logic;
signal y : std_logic_vector (7 downto 0);

begin

uut : shift
port map (
    din => din,
    en => en,
    clk => clk,
    y =>y);

-- PROCESS : CLOCK WITH 100ns TIME PERIOD    
clock : process
begin
    clk<='1';
    wait for 50 ns;
    clk<='0';
    wait for 50 ns;
end process;

-- PROCESS : DATA INPUT AND ENABLE
-- ("01101000001010101001010111101")
data : process
begin
    en<='1';
    din<='0';
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

end tb_shift_arch;
