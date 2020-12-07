library verilog;
use verilog.vl_types.all;
entity NanoProc_vlg_sample_tst is
    port(
        AdRam           : in     vl_logic_vector(7 downto 0);
        Clk             : in     vl_logic;
        NumReg          : in     vl_logic_vector(1 downto 0);
        RAZ             : in     vl_logic;
        ReadRam         : in     vl_logic;
        ReadReg         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end NanoProc_vlg_sample_tst;
