Select LTRIM(RTRIM(substr(prenom, 0, INSTR(prenom, ' ' ))))||' '||
LTRIM(RTRIM(substr(LTRIM(RTRIM(LTRIM(prenom, LTRIM(RTRIM(substr(prenom, 0, INSTR(prenom, ' ' ))))))), 0, 
INSTR(LTRIM(RTRIM(LTRIM(prenom, LTRIM(RTRIM(substr(prenom, 0, INSTR(prenom, ' ' ))))))), ' ' ))))
INTO v_Prenom FROM dual;

SELECT count(length(prenom)-length(replace(prenom, ' ', '')))FROM deces_insee_v1 where (length(prenom)-length(replace(prenom, ' ', '')))>1

DECLARE
Nbre_espace NUMBER;
v_Prenom VARCHAR2(32767);
CURSOR cur_pat IS
               SELECT * FROM  deces_insee_v1 WHERE nom='ALEX' and DATENAIS=19200930;
BEGIN

FOR enr IN cur_pat LOOP
SELECT length(enr.prenom)-length(replace(enr.prenom, ' ', '')) INTO Nbre_espace FROM dual; 
DBMS_OUTPUT.PUT_LINE(Nbre_espace);
IF (Nbre_espace > 0) THEN
Select LTRIM(RTRIM(substr(enr.prenom, 0, INSTR(enr.prenom, ' ' ))))||' '||
LTRIM(RTRIM(substr(LTRIM(RTRIM(LTRIM(enr.prenom, LTRIM(RTRIM(substr(enr.prenom, 0, INSTR(enr.prenom, ' ' ))))))), 0, 
INSTR(LTRIM(RTRIM(LTRIM(enr.prenom, LTRIM(RTRIM(substr(enr.prenom, 0, INSTR(enr.prenom, ' ' ))))))), ' ' ))))
INTO v_Prenom FROM dual;

UPDATE deces_insee_v1 SET prenom= v_Prenom where prenom=enr.prenom;

COMMIT;
END IF;

END LOOP;
END;
