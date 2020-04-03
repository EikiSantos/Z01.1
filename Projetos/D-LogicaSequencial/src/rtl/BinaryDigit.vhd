-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture arch of BinaryDigit is

	component FlipFlopD is
		port(
			clock:  in std_logic;
			d:      in std_logic;
			clear:  in std_logic;
			preset: in std_logic;
			q:     out std_logic
		);
	end component;

	component Mux2Way is
		port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
	end component;

	signal dffout,muxout: std_logic;

begin
	mux: Mux2way port map(
		a => input,
		b => dffout,
		sel => load
		);

	flipflop: FlipFlopD port map(
		clock => clock,
		clear => '0',
		preset => '0',
		d => muxout,
		q => dffout
	);
	output <= dffout;
end architecture;
