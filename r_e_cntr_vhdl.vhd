-- Author: Phillip Salowe and Alex Pippin
-- This code is a rising edge counter for a 50Mhz
-- Last editted: 3/30/2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity r_e_cntr_vhdl is
  port (
    inp    : in std_logic;
     clk    : in std_logic;
    count    : out std_logic_vector(9 downto 0)
  );
end entity;

architecture rtl of r_e_cntr_vhdl is
  signal cnt : unsigned(9 downto 0) := (others => '0');
  signal ticks : unsigned(9 downto 0) := (others => '0');
begin
    process(inp, clk)
    begin
        if rising_edge(inp) then   --count rising edges for the input signal
            cnt <= cnt + 1;
        end if;

        if rising_edge(clk) then   --count how fast the clock is going
            ticks <= ticks + 1;
        end if;

        if ticks = 10000000 then     --push amount of rising edges to output
            count <= std_logic_vector(cnt);
            ticks <= (others => '0');
        end if;
		  
	if ticks = 0 then   --reset cnt, which is variable that counts how fast clock is going
		cnt <= (others => '0');
	end if;
		  
    end process;
end architecture;
