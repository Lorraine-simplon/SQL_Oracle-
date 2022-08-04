DECLARE
Nbre_espace NUMBER;
v_Prenom VARCHAR2(32767);

BEGIN

FOR test IN (SELECT length(prenom)-length(replace(prenom, ' ', '')) INTO Nbre_espace FROM dc_insee2)
LOOP

IF (test > 1) THEN
-- ce select retire le dernier prenom
SELECT substr(prenom, 0, INSTR(prenom, ' '))||' '||substr(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), 0, INSTR(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), ' '))
INTO v_Prenom FROM dc_insee2 where test >1;

UPDATE dc_insee2 SET prenom= v_Prenom;

COMMIT;
END IF;

END LOOP;
END;