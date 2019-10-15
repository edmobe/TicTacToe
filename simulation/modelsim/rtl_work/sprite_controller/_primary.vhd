library verilog;
use verilog.vl_types.all;
entity sprite_controller is
    port(
        clk             : in     vl_logic;
        x               : in     vl_logic_vector(9 downto 0);
        y               : in     vl_logic_vector(9 downto 0);
        VGA_RED         : out    vl_logic_vector(7 downto 0);
        VGA_GREEN       : out    vl_logic_vector(7 downto 0);
        VGA_BLUE        : out    vl_logic_vector(7 downto 0)
    );
end sprite_controller;
