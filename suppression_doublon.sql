select distinct * from deces_insee_v2 where nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' -- vérification à la base 43 doublons

create table deces_insee_1 as (select distinct * from deces_insee) -- suppression de la majorité des doublons(il reste max 1 doublon par ligne)

create table deces_insee_v1 as (select distinct nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc from deces_insee_1) -- suppression du reste des doublons

select * from deces_insee

-- détection des doublons avec DISTINCT
SELECT DISTINCT nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc FROM deces_insee
--ORDER BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc

-- récupération des données de DISTINCT
SELECT DISTINCT nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
INTO deces_insee_v3_clean
FROM deces_insee
ORDER BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc

select SUBSTR(DATEDC, 0, 4), COUNT(SUBSTR(DATEDC, 0, 4)) from deces_insee GROUP BY SUBSTR(DATEDC, 0, 4) 
-- permets d'affichier les années (les 4 derniers chiffres correspondent à l'année) 
-- permets de faire les comptes des années (nbr de décès par année) 
-- permets de grouper les calculs pour chaque année

-- numérotation des lignes avec ROWNUM mais les doublons ne sont pas numérotés par le même chiffre
select rownum, nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
from deces_insee_v6

select * from deces_insee_v1

-- indexation 
CREATE INDEX index_dc ON deces_insee_v3 (nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc)

ALTER TABLE deces_insee_v3
--ADD 'id' NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY ('id')


-- détection des doublons = donne le nombre de doublon dans une nouvelle colonne
SELECT COUNT(*) AS nbr_doublon, nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
FROM deces_insee_v1
GROUP BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
HAVING COUNT(*) > 1 order by nbr_doublon desc
-- il n'y a plus de doublon, aucun résultat ne s'affiche 

-- suppression des doublons test 1
DELETE FROM deces_insee_v3
WHERE rowdid
    (SELECT MIN(rowdid) FROM deces_insee_v3
WHERE nom = non AND prenom = prenom AND sexe = sexe AND datenais = datenais AND communenais = communenais AND paysnais = paysnais AND datedc = datedc AND lieudc = lieudc);

-- suppression des doublons test 2
DELETE  FROM deces_insee_v3 WHERE ROWNUM = (
        SELECT MIN(rownum), nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
        FROM deces_insee_v3
        GROUP BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
    ) 

-- donne le nombre de répétition de chaque ligne (trier le colonne COUNT ROWNUM par ordre décroissant)
SELECT count(rownum), nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
        FROM deces_insee_v3
        GROUP BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
        
-- suppression d'une ligne de la personne renseignée, à faire plusieurs fois si présent + que deux fois dans la table puis commit        
delete from deces_insee_v3 where rownum = (        
select min (rownum) from deces_insee_v3 where nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' and datenais='19210808') and nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' and datenais='19210808'


delete from deces_insee_v3 where rownum =1

select nom, prenom, from deces_insee_v3 where nom='SCHWERAK' and prenom='ANASTASIE' and datenais='19221128'

select nom, prenom, from deces_insee_v3 where nom='GONTIER' and prenom='JEAN-MARIE ANDRE' and datenais='19320221'