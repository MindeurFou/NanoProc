library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ALU is
	port (
	Data: in signed (7 downto 0);
	Op: in std_logic_vector (4 downto 0);
	Go: in bit;
	Reset: in bit;
	
	Q: out std_logic_vector (7 downto 0);
	Z: out bit;
	C: out bit;
	N: out bit;
	V: out bit
	);
end entity;

architecture behav of ALU is

function deborde(Q0 : signed(7 downto 0); Qin : signed(7 downto 0); Data: signed(7 downto 0)) return bit is

variable QinCast: std_logic;
variable Q0Cast: std_logic;
variable DataCast: std_logic;

begin
	QinCast := std_logic(Qin(7));
	Q0Cast := std_logic(Q0(7));
	DataCast := std_logic(Data(7));
	
	if  ( (QinCast AND (NOT Q0Cast) AND DataCast) OR ((NOT QinCast) AND Q0Cast AND DataCast)) = '0' then
		return '0';
	else 
		return '1';
	end if;
end function;


begin
process(Go)

variable Q0: signed(7 downto 0) := (others=>'0');
variable Qin: signed(7 downto 0) := (others=>'0');

	begin
		if Go'event and Go='1' then
		
			case Op is
				when "00000" =>  -- LOAD
					Qin := Data;
				
				when "00001" =>  --CLR
					Qin := (others=>'0'); 
					--Z<='1';
					--N<='0';
					V<='0';
					
				when "00010" =>  --SET
					Qin := (others=>'1');
					--Z<='0';
					--N<='1';
					V<='0';
					
				when "00011" =>  --ADD 
					Qin := Qin + Data;
					V<= deborde(Q0,Qin,Data);
					
				
				when "00100" =>  --SUB
					Qin := Qin - Data;
					V<= deborde(Q0,Qin,Data);
				
				when others =>
					Qin := (others=>'0');			
					
				
			end case;
			
			--  ===============Gestion de Z et N====================
			
			if Qin="00000000" then
				Z<='1';
			else 
				Z<='0';
			end if;
			
			if Qin(7)='1' then
				N<='1';
			else
				N<='0';
			end if;
			
			--  ====================================================
			
			C <= '0';
			Q0 := Qin; --mémorisation du résultat précédent
			Q <= std_logic_vector(Qin);
			
		end if;
					
end process;



end architecture;				
					
					
					
				
					
					
					