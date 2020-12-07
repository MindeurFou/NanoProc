library verilog;
use verilog.vl_types.all;
entity NanoProc_vlg_check_tst is
    port(
        C               : in     vl_logic;
        N               : in     vl_logic;
        PC_OUT          : in     vl_logic_vector(31 downto 0);
        RamData         : in     vl_logic_vector(7 downto 0);
        REG_OUT         : in     vl_logic_vector(7 downto 0);
        ROMDATA_OUT     : in     vl_logic_vector(23 downto 0);
        V               : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end NanoProc_vlg_check_tst;
