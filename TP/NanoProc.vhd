library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.pgm_def.all;

entity NanoProc is
	port (
	
----- Entrées obligatoires -----

		Clk: in bit;
		RAZ: in bit;
		
--------------------------------

------------ FLAG --------------

		Z: out bit;
		C: out bit;
		N: out bit;
		V: out bit;
		
--------------------------------

-------- Signaux Debug ---------

		ReadReg : in bit;
		NumReg : in integer range 0 to 3;
		
-------------- REG -------------

		REG_OUT : out integer range 0 to 255;
		
		ReadRam : in bit;
		AdRam : in integer range 0 to 255;
		
-------------- RAM -------------

		RamData : out integer range 0 to 255;
		
		ROMDATA_OUT : out integer range 0 to 2**24-1;
		PC_OUT : out integer := 0
		
	);
end entity;

architecture behav of NanoProc is

------------------------------- Fct Set V ------------------------------------------------------------

procedure setV(Q0 : in signed(8 downto 0); Qin : in signed(8 downto 0); Data: in signed(8 downto 0); V_Flag : inout bit) is

variable QinCast: std_logic;
variable Q0Cast: std_logic;
variable DataCast: std_logic;

begin
	QinCast := std_logic(Qin(7));
	Q0Cast := std_logic(Q0(7));
	DataCast := std_logic(Data(7));
	
	if  ( (QinCast AND (NOT Q0Cast) AND (NOT DataCast)) OR ((NOT QinCast) AND Q0Cast AND DataCast)) = '1' then
		V_Flag := '1';
	else 
		V_Flag := '0';
	end if;
end procedure;

---------------------------------------------------------------------------------------------------------------

------------------------------- Fct Set Z AND N ---------------------------------------------------------------

procedure setZ_N(res : in integer range 0 to 255; Z_Flag : inout bit; N_Flag : inout bit) is

variable res_signed: signed(7 downto 0);

begin
	if res = 0 then
		Z_Flag := '1';
	else
		Z_Flag := '0';
	end if;
	
	res_signed := to_signed(res, res_signed'length);
	
	if res_signed(7) = '1' then
		N_Flag := '1';
	else
		N_Flag := '0';
	end if;
end procedure;

---------------------------------------------------------------------------------------------------------------

-------------------------------- Fct Set C --------------------------------------------------------------------

procedure setC(res_9bit : in signed(8 downto 0); C_Flag : out bit) is

begin
	if res_9bit(8) = '1' then
		C_Flag := '1';
	else
		C_Flag := '0';
	end if;
end procedure;

---------------------------------------------------------------------------------------------------------------

--------------------------------- Conversion Flag C -> C 9 bit ------------------------------------------------

procedure conver_CFlag_C9bit(C_Flag : in bit; C_9bit : out signed(8 downto 0)) is

begin
	if C_Flag = '1' then
		C_9bit(0) := '1';
	else
		C_9bit(0) := '0';
	end if;
end procedure;

---------------------------------------------------------------------------------------------------------------

--------------------------------- Conversion C 9 bit -> Flag C ------------------------------------------------

procedure conver_C9bit_CFlag(C_9bit : in signed(8 downto 0); C_Flag : out bit) is

begin
	if C_9bit(0) = '1' then
		C_Flag := '1';
	else
		C_Flag := '0';
	end if;
end procedure;

---------------------------------------------------------------------------------------------------------------

------------------------------- Conversion 9 bit signed -> 8 bit integer --------------------------------------

function conv9_8bit(res_9bit : signed(8 downto 0)) return integer is

variable res_8bit: signed(7 downto 0);

begin 
	res_8bit := res_9bit(7 downto 0);
	return to_integer(res_9bit);
end function;

---------------------------------------------------------------------------------------------------------------


type T_RAM is array (integer range 0 to 255) of integer range 0 to 255;
type T_REG is array (integer range 0 to 3) of integer range 0 to 255;
type T_OP is (MOVE, CLR, SET, ADD, SUB, ADDC, SUBC, Op_AND, IOR, EOR, COM, NEG, INC, DEC, Op_ROL, Op_ROR, ASL, ASR, LSR, BTST, BCLR, BSET, BINV, CLRC, SETC, CLRV, SETV, TST, CMP, NOP, BR);
type T_ADRESS is (REG_REG, REG_MEM, MEM_REG, REG_VAL);
type T_CONDITION is (ALWS, NVR, EQ, NE, CC, CS, HI, LT, GE, LE, MI, PL, GT, LS, VC, VS);

signal RAM : T_RAM;
signal REG : T_REG;

begin

	process(Clk,RAZ)
	
	variable pc: integer range T_ROMPGM'range := 0;
	
	variable op : T_OP;
	variable n_op : integer range 0 to 30;
	
	variable adress : T_ADRESS;
	variable n_adress : integer range 0 to 3;
	
	variable reg_dest : integer range 0 to 3;
	
	variable operand : integer range 0 to 2**14-1;
	
	variable condition : T_CONDITION;
	variable n_condition : integer range 0 to 15;
	
	variable type_br : bit;
	variable br_satisfied : bit;
	
	variable offset_adress : integer range 0 to 2**11-1;
	
----------------------- Var intermédiaire --------------------------------

	variable data : integer;
	variable reg_9bit : signed(8 downto 0) := (others=>'0');
	variable data_9bit : signed(8 downto 0) := (others=>'0');
	variable reg0_9bit : signed(8 downto 0) := (others=>'0');
	variable C_9bit : signed(8 downto 0) := (others=>'0');
	variable RomData : signed(23 downto 0) := (others=>'0');
	variable Z_Flag, N_Flag, C_Flag, V_Flag : bit;
	variable Z_Bool, N_Bool, C_Bool, V_Bool : boolean;
	
--------------------------------------------------------------------------
	 
	 begin
	 
		 if RAZ='1' then
			 pc := 0;
			 RomData := to_signed(ROMPGM(pc), RomData'length);
			 
			 for i in 0 to 255 loop 
				RAM(i) <= 0;
			 end loop;
			 
		 elsif Clk'event and Clk='1' then
			 RomData := to_signed(ROMPGM(pc), RomData'length);
			 pc := pc+1;
			 
--------------------------- Découpage RomData -------------------------------------------

			 n_op := to_integer(RomData(5 downto 0));
			 op := T_OP'val(n_op);
			 
----------------------------- Si BRANCHEMENT --------------------------------------------
			
			 if n_op = 30 then
			 
				if RomData(6) = '1' then
					type_br := '1';
				else
					type_br := '0';
				end if;
				
				offset_adress := to_integer(RomData(19 downto 8));
				
				n_condition := to_integer(RomData(23 downto 20));
				condition := T_CONDITION'val(n_condition);
			 
----------------------------------- Sinon ------------------------------------------------

			 else
			 
				reg_dest := to_integer(RomData(7 downto 6));
			 
				operand := to_integer(RomData(21 downto 8));
			 
				n_adress := to_integer(RomData(23 downto 22));
				adress := T_ADRESS'val(n_adress);				
				
			 end if;
				
------------------------------------------------------------------------------------------
			 
			 case op is
			 
--======================================================================================================================================
--======================================================================================================================================
			 
               when MOVE =>

                    case adress is
                        when REG_REG =>
									
									REG(reg_dest) <= REG(operand);

                        when REG_MEM =>
								
									REG(reg_dest) <= RAM(operand);

                        when MEM_REG =>  -- seule l'instruction MOVE peut utiliser l'adressage MEM_REG
								
									RAM(operand) <= REG(reg_dest);

                        when REG_VAL =>
								
									REG(reg_dest) <= operand;

                    end case;
						  
						  setZ_N(REG(reg_dest), Z_Flag, N_Flag);

--======================================================================================================================================
--======================================================================================================================================	

               when CLR =>
					
						REG(reg_dest) <= 0;
						Z_Flag := '1';
						N_Flag := '0';
						V_Flag := '0';
						
--======================================================================================================================================
--======================================================================================================================================	
						
					when SET =>
					
						REG(reg_dest) <= 1;
						Z_Flag := '0';
						N_Flag := '1';
						V_Flag := '0';
						
--======================================================================================================================================
--======================================================================================================================================	
						
					when ADD =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
					
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
								
						reg_9bit := reg0_9bit + data_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	
						
					when SUB =>
				
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
					
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
								
						reg_9bit := reg0_9bit - data_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when ADDC =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
					
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
								
						conver_CFlag_C9bit(C_Flag, C_9bit);
						reg_9bit := reg0_9bit + data_9bit + C_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when SUBC =>

						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
					
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
								
						conver_CFlag_C9bit(C_Flag, C_9bit);
						reg_9bit := reg0_9bit - data_9bit + C_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	
					
					when Op_AND =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
						  
						reg_9bit := reg0_9bit AND data_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when IOR =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
						  
						reg_9bit := reg0_9bit OR data_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when EOR =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						
						case adress is
                        when REG_REG =>
									data_9bit(7 downto 0) := to_signed(REG(operand), data_9bit'length-1);

                        when REG_MEM =>
									data_9bit(7 downto 0) := to_signed(RAM(operand), data_9bit'length-1);

								when REG_VAL =>
									data_9bit(7 downto 0) := to_signed(operand, data_9bit'length-1);
								
								when others => null;
                    end case;	
						  
						reg_9bit := reg0_9bit XOR data_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when COM =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						reg_9bit := NOT reg0_9bit;
						
----------------------- Set Flag ----------------------------------------------------

						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================

					when NEG =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						reg_9bit := NOT reg0_9bit + "000000001";
						
----------------------- Set Flag ----------------------------------------------------

						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================		

					when INC =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);			
						reg_9bit := reg0_9bit + "000000001";
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when DEC =>
					
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);			
						reg_9bit := reg0_9bit - "000000001";
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						setV(reg0_9bit, reg_9bit, data_9bit, V_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when Op_ROL =>
					
						conver_CFlag_C9bit(C_Flag, C_9bit);
						reg_9bit(0) := C_9bit(0);
						reg_9bit(8 downto 1) := to_signed(REG(reg_dest), reg_9bit'length-1);
						C_9bit(0) := reg_9bit(8);
						conver_C9bit_CFlag(C_9bit, C_Flag);
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when Op_ROR =>
						
						conver_CFlag_C9bit(C_Flag, C_9bit);
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						reg_9bit(7) := C_9bit(0);
						reg_9bit(6 downto 0) := reg0_9bit(7 downto 1);
						C_9bit(0) := reg0_9bit(0);
						conver_C9bit_CFlag(C_9bit, C_Flag);
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	
						
					when ASL =>
						
						reg_9bit(0) := '0';
						reg_9bit(8 downto 1) := to_signed(REG(reg_dest), reg_9bit'length-1);
						C_9bit(0) := reg_9bit(8);
						conver_C9bit_CFlag(C_9bit, C_Flag);

----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------					
						
--======================================================================================================================================
--======================================================================================================================================	

					when ASR =>
						
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						reg_9bit(7) := reg0_9bit(7);
						reg_9bit(6 downto 0) := reg0_9bit(7 downto 1);
						C_9bit(0) := reg0_9bit(0);
						conver_C9bit_CFlag(C_9bit, C_Flag);
						
----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------	

--======================================================================================================================================
--======================================================================================================================================	

					when LSR =>
						
						reg0_9bit(7 downto 0) := to_signed(REG(reg_dest), reg0_9bit'length-1);
						reg_9bit(7) := '0';
						reg_9bit(6 downto 0) := reg0_9bit(7 downto 1);
						C_9bit(0) := reg0_9bit(0);
						conver_C9bit_CFlag(C_9bit, C_Flag);

----------------------- Set Flag ----------------------------------------------------

						setC(reg_9bit, C_Flag);
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						
-------------------------------------------------------------------------------------

--======================================================================================================================================
--======================================================================================================================================	

					when BCLR =>
					
						reg_9bit(7 downto 0) := to_signed(REG(reg_dest), reg_9bit'length-1);
						reg_9bit(operand) := '0';

----------------------- Set Flag ----------------------------------------------------
						
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';

-------------------------------------------------------------------------------------
						
--======================================================================================================================================
--======================================================================================================================================	
						
					when BSET =>
					
						reg_9bit(7 downto 0) := to_signed(REG(reg_dest), reg_9bit'length-1);
						reg_9bit(operand) := '1';
						
----------------------- Set Flag ----------------------------------------------------
						
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';
						
-------------------------------------------------------------------------------------
						
--======================================================================================================================================
--======================================================================================================================================	
						
					when BINV =>
					
						reg_9bit(7 downto 0) := to_signed(REG(reg_dest), reg_9bit'length-1);
						if reg_9bit(operand) = '1' then
							reg_9bit(operand) := '0';
						else
							reg_9bit(operand) := '1';
						end if;

----------------------- Set Flag ----------------------------------------------------
						
						REG(reg_dest) <= conv9_8bit(reg_9bit);
						setZ_N(REG(reg_dest), Z_Flag, N_Flag);
						V_Flag := '0';

-------------------------------------------------------------------------------------
						
--======================================================================================================================================
--======================================================================================================================================

					when CLRC =>
					
						C_Flag := '0';

--======================================================================================================================================
--======================================================================================================================================	
						
					when SETC =>
					
						C_Flag := '1';
	
--======================================================================================================================================
--======================================================================================================================================	
	
					when CLRV =>
					
						V_Flag := '0';
		
--======================================================================================================================================
--======================================================================================================================================	

					when SETV =>
					
						V_Flag := '1';

--======================================================================================================================================
--======================================================================================================================================	

					when NOP =>
					
						null;

--======================================================================================================================================
--======================================================================================================================================

					when BR =>

--------------- Attribution Boolean ---------------
					
						if Z_Flag = '1' then
							Z_Bool := true;
						else
							Z_Bool := false;
						end if;
						
						if N_Flag = '1' then
							N_Bool := true;
						else
							N_Bool := false;
						end if;
						
						if C_Flag = '1' then
							C_Bool := true;
						else
							C_Bool := false;
						end if;
						
						if V_Flag = '1' then
							V_Bool := true;
						else
							V_Bool := false;
						end if;

---------------------------------------------------
						
						case condition is
						
							when ALWS =>
							
								br_satisfied := '1';

--==================================================================================
								
							when NVR =>
							
								br_satisfied := '0';

--==================================================================================
								
							when EQ =>
							
								if Z_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;
								
--==================================================================================
								
							 when NE =>
							
								if Z_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when CC =>
							
								if C_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when CS =>
							
								if C_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when HI =>
							
								if C_Bool or Z_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when LT =>
							
								if N_Bool xor V_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when GE =>
							
								if N_Bool xor V_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when LE =>
							
								if Z_Bool or (N_Bool xor V_Bool) = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when MI =>
							
								if N_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when PL =>
							
								if N_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when GT =>
							
								if Z_Bool or (N_Bool xor V_Bool) = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when LS =>
							
								if C_Bool or Z_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when VC =>
							
								if V_Bool = false then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							 when VS =>
							
								if V_Bool = true then
								
									br_satisfied := '1';
									
								else
								
									br_satisfied := '0';
									
								end if;

--==================================================================================
								
							when others => null;
						end case;
							
							if br_satisfied = '1' then
							 
								if type_br = '0' then
								
									pc := offset_adress;
								
								else
							
									pc := pc + 1 + offset_adress;
								
								end if;
							
							end if;
														
--======================================================================================================================================
--======================================================================================================================================							
							
					when others => null;
            end case;
				
		end if;
		
		Z <= Z_Flag;
		N <= N_Flag;
		C <= C_Flag;
		V <= V_Flag;
		
		PC_OUT <= pc;
		ROMDATA_OUT <= to_integer(RomData);
		 
	 end process;

----------- Gestion REG -----------------
	 
	 process(ReadReg)
	 
	 begin
	 
	 if ReadReg'event and ReadReg = '1' then
		Reg_OUT <= REG(NumReg);
	 end if;
	 
	 end process;

-----------------------------------------
	 
----------- Gestion RAM -----------------
	 
	 process(ReadRam)
	 
	 begin
	 
	 if ReadRam'event and ReadRam = '1' then
		RamData <= RAM(AdRam);
	 end if;
	 
	 end process;
  
-----------------------------------------

end architecture;
