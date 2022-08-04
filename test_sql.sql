select prenom from patient 

select prenom from dc_insee

select substr(prenom, 0 ) from dc_insee

select substr(prenom, ' ') from dc_insee --ne fonctionne pas

select substr(prenom, 0, ' ') from dc_insee

SELECT prenom FROM patient INTERSECT SELECT prenom FROM dc_insee

select instr(prenom) from dc_insee

SELECT SUBSTR(prenom, INSTR(' ', prenom) + 1, 60) from dc_insee

select * from patient

