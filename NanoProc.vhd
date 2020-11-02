library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.test.all;

-- implémenter les registres et la RAM

entity NanoProc is
	port (
	clk: in bit;
	raz: in bit;
	
	romdata: out integer
	);
end entity;

architecture behav of NanoProc is

type T_RAM is array (integer range 0 to 255) of integer range 0 to 255;
type T_REG is array (integer range 0 to 3) of integer range 0 to 255;  -- nos trois registres
type T_OP is (MOVE, CLR, SET, ADD, SUB, ADDC, SUBC, Op_AND, IOR, EOR, COM, NEG, INC, DEC, Op_ROL, Op_ROR, ASL, ASR, LSR, BTST, BCLR, BSET, BINV, CLRC, SETC, CLRV, SETV, TST, CMP, NOP, BR);
type T_ADRESS is (REG_REG, REG_MEM, MEM_REG, REG_VAL);

signal RAM : T_RAM;

function deborde(Q0 : signed(8 downto 0); Qin : signed(8 downto 0); Data: signed(8 downto 0)) return bit is

variable QinCast: std_logic;
variable Q0Cast: std_logic;
variable DataCast: std_logic;

begin
	QinCast := std_logic(Qin(7));
	Q0Cast := std_logic(Q0(7));
	DataCast := std_logic(Data(7));
	
	if  ( (QinCast AND (NOT Q0Cast) AND DataCast) OR ((NOT QinCast) AND Q0Cast AND DataCast)) = '0' then
		return '1';
	else 
		return '0';
	end if;
end function;

begin
	process(clk,raz)
	
	variable pc: integer:=0;
	
	variable adress: T_ADRESS;
	variable n_adress: integer range 0 to 3;
	
	variable op: T_OP;
	variable n_op: integer range 0 to 31;
	
	variable reg_dest: integer range 0 to 3;
	
	variable operand: integer range 0 to 2^^14-1;
	
	begin
		if raz='1' then
			pc:=0;
			romdata<=ROMPGM(pc);
			for i in 0 to 255 loop 
				RAM(i)<=0; 
			end loop;
			
		elsif clk'event and clk='1' then
		
			romdata<= std_logic_vector(to_unsigned(ROMPGM(pc), romdata'length));  --permet de voir l’instruction en cours
			pc:=pc+1;
			
-----------------------décodage du mot programme---------------------------
			n_op := to_integer(unsigned(romdata'driving_value(5 downto 0)));
			op := T_OP'val(n_op);
			
			n_adress:= to_integer(unsigned(romdata(23 downto 22)));			
			adress := T_ADRESS'val(n_adress);
			
			reg_dest := to_integer(unsigned(romdata(7 downto 6)));
			
			operand := to_integer(unsigned(romdata(21 downto 8)));
---------------------------------------------------------------------------
			
			
			case operation is
				when MOVE =>
				
					case adress is
						when REG_REG =>
						
						when REG_MEM =>
						
						when MEM_REG =>  -- seule l'instruction MOVE peut utiliser l'adressage MEM_REG
						
						when REG_VAL =>
						
					end case;

					
				when CLR =>
					
					case adress is
						when REG_REG =>
						
						when REG_MEM =>
						
						when REG_VAL =>
						
					end case;
				
										
				when others => 
					null;
					
			end case;
			
			
		end if;
end process;




end architecture;				
					
					
					
				
					
					
					