select a.nipatient, a.nom as nom_dx,b.nom as nom_insee, a.prenom as prenom_dx, b.prenom as prenom_insee, a.datenais as datenais_dx, b.datenais as datenais_insee, b.datedc, b.lieudc  from patient a, deces_insee b
where a.nom=b.NOM
and a.datenais=b.datenais
and a.prenom=b.prenom

-- Match DX CARE et données INSEE


select * from patient where nipatient=270997

select * from infopat where nipatient=270997

SELECT COUNT(*) AS nbr_doublon, nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
FROM deces_insee
GROUP BY nom, prenom, sexe, datenais, communenais, paysnais, datedc, lieudc
HAVING COUNT(*) > 1 order by nbr_doublon desc

SELECT nom, prenom, sexe, datenais, communenais, paysnais, datedc, substr(lieudc, 0, 2)
FROM deces_insee where prenom like 'JEAN%CH%'


