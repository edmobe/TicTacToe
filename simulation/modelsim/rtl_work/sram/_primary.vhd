library verilog;
use verilog.vl_types.all;
entity sram is
    generic(
        ADDRESS_WIDTH   : integer := 8;
        DATA_WIDTH      : integer := 8;
        DEPTH           : integer := 256;
        MEMFILE         : string  := ""
    );
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector;
        rw              : in     vl_logic;
        sram_in         : in     vl_logic_vector;
        sram_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of MEMFILE : constant is 1;
end sram;
