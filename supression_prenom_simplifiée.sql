create table deces_insee_test as (select * from deces_insee_v1)

UPDATE deces_insee_test
    SET prenom = SUBSTR(prenom, 1, INSTR(prenom, ' ')-1)
WHERE prenom LIKE '% %';

select * from deces_insee_test

SELECT COUNT(*) AS nbr_doublon, nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
FROM deces_insee_test
GROUP BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
HAVING COUNT(*) > 1 order by nbr_doublon desc


