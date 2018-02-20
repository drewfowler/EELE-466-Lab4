library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Y0 is
    port (
        clk   	    : in  std_logic;
		x_in		: in std_logic_vector(35 downto 0); --W=36 and F=18
		y_out		: out std_logic_vector(35 downto 0);  
    );
end Y0;

architecture Y0_arch of Y0 is

	signal Z		: std_logic_vector(5 downto 0); --lzc_count
	signal beta		: signed(35 downto 0); --Beta
	signal alpha	: signed(35 downto 0); --Alpha
	signal check	: std_logic; --1 if beta is even, 0 if beta is odd
	signal plus		: std_logic; --1 is negative, 0 is positive
	
	constant W	: std_logic_vector(7 downto 0) := "00010001"; --17
	--constant F	: std_logic_vector(7 downto 0) := "00010010"; --18
	

	component lzc
		port (
        clk        : in  std_logic;
        lzc_vector : in  std_logic_vector (35 downto 0);
        lzc_count  : out std_logic_vector ( 5 downto 0));
	end component;
	
	

begin

	Z0 : lzc PORT MAP (
		clk 	=> clk,
		x 		=> lzc_vector,
		Z		=> lzc_count
	);
	
	CALC_GUESS : process (rising_edge(clk))
		variable beta0,beta1	: std_logic_vector
	begin
		--Calc Beta
		beta <= 17 - signed(Z);
		
		--Checking if Beta is even or odd
		if(beta(0))
			check <= '0'; --Odd
		else 
			check <= '1'; --Even
		end if;

		--Checks if beta is positive or negative
		if(beta(35))
			plus <= '1';
		else
			plus <= '0';
		end if;
			
		--Calc Alpha
		--We need to check which way to shift according to if beta is positive or negative
		if(plus = '1') --negative
			beta0 <= beta srl 1;-- -2*beta
			beta1 <= beta sll 1;-- 0.5*beta
		else			--positive
			beta0 <= beta sll 1;-- -2*beta
			beta1 <= beta srl 1;-- 0.5*beta
		end if;
		
	
		--Alpha calc if even or odd
		if(check = '1')
			alpha <= ---2 * beta + 0.5 * beta
		else
			alpha <= 
		
		
	
	

end architecture;
