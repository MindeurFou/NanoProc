-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/02/2020 15:14:59"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ALU IS
    PORT (
	Data : IN std_logic_vector(7 DOWNTO 0);
	Op : IN std_logic_vector(4 DOWNTO 0);
	Go : IN std_logic;
	Reset : IN std_logic;
	Q : OUT std_logic_vector(7 DOWNTO 0);
	Z : OUT std_logic;
	C : OUT std_logic;
	N : OUT std_logic;
	V : OUT std_logic
	);
END ALU;

-- Design Ports Information
-- Reset	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Q[0]	=>  Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[1]	=>  Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[2]	=>  Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[3]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[4]	=>  Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[5]	=>  Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[6]	=>  Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Q[7]	=>  Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z	=>  Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- N	=>  Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- V	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Op[1]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[2]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[3]	=>  Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Op[4]	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Go	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_K17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[5]	=>  Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[6]	=>  Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Data[7]	=>  Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Op : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Go : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Q : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Z : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL ww_N : std_logic;
SIGNAL ww_V : std_logic;
SIGNAL \Go~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \V~2_combout\ : std_logic;
SIGNAL \Go~combout\ : std_logic;
SIGNAL \Go~clkctrl_outclk\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \RESULT~0_combout\ : std_logic;
SIGNAL \Mux7~5_combout\ : std_logic;
SIGNAL \Mux7~6_combout\ : std_logic;
SIGNAL \Mux7~7_combout\ : std_logic;
SIGNAL \Mux7~8_combout\ : std_logic;
SIGNAL \Q[0]~reg0_regout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \RESULT~1_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Q[1]~reg0_regout\ : std_logic;
SIGNAL \RESULT~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Q[2]~reg0_regout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \RESULT~3_combout\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \Q[3]~reg0_regout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \RESULT~4_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Q[4]~reg0_regout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \RESULT~5_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Q[5]~reg0_regout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \RESULT~6_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \Q[6]~reg0_regout\ : std_logic;
SIGNAL \RESULT~7_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Q[7]~reg0_regout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Z~reg0_regout\ : std_logic;
SIGNAL \N~reg0_regout\ : std_logic;
SIGNAL \V~3_combout\ : std_logic;
SIGNAL \V~0_combout\ : std_logic;
SIGNAL \V~1_combout\ : std_logic;
SIGNAL \V~4_combout\ : std_logic;
SIGNAL \V~reg0_regout\ : std_logic;
SIGNAL Qin : std_logic_vector(7 DOWNTO 0);
SIGNAL Q0 : std_logic_vector(7 DOWNTO 0);
SIGNAL \Op~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Data~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_Data <= Data;
ww_Op <= Op;
ww_Go <= Go;
ww_Reset <= Reset;
Q <= ww_Q;
Z <= ww_Z;
C <= ww_C;
N <= ww_N;
V <= ww_V;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Go~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Go~combout\);

-- Location: LCCOMB_X58_Y32_N12
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\Data~combout\(0) & (Qin(0) $ (VCC))) # (!\Data~combout\(0) & (Qin(0) & VCC))
-- \Add0~1\ = CARRY((\Data~combout\(0) & Qin(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(0),
	datab => Qin(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X59_Y32_N14
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\Data~combout\(0) & (Qin(0) $ (VCC))) # (!\Data~combout\(0) & ((Qin(0)) # (GND)))
-- \Add1~1\ = CARRY((Qin(0)) # (!\Data~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(0),
	datab => Qin(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X59_Y32_N10
\Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~0_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Mux7~0_combout\,
	datad => \Add0~0_combout\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X58_Y32_N10
\Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux7~5_combout\ & (((Qin(2))) # (!\Mux7~4_combout\))) # (!\Mux7~5_combout\ & (\Mux7~4_combout\ & (\Data~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~5_combout\,
	datab => \Mux7~4_combout\,
	datac => \Data~combout\(2),
	datad => Qin(2),
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X61_Y32_N4
\Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Mux7~5_combout\ & ((Qin(5)) # ((!\Mux7~4_combout\)))) # (!\Mux7~5_combout\ & (((\Mux7~4_combout\ & \Data~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Qin(5),
	datab => \Mux7~5_combout\,
	datac => \Mux7~4_combout\,
	datad => \Data~combout\(5),
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X57_Y32_N12
\V~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \V~2_combout\ = (!\Mux7~1_combout\ & (\Data~combout\(7) & (\Op~combout\(0) $ (!\Op~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(0),
	datab => \Mux7~1_combout\,
	datac => \Op~combout\(1),
	datad => \Data~combout\(7),
	combout => \V~2_combout\);

-- Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(4),
	combout => \Data~combout\(4));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Go~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Go,
	combout => \Go~combout\);

-- Location: CLKCTRL_G3
\Go~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Go~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Go~clkctrl_outclk\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(1),
	combout => \Op~combout\(1));

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(2),
	combout => \Op~combout\(2));

-- Location: LCCOMB_X57_Y32_N10
\Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Op~combout\(1) & !\Op~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op~combout\(1),
	datad => \Op~combout\(2),
	combout => \Mux7~0_combout\);

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(4),
	combout => \Op~combout\(4));

-- Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(3),
	combout => \Op~combout\(3));

-- Location: LCCOMB_X57_Y32_N0
\Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Op~combout\(4)) # (\Op~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op~combout\(4),
	datad => \Op~combout\(3),
	combout => \Mux7~1_combout\);

-- Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Op[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Op(0),
	combout => \Op~combout\(0));

-- Location: LCCOMB_X57_Y32_N22
\Mux7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\Op~combout\(1) $ (\Op~combout\(0))) # (!\Op~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op~combout\(2),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux7~3_combout\);

-- Location: LCFF_X59_Y32_N1
\Qin[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux7~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(0));

-- Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(0),
	combout => \Data~combout\(0));

-- Location: LCCOMB_X60_Y32_N4
\RESULT~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~0_combout\ = (Qin(0) & \Data~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Qin(0),
	datad => \Data~combout\(0),
	combout => \RESULT~0_combout\);

-- Location: LCCOMB_X57_Y32_N6
\Mux7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~5_combout\ = (\Op~combout\(2) & ((\Op~combout\(1)) # (\Op~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op~combout\(2),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux7~5_combout\);

-- Location: LCCOMB_X60_Y32_N18
\Mux7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~6_combout\ = (\Mux7~4_combout\ & ((\Mux7~5_combout\ & ((Qin(0)))) # (!\Mux7~5_combout\ & (\Data~combout\(0))))) # (!\Mux7~4_combout\ & (((\Mux7~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Data~combout\(0),
	datac => Qin(0),
	datad => \Mux7~5_combout\,
	combout => \Mux7~6_combout\);

-- Location: LCCOMB_X60_Y32_N12
\Mux7~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~7_combout\ = (\Mux7~3_combout\ & (((\Mux7~6_combout\)))) # (!\Mux7~3_combout\ & ((\Mux7~6_combout\ & ((\RESULT~0_combout\))) # (!\Mux7~6_combout\ & (\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Mux7~3_combout\,
	datac => \RESULT~0_combout\,
	datad => \Mux7~6_combout\,
	combout => \Mux7~7_combout\);

-- Location: LCCOMB_X60_Y32_N16
\Mux7~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~8_combout\ = (\Mux7~2_combout\) # ((!\Mux7~0_combout\ & (!\Mux7~1_combout\ & \Mux7~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~2_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux7~1_combout\,
	datad => \Mux7~7_combout\,
	combout => \Mux7~8_combout\);

-- Location: LCFF_X60_Y32_N17
\Q[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux7~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[0]~reg0_regout\);

-- Location: LCFF_X59_Y32_N5
\Qin[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux6~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(1));

-- Location: LCCOMB_X59_Y32_N16
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Data~combout\(1) & ((Qin(1) & (!\Add1~1\)) # (!Qin(1) & ((\Add1~1\) # (GND))))) # (!\Data~combout\(1) & ((Qin(1) & (\Add1~1\ & VCC)) # (!Qin(1) & (!\Add1~1\))))
-- \Add1~3\ = CARRY((\Data~combout\(1) & ((!\Add1~1\) # (!Qin(1)))) # (!\Data~combout\(1) & (!Qin(1) & !\Add1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(1),
	datab => Qin(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X57_Y32_N24
\Mux7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = \Op~combout\(0) $ (((\Op~combout\(1)) # (!\Op~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op~combout\(2),
	datac => \Op~combout\(1),
	datad => \Op~combout\(0),
	combout => \Mux7~4_combout\);

-- Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(1),
	combout => \Data~combout\(1));

-- Location: LCCOMB_X61_Y32_N8
\Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Mux7~5_combout\ & (((Qin(1))) # (!\Mux7~4_combout\))) # (!\Mux7~5_combout\ & (\Mux7~4_combout\ & (\Data~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~5_combout\,
	datab => \Mux7~4_combout\,
	datac => \Data~combout\(1),
	datad => Qin(1),
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X61_Y32_N22
\RESULT~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~1_combout\ = (\Data~combout\(1) & Qin(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Data~combout\(1),
	datad => Qin(1),
	combout => \RESULT~1_combout\);

-- Location: LCCOMB_X60_Y32_N10
\Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Mux7~3_combout\ & (((\Mux6~1_combout\)))) # (!\Mux7~3_combout\ & ((\Mux6~1_combout\ & ((\RESULT~1_combout\))) # (!\Mux6~1_combout\ & (\Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \Add1~2_combout\,
	datac => \Mux6~1_combout\,
	datad => \RESULT~1_combout\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X58_Y32_N14
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (Qin(1) & ((\Data~combout\(1) & (\Add0~1\ & VCC)) # (!\Data~combout\(1) & (!\Add0~1\)))) # (!Qin(1) & ((\Data~combout\(1) & (!\Add0~1\)) # (!\Data~combout\(1) & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((Qin(1) & (!\Data~combout\(1) & !\Add0~1\)) # (!Qin(1) & ((!\Add0~1\) # (!\Data~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Qin(1),
	datab => \Data~combout\(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X58_Y32_N28
\Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Mux7~0_combout\ & (!\Mux7~1_combout\ & ((\Add0~2_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \Op~combout\(0),
	datac => \Add0~2_combout\,
	datad => \Mux7~1_combout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X59_Y32_N4
\Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\Mux6~0_combout\) # ((!\Mux7~1_combout\ & (!\Mux7~0_combout\ & \Mux6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux6~2_combout\,
	datad => \Mux6~0_combout\,
	combout => \Mux6~3_combout\);

-- Location: LCFF_X59_Y32_N15
\Q[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux6~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[1]~reg0_regout\);

-- Location: PIN_K17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(2),
	combout => \Data~combout\(2));

-- Location: LCFF_X58_Y32_N7
\Qin[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux5~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(2));

-- Location: LCCOMB_X58_Y32_N6
\RESULT~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~2_combout\ = (\Data~combout\(2) & Qin(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Data~combout\(2),
	datac => Qin(2),
	combout => \RESULT~2_combout\);

-- Location: LCCOMB_X59_Y32_N18
\Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\Data~combout\(2) $ (Qin(2) $ (\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\Data~combout\(2) & (Qin(2) & !\Add1~3\)) # (!\Data~combout\(2) & ((Qin(2)) # (!\Add1~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(2),
	datab => Qin(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X58_Y32_N8
\Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\Mux5~1_combout\ & ((\RESULT~2_combout\) # ((\Mux7~3_combout\)))) # (!\Mux5~1_combout\ & (((!\Mux7~3_combout\ & \Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~1_combout\,
	datab => \RESULT~2_combout\,
	datac => \Mux7~3_combout\,
	datad => \Add1~4_combout\,
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X58_Y32_N16
\Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((Qin(2) $ (\Data~combout\(2) $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((Qin(2) & ((\Data~combout\(2)) # (!\Add0~3\))) # (!Qin(2) & (\Data~combout\(2) & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Qin(2),
	datab => \Data~combout\(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X58_Y32_N0
\Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~4_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Add0~4_combout\,
	datad => \Mux7~0_combout\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X58_Y32_N2
\Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Mux5~0_combout\) # ((!\Mux7~0_combout\ & (!\Mux7~1_combout\ & \Mux5~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \Mux7~1_combout\,
	datac => \Mux5~2_combout\,
	datad => \Mux5~0_combout\,
	combout => \Mux5~3_combout\);

-- Location: LCFF_X58_Y32_N17
\Q[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux5~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[2]~reg0_regout\);

-- Location: LCFF_X59_Y32_N31
\Qin[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux4~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(3));

-- Location: LCCOMB_X58_Y32_N18
\Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\Data~combout\(3) & ((Qin(3) & (\Add0~5\ & VCC)) # (!Qin(3) & (!\Add0~5\)))) # (!\Data~combout\(3) & ((Qin(3) & (!\Add0~5\)) # (!Qin(3) & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\Data~combout\(3) & (!Qin(3) & !\Add0~5\)) # (!\Data~combout\(3) & ((!\Add0~5\) # (!Qin(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(3),
	datab => Qin(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X59_Y32_N8
\Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~6_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Mux7~0_combout\,
	datad => \Add0~6_combout\,
	combout => \Mux4~0_combout\);

-- Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(3),
	combout => \Data~combout\(3));

-- Location: LCCOMB_X60_Y32_N22
\Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux7~4_combout\ & ((\Mux7~5_combout\ & ((Qin(3)))) # (!\Mux7~5_combout\ & (\Data~combout\(3))))) # (!\Mux7~4_combout\ & (((\Mux7~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Data~combout\(3),
	datac => Qin(3),
	datad => \Mux7~5_combout\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X59_Y32_N20
\Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (Qin(3) & ((\Data~combout\(3) & (!\Add1~5\)) # (!\Data~combout\(3) & (\Add1~5\ & VCC)))) # (!Qin(3) & ((\Data~combout\(3) & ((\Add1~5\) # (GND))) # (!\Data~combout\(3) & (!\Add1~5\))))
-- \Add1~7\ = CARRY((Qin(3) & (\Data~combout\(3) & !\Add1~5\)) # (!Qin(3) & ((\Data~combout\(3)) # (!\Add1~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Qin(3),
	datab => \Data~combout\(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X60_Y32_N0
\RESULT~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~3_combout\ = (Qin(3) & \Data~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Qin(3),
	datad => \Data~combout\(3),
	combout => \RESULT~3_combout\);

-- Location: LCCOMB_X60_Y32_N20
\Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\Mux7~3_combout\ & (\Mux4~1_combout\)) # (!\Mux7~3_combout\ & ((\Mux4~1_combout\ & ((\RESULT~3_combout\))) # (!\Mux4~1_combout\ & (\Add1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \Mux4~1_combout\,
	datac => \Add1~6_combout\,
	datad => \RESULT~3_combout\,
	combout => \Mux4~2_combout\);

-- Location: LCCOMB_X59_Y32_N30
\Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (\Mux4~0_combout\) # ((!\Mux7~1_combout\ & (!\Mux7~0_combout\ & \Mux4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux4~0_combout\,
	datad => \Mux4~2_combout\,
	combout => \Mux4~3_combout\);

-- Location: LCFF_X59_Y32_N29
\Q[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux4~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[3]~reg0_regout\);

-- Location: LCFF_X60_Y32_N1
\Qin[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux3~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(4));

-- Location: LCCOMB_X61_Y32_N18
\Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux7~4_combout\ & ((\Mux7~5_combout\ & ((Qin(4)))) # (!\Mux7~5_combout\ & (\Data~combout\(4))))) # (!\Mux7~4_combout\ & (((\Mux7~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(4),
	datab => \Mux7~4_combout\,
	datac => Qin(4),
	datad => \Mux7~5_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X61_Y32_N0
\RESULT~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~4_combout\ = (\Data~combout\(4) & Qin(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(4),
	datad => Qin(4),
	combout => \RESULT~4_combout\);

-- Location: LCCOMB_X59_Y32_N22
\Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = ((\Data~combout\(4) $ (Qin(4) $ (\Add1~7\)))) # (GND)
-- \Add1~9\ = CARRY((\Data~combout\(4) & (Qin(4) & !\Add1~7\)) # (!\Data~combout\(4) & ((Qin(4)) # (!\Add1~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(4),
	datab => Qin(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X61_Y32_N20
\Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Mux7~3_combout\ & (\Mux3~1_combout\)) # (!\Mux7~3_combout\ & ((\Mux3~1_combout\ & (\RESULT~4_combout\)) # (!\Mux3~1_combout\ & ((\Add1~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \Mux3~1_combout\,
	datac => \RESULT~4_combout\,
	datad => \Add1~8_combout\,
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X58_Y32_N20
\Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\Data~combout\(4) $ (Qin(4) $ (!\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\Data~combout\(4) & ((Qin(4)) # (!\Add0~7\))) # (!\Data~combout\(4) & (Qin(4) & !\Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(4),
	datab => Qin(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X61_Y32_N2
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~8_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(0),
	datab => \Mux7~1_combout\,
	datac => \Mux7~0_combout\,
	datad => \Add0~8_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X61_Y32_N16
\Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~0_combout\) # ((!\Mux7~0_combout\ & (!\Mux7~1_combout\ & \Mux3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \Mux7~1_combout\,
	datac => \Mux3~2_combout\,
	datad => \Mux3~0_combout\,
	combout => \Mux3~3_combout\);

-- Location: LCFF_X61_Y32_N17
\Q[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux3~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[4]~reg0_regout\);

-- Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(5),
	combout => \Data~combout\(5));

-- Location: LCCOMB_X58_Y32_N22
\Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (Qin(5) & ((\Data~combout\(5) & (\Add0~9\ & VCC)) # (!\Data~combout\(5) & (!\Add0~9\)))) # (!Qin(5) & ((\Data~combout\(5) & (!\Add0~9\)) # (!\Data~combout\(5) & ((\Add0~9\) # (GND)))))
-- \Add0~11\ = CARRY((Qin(5) & (!\Data~combout\(5) & !\Add0~9\)) # (!Qin(5) & ((!\Add0~9\) # (!\Data~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Qin(5),
	datab => \Data~combout\(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X59_Y32_N6
\Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~10_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Mux7~0_combout\,
	datad => \Add0~10_combout\,
	combout => \Mux2~0_combout\);

-- Location: LCFF_X59_Y32_N27
\Qin[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux2~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(5));

-- Location: LCCOMB_X61_Y32_N30
\RESULT~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~5_combout\ = (Qin(5) & \Data~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Qin(5),
	datad => \Data~combout\(5),
	combout => \RESULT~5_combout\);

-- Location: LCCOMB_X59_Y32_N24
\Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Data~combout\(5) & ((Qin(5) & (!\Add1~9\)) # (!Qin(5) & ((\Add1~9\) # (GND))))) # (!\Data~combout\(5) & ((Qin(5) & (\Add1~9\ & VCC)) # (!Qin(5) & (!\Add1~9\))))
-- \Add1~11\ = CARRY((\Data~combout\(5) & ((!\Add1~9\) # (!Qin(5)))) # (!\Data~combout\(5) & (!Qin(5) & !\Add1~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(5),
	datab => Qin(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X60_Y32_N6
\Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\Mux2~1_combout\ & ((\RESULT~5_combout\) # ((\Mux7~3_combout\)))) # (!\Mux2~1_combout\ & (((!\Mux7~3_combout\ & \Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datab => \RESULT~5_combout\,
	datac => \Mux7~3_combout\,
	datad => \Add1~10_combout\,
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X60_Y32_N26
\Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = (\Mux2~0_combout\) # ((!\Mux7~1_combout\ & (!\Mux7~0_combout\ & \Mux2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux2~0_combout\,
	datad => \Mux2~2_combout\,
	combout => \Mux2~3_combout\);

-- Location: LCFF_X60_Y32_N27
\Q[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[5]~reg0_regout\);

-- Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(6),
	combout => \Data~combout\(6));

-- Location: LCFF_X59_Y32_N17
\Qin[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux1~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Qin(6));

-- Location: LCCOMB_X61_Y32_N24
\Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux7~5_combout\ & (((Qin(6)) # (!\Mux7~4_combout\)))) # (!\Mux7~5_combout\ & (\Data~combout\(6) & (\Mux7~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~5_combout\,
	datab => \Data~combout\(6),
	datac => \Mux7~4_combout\,
	datad => Qin(6),
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X61_Y32_N14
\RESULT~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~6_combout\ = (\Data~combout\(6) & Qin(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Data~combout\(6),
	datad => Qin(6),
	combout => \RESULT~6_combout\);

-- Location: LCCOMB_X59_Y32_N26
\Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = ((\Data~combout\(6) $ (Qin(6) $ (\Add1~11\)))) # (GND)
-- \Add1~13\ = CARRY((\Data~combout\(6) & (Qin(6) & !\Add1~11\)) # (!\Data~combout\(6) & ((Qin(6)) # (!\Add1~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(6),
	datab => Qin(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X60_Y32_N24
\Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\Mux7~3_combout\ & (\Mux1~1_combout\)) # (!\Mux7~3_combout\ & ((\Mux1~1_combout\ & (\RESULT~6_combout\)) # (!\Mux1~1_combout\ & ((\Add1~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \Mux1~1_combout\,
	datac => \RESULT~6_combout\,
	datad => \Add1~12_combout\,
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X58_Y32_N24
\Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((Qin(6) $ (\Data~combout\(6) $ (!\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((Qin(6) & ((\Data~combout\(6)) # (!\Add0~11\))) # (!Qin(6) & (\Data~combout\(6) & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Qin(6),
	datab => \Data~combout\(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X59_Y32_N12
\Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~12_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Mux7~0_combout\,
	datad => \Add0~12_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X60_Y32_N8
\Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = (\Mux1~0_combout\) # ((!\Mux7~1_combout\ & (!\Mux7~0_combout\ & \Mux1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux1~2_combout\,
	datad => \Mux1~0_combout\,
	combout => \Mux1~3_combout\);

-- Location: LCFF_X60_Y32_N9
\Q[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[6]~reg0_regout\);

-- Location: LCFF_X60_Y32_N5
\Q0[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux0~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => Q0(7));

-- Location: PIN_G21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Data(7),
	combout => \Data~combout\(7));

-- Location: LCCOMB_X61_Y32_N10
\RESULT~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \RESULT~7_combout\ = (Q0(7) & \Data~combout\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Q0(7),
	datad => \Data~combout\(7),
	combout => \RESULT~7_combout\);

-- Location: LCCOMB_X61_Y32_N12
\Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux7~5_combout\ & (((Q0(7))) # (!\Mux7~4_combout\))) # (!\Mux7~5_combout\ & (\Mux7~4_combout\ & ((\Data~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~5_combout\,
	datab => \Mux7~4_combout\,
	datac => Q0(7),
	datad => \Data~combout\(7),
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X59_Y32_N28
\Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = \Data~combout\(7) $ (\Add1~13\ $ (!Q0(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(7),
	datad => Q0(7),
	cin => \Add1~13\,
	combout => \Add1~14_combout\);

-- Location: LCCOMB_X60_Y32_N14
\Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\Mux7~3_combout\ & (((\Mux0~1_combout\)))) # (!\Mux7~3_combout\ & ((\Mux0~1_combout\ & (\RESULT~7_combout\)) # (!\Mux0~1_combout\ & ((\Add1~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \RESULT~7_combout\,
	datac => \Mux0~1_combout\,
	datad => \Add1~14_combout\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X58_Y32_N26
\Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = \Data~combout\(7) $ (\Add0~13\ $ (Q0(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Data~combout\(7),
	datad => Q0(7),
	cin => \Add0~13\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X59_Y32_N2
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!\Mux7~1_combout\ & (\Mux7~0_combout\ & ((\Add0~14_combout\) # (!\Op~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Op~combout\(0),
	datac => \Mux7~0_combout\,
	datad => \Add0~14_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X60_Y32_N30
\Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Mux0~0_combout\) # ((!\Mux7~1_combout\ & (!\Mux7~0_combout\ & \Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~1_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCFF_X60_Y32_N3
\Q[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	sdata => \Mux0~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Q[7]~reg0_regout\);

-- Location: LCCOMB_X59_Y32_N0
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\Mux5~3_combout\ & (!\Mux6~3_combout\ & (!\Mux7~8_combout\ & !\Mux4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~3_combout\,
	datab => \Mux6~3_combout\,
	datac => \Mux7~8_combout\,
	datad => \Mux4~3_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X60_Y32_N2
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\Mux1~3_combout\ & !\Mux0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux1~3_combout\,
	datad => \Mux0~3_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X60_Y32_N28
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!\Mux3~3_combout\ & (!\Mux2~3_combout\ & (\Equal0~0_combout\ & \Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datab => \Mux2~3_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~1_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCFF_X60_Y32_N29
\Z~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Z~reg0_regout\);

-- Location: LCFF_X60_Y32_N31
\N~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \Mux0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \N~reg0_regout\);

-- Location: LCCOMB_X57_Y32_N26
\V~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \V~3_combout\ = (\Mux7~1_combout\) # ((\Op~combout\(0) & (\Op~combout\(2) & !\Op~combout\(1))) # (!\Op~combout\(0) & (\Op~combout\(2) $ (!\Op~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op~combout\(0),
	datab => \Op~combout\(2),
	datac => \Op~combout\(1),
	datad => \Mux7~1_combout\,
	combout => \V~3_combout\);

-- Location: LCCOMB_X58_Y32_N4
\V~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \V~0_combout\ = (\Op~combout\(2) & (!\Op~combout\(1) & (Q0(7) $ (\Add1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Q0(7),
	datab => \Op~combout\(2),
	datac => \Op~combout\(1),
	datad => \Add1~14_combout\,
	combout => \V~0_combout\);

-- Location: LCCOMB_X58_Y32_N30
\V~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \V~1_combout\ = (\V~0_combout\) # ((\Mux7~0_combout\ & (\Add0~14_combout\ $ (Q0(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~0_combout\,
	datab => \Add0~14_combout\,
	datac => \V~0_combout\,
	datad => Q0(7),
	combout => \V~1_combout\);

-- Location: LCCOMB_X57_Y32_N8
\V~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \V~4_combout\ = (\V~2_combout\ & ((\V~1_combout\) # ((\V~3_combout\ & \V~reg0_regout\)))) # (!\V~2_combout\ & (\V~3_combout\ & (\V~reg0_regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V~2_combout\,
	datab => \V~3_combout\,
	datac => \V~reg0_regout\,
	datad => \V~1_combout\,
	combout => \V~4_combout\);

-- Location: LCFF_X57_Y32_N9
\V~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \Go~clkctrl_outclk\,
	datain => \V~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \V~reg0_regout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Reset);

-- Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(0));

-- Location: PIN_E26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(1));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(2));

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(3));

-- Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(4));

-- Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[5]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(5));

-- Location: PIN_E25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[6]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(6));

-- Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Q[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Q[7]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Q(7));

-- Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z);

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C);

-- Location: PIN_J22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \N~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_N);

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\V~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \V~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_V);
END structure;


