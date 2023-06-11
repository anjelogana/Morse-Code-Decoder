library ieee;
use ieee.std_logic_1164.all;

entity BinToSeg is
    port(
        i_Clk : in std_logic;
        i_Binary_Num : in std_logic_vector(7 downto 0);
        o_Segment_A : out std_logic;
        o_Segment_B : out std_logic;
        o_Segment_C : out std_logic;
        o_Segment_D : out std_logic;
        o_Segment_E : out std_logic;
        o_Segment_F : out std_logic;
        o_Segment_G : out std_logic);
        
end entity BinToSeg;
        
architecture RTL of BinToSeg is
    
    signal r_Hex_Encoding : std_logic_vector(7 downto 0) := (others => '0');
    
begin
    process (i_Clk) is
    begin
        if rising_edge(i_Clk) then
            case i_Binary_Num is
                when "00000000" =>
                    r_Hex_Encoding <= "00000000"; 
                   
                when "00001011" =>
                    r_Hex_Encoding <= "01110111"; --A
                when "11101010" =>
                    r_Hex_Encoding <= "00011111"; --B
                when "11101110" =>
                    r_Hex_Encoding <= "01001110"; --C    
                when "00111010" =>
                    r_Hex_Encoding <= "01111100"; --D
                when "00000010" =>
                    r_Hex_Encoding <= "01001111"; --E
                when "10101110" =>
                    r_Hex_Encoding <= "01000111"; --F
                when "00111110" =>
                    r_Hex_Encoding <= "01011110"; --G
                when "10101010" =>
                    r_Hex_Encoding <= "00110111"; --H
                when "00001010" =>
                    r_Hex_Encoding <= "00000110"; --I
                when "10111111" =>
                    r_Hex_Encoding <= "00111000"; --J
                when "00111011" =>
                    r_Hex_Encoding <= "01010111"; --K
                when "10111010" =>
                    r_Hex_Encoding <= "00001110"; --L
                when "00001111" =>
                    r_Hex_Encoding <= "01010101"; --M
                when "00001110" =>
                    r_Hex_Encoding <= "00010101"; --N
                when "00111111" =>
                    r_Hex_Encoding <= "01111110"; --O
                when "10111110" =>
                    r_Hex_Encoding <= "01100111"; --P 
                when "11111011" =>
                    r_Hex_Encoding <= "01110011"; --Q
                when "00101110" =>
                    r_Hex_Encoding <= "00000101"; --R
                when "00101010" =>
                    r_Hex_Encoding <= "01011011"; --S
                when "00000011" => 
                    r_Hex_Encoding <= "00001111"; --T
                when "00101011" =>
                    r_Hex_Encoding <= "00011100"; --U
                when "10101011" =>
                    r_Hex_Encoding <= "00011000"; --V
                when "00101111" =>
                    r_Hex_Encoding <= "01011100"; --W
                when "11101011" =>
                    r_Hex_Encoding <= "01001001"; --X
                when "11101111" =>
                    r_Hex_Encoding <= "00111011"; --Y
                when "11111010" =>
                    r_Hex_Encoding <= "01101101"; --Z
                
                
            end case;
        end if;
    end process;
    
    o_Segment_A <= r_Hex_Encoding(6);
    o_Segment_B <= r_Hex_Encoding(5);
    o_Segment_C <= r_Hex_Encoding(4);
    o_Segment_D <= r_Hex_Encoding(3);
    o_Segment_E <= r_Hex_Encoding(2);
    o_Segment_F <= r_Hex_Encoding(1);
    o_Segment_G <= r_Hex_Encoding(0);
    
end architecture RTL;
