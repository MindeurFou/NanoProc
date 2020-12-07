library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        Data            : in     vl_logic_vector(8 downto 0);
        Op              : in     vl_logic_vector(4 downto 0);
        Go              : in     vl_logic;
        Reset           : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0);
        Z               : out    vl_logic;
        C               : out    vl_logic;
        N               : out    vl_logic;
        V               : out    vl_logic
    );
end ALU;
