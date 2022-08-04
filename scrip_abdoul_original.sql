DECLARE
Nbre_espace NUMBER;
v_Prenom VARCHAR2(32767);
BEGIN
FOR rec in (SELECT prenom FROM dc_insee2)
LOOP
SELECT length(prenom)-length(replace(prenom, ' ', '')) INTO Nbre_espace FROM dc_insee2;
DBMS_OUTPUT.PUT_LINE(Nbre_espace);
IF (Nbre_espace > 1) THEN
SELECT substr(prenom, 0, INSTR(prenom, ' '))||' '||substr(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), 0, INSTR(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), ' '))
INTO v_Prenom FROM dc_insee2; 
UPDATE dc_insee2 SET prenom= v_Prenom; 
COMMIT;
END IF;
END LOOP;
END;