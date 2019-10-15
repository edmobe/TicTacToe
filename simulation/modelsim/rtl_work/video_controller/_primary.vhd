library verilog;
use verilog.vl_types.all;
entity video_controller is
    port(
        clk             : in     vl_logic;
        h_synq          : out    vl_logic;
        v_synq          : out    vl_logic;
        red             : out    vl_logic_vector(7 downto 0);
        green           : out    vl_logic_vector(7 downto 0);
        blue            : out    vl_logic_vector(7 downto 0);
        clk_25mhz       : out    vl_logic;
        sync_n          : out    vl_logic;
        blank_n         : out    vl_logic
    );
end video_controller;
