library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use std.env.stop;



entity alu_tb is
end alu_tb;



architecture tb_arch of alu_tb is
component alu
port(
a,b,sel : IN STD_LOGIC_VECTOR(3 downto 0); --Defining a,b,sel
result : out STD_LOGIC_VECTOR(4 downto 0) --Defining result
);
end component;

SIGNAL a,b,sel : std_logic_VECTOR(3 downto 0);
SIGNAL result : std_logic_VECTOR(4 downto 0);
begin
UUT : alu port map (a => a, b => b, sel => sel,result => result);
process
begin



a <= "1000";
b<= "0111";
sel<="0000";

forloop: FOR i IN 1 TO 16 loop
wait for 20 ns;
sel <= sel + 1 ; -- increment sel by one
END loop;
stop; -- stop infinite loop
end process;
end tb_arch;
