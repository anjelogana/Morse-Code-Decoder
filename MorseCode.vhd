library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity MorseCode is
  port (

    i_Clk         : in std_logic;
     

    i_Switch_1    : in std_logic;
    i_Switch_2    : in std_logic;
    i_Switch_3    : in std_logic;
    
    o_LED_3       : out std_logic;
    o_LED_4       : out std_logic;
     

    o_Segment1_A  : out std_logic;
    o_Segment1_B  : out std_logic;
    o_Segment1_C  : out std_logic;
    o_Segment1_D  : out std_logic;
    o_Segment1_E  : out std_logic;
    o_Segment1_F  : out std_logic;
    o_Segment1_G  : out std_logic);
end entity MorseCode;
 
architecture RTL of MorseCode is
 
  signal w_Switch_1 : std_logic;
  signal w_Switch_2 : std_logic;
  signal w_Switch_3 : std_logic;
  signal r_Switch_1 : std_logic := '0';
  signal r_Switch_2 : std_logic := '0';
  signal r_Switch_3 : std_logic := '0';
  
  signal r_LED_3    : std_logic := '0';
  signal r_LED_4    : std_logic := '0';
  

  
  signal r_CycleCount : integer range 0 to 3125000 := 0;
  constant c_OneSec   : integer := 3125000;
  
  signal r_Five       : std_logic_vector (7 downto 0) := (others => '0');
  signal r_LCount     : std_logic_vector (7 downto 0) := (others => '0');
  signal w_Segment1_A : std_logic;
  signal w_Segment1_B : std_logic;
  signal w_Segment1_C : std_logic;
  signal w_Segment1_D : std_logic;
  signal w_Segment1_E : std_logic;
  signal w_Segment1_F : std_logic;
  signal w_Segment1_G : std_logic;
  
  

 
begin
 
  -- Instantiate Debounce Filter
  Debounce_Inst1 : entity work.DebounceSwitch
    port map (
      i_Clk    => i_Clk,
      i_Switch => i_Switch_1,
      o_Switch => w_Switch_1);
      
  Debounce_Inst2 : entity work.DebounceSwitch
    port map (
      i_Clk    => i_Clk,
      i_Switch => i_Switch_2,
      o_Switch => w_Switch_2);
      
  Debounce_Inst3 : entity work.DebounceSwitch
    port map (
      i_Clk    => i_Clk,
      i_Switch => i_Switch_3,
      o_Switch => w_Switch_3);
       

  p_Switch_Count : process (i_Clk)
  begin
    if rising_edge(i_Clk) then
      r_Switch_1 <= w_Switch_1;
      r_Switch_2 <= w_Switch_2;
      r_Switch_3 <= w_Switch_3;
       

      if (w_Switch_1 = '1') then
        if (r_CycleCount < c_OneSec) then
            r_CycleCount <= r_CycleCount + 1;
        end if;
        
        if (r_CycleCount >= c_OneSec) then

            r_LED_4 <= not r_LED_4;
        
        elsif (r_CycleCount < c_OneSec and r_CycleCount > 50000) then
            r_LED_3 <= not r_LED_3;
            
        end if;
        
     else 
        if (r_CycleCount >= c_OneSec) then
            
            r_Five <= r_Five(5 downto 0) & "11"; 
            
            
        elsif (r_CycleCount < c_OneSec and r_CycleCount > 50000) then
        
            r_Five <= r_Five(5 downto 0) & "10";
            
            
            
        end if;
  
        r_CycleCount <= 0;
        r_LED_3 <= '0';
        r_LED_4 <= '0';
        
      end if;  
      
      if (w_Switch_2 = '1') then
        r_LCount <= r_Five;
      end if;
      
      if (w_Switch_3 = '1') then
        r_Five   <= "00000000";
        r_LCount <= "00000000";
        
      end if;
      
    end if; 
  end process p_Switch_Count;
  o_LED_3 <= r_LED_3;  
  o_LED_4 <= r_LED_4;

          
      SevenSeg1_Inst : entity work.BinToSeg 
      port map ( 
      i_Clk => i_Clk,
      i_Binary_Num => r_LCount,
      o_Segment_A  => w_Segment1_A,
      o_Segment_B  => w_Segment1_B,
      o_Segment_C  => w_Segment1_C,
      o_Segment_D  => w_Segment1_D,
      o_Segment_E  => w_Segment1_E,
      o_Segment_F  => w_Segment1_F,
      o_Segment_G  => w_Segment1_G
      );
   
  o_Segment1_A <= not w_Segment1_A;
  o_Segment1_B <= not w_Segment1_B;
  o_Segment1_C <= not w_Segment1_C;
  o_Segment1_D <= not w_Segment1_D;
  o_Segment1_E <= not w_Segment1_E;
  o_Segment1_F <= not w_Segment1_F;
  o_Segment1_G <= not w_Segment1_G;
  

   
end architecture RTL;