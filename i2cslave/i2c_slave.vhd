-------------------------------------------------------------------------------
-- An I2C slave module
-- 
-- it should be able to receive a 2 byte value and to the same 2 bytes back
-- 
-- Resources:
-- [1] https://www.nandland.com/vhdl/modules/module-uart-serial-port-rs232.html
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;



entity i2c_slave is
	port ( 	i_clk		: 	in		std_logic;
				io_sda	:	inout std_logic;
				io_scl	:	inout std_logic;
				o_data	: 	out	std_logic_vector(7 downto 0)	);
end i2c_slave;

architecture my_arch of i2c_slave is
	-- definition of states
	type t_SM_Main is (	s_Idle,
								s_Start,
								s_AddrRead,
								s_CmdRead,
								s_CmdWrite,
								s_Stop,
								s_Error); -- it probably makes sense to have an error state
	-- set initial state
	signal r_SM_Main : t_SM_Main := s_Idle;
	
	signal r_clk_count : integer range 0 to 100;
	signal r_bit_index : integer range 0 to 7;
	
	constant c_SlaveAddr : std_logic_vector := x"42";
	
begin
	p_i2c_slave : process (i_clk)
		begin
				if rising_edge(i_clk) then
					case r_SM_Main is
							when s_Idle =>
								r_clk_count <= 0;
								r_bit_index <= 0;
								
								-- sample sda to check wheter a falling edge occured
								if io_sda = '0' and io_scl = '1' then
									r_SM_Main <= s_Start;
								else
									r_SM_Main <= s_Idle;
								end if;
								
							when s_Start =>
								r_SM_Main <= s_AddrRead;
							when s_AddrRead =>
								r_SM_Main <= s_CmdRead;
							when others =>
								r_SM_Main <= s_Error;
					end case;
				end if;
	end process p_i2c_slave;
end my_arch;
