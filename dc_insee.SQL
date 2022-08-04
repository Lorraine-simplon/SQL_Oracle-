select distinct a.*, b.nom, b.prenom from dc_insee a, patient b
where a.nom=b.nom and A.PRENOM=B.PRENOM and b.nom='BERTRAND'

select * from patient where nom='BERTRAND' and prenom='CLAUDE'


select length(replace(prenom, ' ', ''))-length(prenom), prenom from deces_insee_v2 -- permet de connaître le nombre d'espace pour chaque cellule

select length(replace(prenom, ' ', ''))-length(prenom), prenom from dc_insee

select * from dc_insee -- contient les suppressions effectuées, ne correspond plus à la table d'origine 

CREATE TABLE dc_insee_sauvegarde AS SELECT * FROM deces_insee_v2 -- copie de la table INSEE

select * from dc_insee_sauvegarde -- visualisation copie table INSEE

CREATE TABLE dc_insee2 AS SELECT * FROM deces_insee_v2 -- copie de la table INSEE pour tester le script Abdoul

SELECT * FROM dc_insee2 -- visualisation de la copie


select length(replace(prenom, ' ', ''))-length(prenom), prenom from dc_insee -- affichage table DC_INSEE après la suppression des écarts au dela de -1

DELETE FROM dc_insee WHERE length(replace(prenom, ' ', ''))-length(prenom) < -1 -- script pour supprimer les écarts dépassant -1