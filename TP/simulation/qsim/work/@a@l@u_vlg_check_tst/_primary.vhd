library verilog;
use verilog.vl_types.all;
entity ALU_vlg_check_tst is
    port(
        C               : in     vl_logic;
        N               : in     vl_logic;
        Q               : in     vl_logic_vector(7 downto 0);
        V               : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ALU_vlg_check_tst;
