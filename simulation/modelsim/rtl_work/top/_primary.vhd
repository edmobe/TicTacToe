library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        Hsynq           : out    vl_logic;
        Vsynq           : out    vl_logic;
        Red             : out    vl_logic_vector(7 downto 0);
        Green           : out    vl_logic_vector(7 downto 0);
        Blue            : out    vl_logic_vector(7 downto 0)
    );
end top;
