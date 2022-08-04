SELECT * FROM deces_insee_test FETCH FIRST 5 ROWS ONLY; -- affiche seulement 5 lignes de la table

SELECT * FROM deces_insee_test ORDER BY 1; -- tri la premi�re colonne par ordre alphab�tique

SELECT * FROM deces_insee_test ORDER BY NOM; -- idem

SELECT * FROM deces_insee_test ORDER BY DATEDC; -- trier par ordre croissant par rapport � la colonne DATEDC

SELECT * FROM deces_insee_test ORDER BY DATEDC DESC; -- trier par ordre d�croissant la colonne DATEDC

SELECT * FROM deces_insee_test WHERE prenom = 'PIERRE'; -- affiche tous les PIERRE de la table 

SELECT * FROM deces_insee_test WHERE prenom <> 'PIERRE'; -- affiche le compl�ment de la requ�te pr�c�dente, <> correspond � NOT (non �galit�) donc affichera tout sauf PIERRE

SELECT * FROM deces_insee_test WHERE prenom = 'PIERRE' AND nom = 'DUPRE'; -- rajout d'une autre condition prenom PIERRE + nom DUPRE

SELECT * FROM deces_insee_test WHERE UPPER(prenom) = 'PIERRE' -- UPPER permet d'afficher en majuscule et LOWER en minuscule (ne fonctionne pas sur ORACLE)

SELECT * FROM deces_insee_test WHERE communenais IS NULL; -- affiche les lignes o� la colonne COMMUNENAIS est vide

SELECT * FROM deces_insee_test WHERE communenais IS NOT NULL; -- affiche uniquement si la colonne COMMUNENAIS n'est pas vide 

SELECT * FROM deces_insee_test WHERE prenom IN ('PIERRE', 'PAUL'); -- affiche les prenoms PIERRE et PAUL

SELECT * FROM deces_insee_test WHERE prenom LIKE 'D%'; -- affiche tous les prenoms commen�ant par un D

SELECT * FROM deces_insee_test WHERE prenom LIKE '_____'; -- affiche tous les prenoms comprenant 5 caract�res = en mettant 5 underscore (_)

SELECT DISTINCT prenom FROM deces_insee_test; -- n'affiche aucun doublon de la colonne PRENOM

SELECT DISTINCT prenom AS "premier_prenom" FROM deces_insee_test; -- renommer la colonne PRENOM par PREMIER PRENOM

SELECT nom || prenom FROM deces_insee_test; -- concat�nation de NOM et PRENOM

SELECT nom ||' '|| prenom FROM deces_insee_test -- concat�nation de NOM et PRENOM avec un espace

SELECT nom ||' '|| SUBSTR(prenom, 1, 1) FROM deces_insee_test; --(chaine, d�but, longueur) = NOM et premi�re lettre du PRENOM

SELECT nom ||' '|| SUBSTR(prenom, 1, 1) || '.' FROM deces_insee_test; -- idem + un point � la fin

SELECT nom, LENGTH(nom) FROM deces_insee_test; -- donne la longueur de caract�re de chaque PRENOM

SELECT nom, prenom, REPLACE(prenom, 'PIERRE', 'PETER') FROM deces_insee_test; -- remplace PIERRE par PETER

SELECT nom, prenom, INSTR(prenom, 'P') FROM deces_insee_test; -- d�tecte si un PRENOM comporte un P ou non et donne la position du P (seulement du premier lorsqu'il y en a plusieurs)

SELECT SYSDATE FROM DUAL; -- donne la date et l'heure � l'instant T


