library ieee;
use ieee.numeric_bit.all;

entity RisingEdgeCounterV2 is
    port(clk, rst, en, l, r: in bit;
        q_l, q_r : out bit_vector(13 downto 0));       //These two are for the two outputs of the SNN
end RisingEdgeCounterV2;

architecture sequential of RisingEdgeCounterV2 is
    begin
    process(l, r)
        variable count1 : integer range 0 to 16000;
          variable count2 : integer range 0 to 16000;   //max rising edges is 16000
    begin
        if rst = '0' then
            count1 := 0;
                count2 := 0;
        elsif en = '1' then
            if (l'event and l = '1') then
                count1 := count1 + 1;
            end if;
                if (r'event and r = '1') then
                count2 := count2 + 1;
            end if;
        else
            count1 := count1;
                count2 := count2;
        end if;
	q_l <= bit_vector(to_unsigned(count1, 14));
	q_r <= bit_vector(to_unsigned(count2, 14));
    end process;
end sequential;
