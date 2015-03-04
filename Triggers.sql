create trigger deleteMode 
on Student 
AFTER DELETE 
as
begin 
delete from Hostel where sno in ( select sno from deleted where mode = 'H' ) ;
delete from Dayscholar where sno in ( select sno from deleted where mode = 'D' ) ;
end 

drop trigger deletemode ;

exec selectAcaemic;
delete from Student where sno = 1 ;