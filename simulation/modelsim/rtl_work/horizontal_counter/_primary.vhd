library verilog;
use verilog.vl_types.all;
entity horizontal_counter is
    port(
        clk_25MHz       : in     vl_logic;
        enable_V_Counter: out    vl_logic;
        h_Count_Value   : out    vl_logic_vector(15 downto 0)
    );
end horizontal_counter;
