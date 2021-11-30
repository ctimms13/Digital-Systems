library ieee;
    
use ieee.std_logic_1164.all;

entity top_level is
port (
    SI : in std_logic; -- SERIAL DATA INPUT
    clk : in std_logic; -- CLOCK
    reset : in std_logic; -- RESET
    D : out std_logic_vector (7 downto 0); -- PARALLEL DATA OUTPUT
    drdy : out std_logic); -- DATA READY FLAG
end top_level;

architecture top_level_arch of top_level is

--ENTER SHIFT AND CNT8 COMPONENT DECLARATIONS HERE
component COUNTER
  port (M : in std_logic_vector (1 downto 0)); -- RESET
        clk : in std_logic; -- CLOCK
        Q : out std_logic_vector(7 downto 0); -- CLK SIGNAL COUNT
      );
end component;

component SHIFTER 
  port(Din : in std_logic; -- INPUT
      Dirup : in std_logic; -- SHIFT DIRECTION
      En : in std_logic; -- ENABLE SIGNAL
      clk : in std_logic; -- CLK 
      Y : out std_logic_vector(7 downto 0);
    );
end component;
        
-- START COMPONENT :CONTROL FSM
component CONTROL
    port (CLK : in std_logic; -- CLOCK
          Q : in std_logic_vector(7 downto 3); -- COUNTER VALUE
          RESET : in std_logic; -- RESET
          SI : in std_logic; -- SERIAL DATA INPUT
          CLR : out std_logic; -- CLEAR COUNTERS/REGSITERS ETC
          DRDY : out std_logic; -- DATA READY FLAG
          ENSR : out std_logic -- ENABLE SHIFT
          );
end component;

--SIGNALS
signal Q : std_logic_vector (7 downto 0);
signal CLEAR,ENSR : std_logic;

begin

--ENTER SHIFTER AND COUNTER PORT MAPPINGS HERE
Shifter : shifter
port map(
      Din => SI, -- INPUT
      Dirup => 0, -- SHIFT DIRECTION
      En => ENSR, -- ENABLE SIGNAL
      clk => clk,
      Y => D
   );
   
Counter : counter 
port map(
      M => M,
      clk => clk, 
      Q => Q(7 downto 0)
    );

-- INSTANTIATE CONTROLLER AS TYPE CONTROL
Controller : control
port map(
   clk => clk,
   q => q(7 downto 3),
   reset => reset,
   SI => SI,
   clr => CLEAR,
   drdy => drdy,
   ensr => ENSR
   );
      
end top_level_arch;