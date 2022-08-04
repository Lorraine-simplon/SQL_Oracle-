SELECT length(prenom)-length(replace(prenom, ' ', ''))  FROM dc_insee2 ;

select * from dc_insee2

SELECT substr(prenom, 0, INSTR(prenom, ' '))||' '||substr(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), 0, INSTR(LTRIM(prenom, substr(prenom, 0, INSTR(prenom, ' '))), ' '))
FROM dc_insee2 
 
select *  FROM dc_insee2