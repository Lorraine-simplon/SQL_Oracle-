DECLARE
Nbre_espace NUMBER;
v_Prenom VARCHAR2(32767);

SELECT length(prenom)-length(replace(prenom, ' ', '')) INTO Nbre_espace FROM dc_insee2

IF (Nbre_espace > 1) THEN
SELECT substr(prenom, 0, INSTR(prenom, ' '))||' '||substr(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), 0, INSTR(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), ' '))
INTO v_Prenom
FROM dc_insee2
--WHERE 

UPDATE dc_insee2 SET prenom= v_Prenom
-- WHERE