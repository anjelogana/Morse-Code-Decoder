library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DebounceSwitch is
    port(
    
        i_Clk       : in std_logic;
        i_Switch    : in std_logic;
        o_Switch    : out std_logic);
        
end entity DebounceSwitch;

architecture RTL of DebounceSwitch is
    
    --10 ms at 25Mhz.
    constant c_DEBOUNCE_LIMIT   : integer := 250000;
    signal r_State : std_logic := '0'; 
    signal r_Count : integer range 0 to c_DEBOUNCE_LIMIT := 0;
begin
    process (i_Clk) is
    begin
        if rising_edge (i_Clk) then
            if (i_Switch /= r_State and r_Count < c_DEBOUNCE_LIMIT) then
                r_Count <= r_Count + 1;
            elsif r_Count = c_DEBOUNCE_LIMIT then
                r_State <= i_Switch;
                r_Count <= 0;
            else
                r_Count<= 0;
            end if;
        end if;
    end process;
    
    o_Switch <= r_State;
end architecture RTL;

