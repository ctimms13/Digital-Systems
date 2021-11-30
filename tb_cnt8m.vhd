library ieee;
    
use ieee.std_logic_1164.all;

entity tb_cnt8m is end;

architecture tb_cnt8m_arch of tb_cnt8m is

component cnt8m
    Port ( clk : in std_logic; -- CLOCK 
           M : in std_logic_vector (1 downto 0); -- MODE
           q : out std_logic_vector(7 downto 0)); -- COUNTER OUTPUT
end component;

signal clk : std_logic;
signal M : std_logic_vector (1 downto 0);
signal q : std_logic_vector (7 downto 0);

begin

uut : cnt8m
port map (
    clk => clk,
    M => M,
    q => q);

--PROCESS : CLOCK WITH 100 ns TIME PERIOD
clock :process
begin
    clk<='1';
    wait for 50 ns;
    clk<='0';
    wait for 50 ns;
end process;

-- PROCESS: MODE SELECTION
mode : process
begin
    M<="11";
    wait for 200 ns;
    M<="01";
    wait for 800 ns;
    M<="00";
    wait for 200 ns;
    M<="10";
    wait for 600 ns;
    M <="01";
    wait for 600 ns;
    M<= "00";
    wait for 200 ns;
    M<= "10";
    wait for 400 ns;
end process;

end tb_cnt8m_arch;
