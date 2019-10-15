library verilog;
use verilog.vl_types.all;
entity clock_divider is
    generic(
        div_value       : integer := 0
    );
    port(
        clk             : in     vl_logic;
        divided_clk     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of div_value : constant is 1;
end clock_divider;
