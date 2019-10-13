library verilog;
use verilog.vl_types.all;
entity vertical_counter is
    port(
        clk_25MHz       : in     vl_logic;
        enable_V_Counter: in     vl_logic;
        v_Count_Value   : out    vl_logic_vector(15 downto 0)
    );
end vertical_counter;
