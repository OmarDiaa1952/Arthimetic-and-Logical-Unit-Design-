-- 4-bit ALU
-- sel Operation Unit
-- 0000 increment a
-- 0001 decrement a
-- 0010 transfer b
-- 0011 increment b Aritmetic
-- 0100 decrement b
-- 0101 transfer a
-- 0110 add a and b
-- 0111 multiply a by 2

-- 1000 complement a (1s complement)
-- 1001 complement b
-- 1010 AND
-- 1011 OR
-- 1100 XOR Logic
-- 1101 XNOR
-- 1110 NAND
-- 1111 NOR
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
entity alu is
port(
a,b,sel: IN STD_LOGIC_VECTOR(3 downto 0); --Defining a,b,sel
result : out STD_LOGIC_VECTOR(4 downto 0) --Defining result
);
end alu;

architecture dataflow of alu is
begin
process(sel)
begin
-- adding zeroes to the left to put it in 5 bits where each operand must be in 5 bit format



-- Arithmetic Operations



if sel = "0000" then result <= ("00000"+ a + "00001"); -- increment a
elsif sel = "0001" then result <= ("00000"+ a + "11111"); -- decrement a
elsif sel = "0010" then result <= ( "00000" + b); -- transfer b
elsif sel = "0011" then result <= ("00000"+ b + "00001"); -- increment b
elsif sel = "0100" then result <= ( "00000"+ b + "11111"); -- decrement b
elsif sel = "0101" then result <= ("00000" + a ); -- transfer a
elsif sel = "0110" then result <=("00000" + a + b ); -- Add a and b
elsif sel = "0111" then result <=("00000" +(a & "0") ); -- multiply (a) by 2 or shift left 1 bit



-- Logical Operations



elsif sel = "1000" then result(3 downto 0) <= not a; -- 1's complement of a (invert a)
elsif sel = "1001" then result(3 downto 0) <= not b ; -- 1's complement of b (invert b)
elsif sel = "1010" then result(3 downto 0) <= (a and b); -- a AND b
elsif sel = "1011" then result(3 downto 0) <= (a or b); -- a OR b
elsif sel = "1100" then result(3 downto 0) <= (a xor b); -- a XOR b
elsif sel = "1101" then result(3 downto 0) <= (a xnor b); -- a XNOR b
elsif sel = "1110" then result(3 downto 0) <= (a nand b); -- a NAND b
elsif sel = "1111" then result(3 downto 0) <= (a nor b); -- a NOR b
else result <= "ZZZZZ"; -- Setting result to High impendence(ZZZZZ) if no other condition is satisfied
end if ;
--Setting MSB bit in Logical Operations to Zero
if sel(3) = '1' then result(4)<= '0'; end if ;



end process;
end dataflow;
