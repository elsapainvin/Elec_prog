LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux21_TB IS
END ENTITY;

ARCHITECTURE Test OF Mux21_TB IS
  SIGNAL sA, sB, sSe, sZ : STD_LOGIC := '0'; -- signaux initialisés à 0
BEGIN
   
  -- Design under test
  DUT: ENTITY work.Mux(TT) PORT MAP(A => sA,
                                    B => sB,
					                          Se => sSe,
					                          Z => sZ);
  -- Cela spécifie l'entité (composant) à utiliser.
  -- Dans ce cas, l'entité est appelée Mux et se trouve dans la bibliothèque work.
  -- Le (TT) semble indiquer la configuration générique (generic) spécifiée pour cette instance. 
  
  -- Vecteur de test
  sA   <= '0', '1' AFTER 10 ms, '0' AFTER 30 ms, '1' AFTER 50 ms, '0' AFTER 70 ms;
  sB   <= '0', '1' AFTER 20 ms, '1' AFTER 40 ms, '0' AFTER 60 ms, '1' AFTER 80 ms;
  sSe <= '0', '1' AFTER 40 ms;
END ARCHITECTURE;
