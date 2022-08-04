delete from deces_insee_v3 where rownum = (        
select min (rownum) from deces_insee_v3 where nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' and datenais='19210808') and nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' and datenais='19210808';
commit;



select * from deces_insee_v3 where nom='GUILLOIS' and prenom='MARIA ROSALIE AUGUSTINE' and datenais='19210808'

-- mode scrip suppression + commit en faisant ctrl et F5