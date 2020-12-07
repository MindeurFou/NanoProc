library verilog;
use verilog.vl_types.all;
entity NanoProc is
    port(
        Clk             : in     vl_logic;
        RAZ             : in     vl_logic;
        Z               : out    vl_logic;
        C               : out    vl_logic;
        N               : out    vl_logic;
        V               : out    vl_logic;
        ReadReg         : in     vl_logic;
        NumReg          : in     vl_logic_vector(1 downto 0);
        REG_OUT         : out    vl_logic_vector(7 downto 0);
        ReadRam         : in     vl_logic;
        AdRam           : in     vl_logic_vector(7 downto 0);
        RamData         : out    vl_logic_vector(7 downto 0);
        ROMDATA_OUT     : out    vl_logic_vector(23 downto 0);
        PC_OUT          : out    vl_logic_vector(31 downto 0)
    );
end NanoProc;
