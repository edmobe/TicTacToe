library verilog;
use verilog.vl_types.all;
entity \block\ is
    generic(
        v_offset        : integer := 0;
        h_offset        : integer := 0
    );
    port(
        h_count_value   : in     vl_logic_vector(15 downto 0);
        v_count_value   : in     vl_logic_vector(15 downto 0);
        logic_info      : in     vl_logic_vector(2 downto 0);
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of v_offset : constant is 1;
    attribute mti_svvh_generic_type of h_offset : constant is 1;
end \block\;
