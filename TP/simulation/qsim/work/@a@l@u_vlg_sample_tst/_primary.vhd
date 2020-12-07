library verilog;
use verilog.vl_types.all;
entity ALU_vlg_sample_tst is
    port(
        Data            : in     vl_logic_vector(8 downto 0);
        Go              : in     vl_logic;
        Op              : in     vl_logic_vector(4 downto 0);
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ALU_vlg_sample_tst;
