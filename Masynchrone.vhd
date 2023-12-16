LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DLatch IS
PORT (D,E : IN STD_LOGIC;
       Q: OUT STD_LOGIC);
END ENTITY;

-- Description sous la forme d'une équation logique
ARCHITECTURE Jedi OF DLatch IS
  SIGNAL mem : STD_LOGIC;
BEGIN
   PROCESS(E,D) BEGIN
     IF (E='0') THEN
       mem<=mem;
     ELSE
       mem<=D;
     END IF;
    END PROCESS;
Q<=mem;
END ARCHITECTURE;
