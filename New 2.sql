DECLARE
Nbre_espace NUMBER;
v_Prenom VARCHAR2(32767);

BEGIN

LOOP



SELECT length(prenom)-length(replace(prenom, ' ', '')) INTO Nbre_espace FROM deces_insee_v2;



IF (Nbre_espace > 1) THEN
SELECT substr(prenom, 0, INSTR(prenom, ' '))||' '||substr(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), 0, INSTR(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), ' '))
INTO v_Prenom FROM deces_insee_v2;



UPDATE deces_insee_v2 SET prenom= v_Prenom;



COMMIT;
END IF;

END LOOP;
END;