SELECT SUBSTR ('LORRAINE', 0, 3) from dual

SELECT INSTR ('LORRAINE', 'OR') from dual -- localise emplacement OR

SELECT RTRIM (('LORRAINE MAMADO DAVID PETIT'), 'NE') from dual

SELECT INSTR (('LORRAINE MAMADO DAVID'), ' ') from dual -- localise l'emplacement de l'espace

SELECT LOCATE ('NE', 'LORRAINE MAMADO DAVID PETIT') from dual

SELECT RTRIM (('LORRAINE MAMADO DAVID PETIT'), 'PETIT') from dual -- supprime PETIT

SELECT RTRIM(('LORRAINE MAMADO DAVID PETIT'), ' ') from dual

SELECT RTRIM(prenom) AS prenom_trim FROM dc_insee

select LTRIM (('LORRAINE MAMADO DAVID PETIT'), 'L') from dual -- supprime la lettre L ne peux supprimer que ce qui se trouve tout à gauche (left)

select substr('abcdefghij abcd', '2') from dual

SELECT SUBSTR(prenom, INSTR(' ', prenom) ,5) from dc_insee

select rtrim('        exemplexxxxxxxxxxx', 'x') from dual

select rtrim(prenom) from dc_insee

select ltrim(prenom) from dc_insee

