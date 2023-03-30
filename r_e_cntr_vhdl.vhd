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
        if rising_edge(inp) then
            cnt <= cnt + 1;
        end if;

        if rising_edge(clk) then
            ticks <= ticks + 1;
        end if;

        if ticks = 750 then
            count <= std_logic_vector(cnt);
            ticks <= (others => '0');
        end if;
		  
			if ticks = 0 then
				cnt <= (others => '0');
			end if;
		  
    end process;
end architecture;