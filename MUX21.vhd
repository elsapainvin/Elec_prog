LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux21 IS
PORT (A,B, Se: IN STD_LOGIC;
      Z : OUT STD_LOGIC);
END ENTITY;

-- Description sous la forme d'une équation logique
ARCHITECTURE Equation OF Mux21 IS
BEGIN
   Z <= (A AND NOT(Se)) OR (B AND Se);
END ARCHITECTURE;

-- Description sous la forme conditionelle sans process
ARCHITECTURE Conditionelle OF Mux21 IS
BEGIN
   Z <= A WHEN (se='0') ELSE B;
END ARCHITECTURE;

-- Description sous la forme conditionelle avec process
ARCHITECTURE Conditionelle OF Mux21 IS
BEGIN
	PROCESS (Se, A,B)
    BEGIN
        IF (Se='0') THEN
            Z<=A;
        ELSE
            Z<=B;
        END IF;
  END PROCESS;
END ARCHITECTURE;

-- Description sous la forme d'une table de vérité avec process
ARCHITECTURE TableVerite OF Mux21 IS
SIGNAL inputs : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  inputs <= A&B&Se; -- 1er chiffre de inputs rpz A, 2e chiffre rpz B et 3e rpz Se
  PROCESS (A, B, Se) BEGIN
    CASE (inputs) IS
    WHEN "000"  => Z <= '0';
    WHEN "010"  => Z <= '0';
    WHEN "100"  => Z <= '1';
    WHEN "110"  => Z <= '1';
    WHEN "001"  => Z <= '0';
    WHEN "011"  => Z <= '1';
    WHEN "101"  => Z <= '0';
    WHEN "111"  => Z <= '1';
    WHEN OTHERS => Z <= '0';
    END CASE;
  END PROCESS;
END ARCHITECTURE;
