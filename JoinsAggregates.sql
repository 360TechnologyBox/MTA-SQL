select * from student;
select COUNT(*) from student;
select AVG(fees) from student;
select MIN(sno) from student ;
select MAX(sno) from student ;
select SUM(fees) from student ;
select  TOP 1 fees from student ;


select SUBSTRING(name , 1 , 3 ) from student;
select UPPER(name) from student ;
select LOWER(name) from student ;
select LEN(name) from student;
select ROUND(fees , 2 , 2 ) from student;
select LEN(RTRIM(name)) from student; 
select LEN(LTRIM(name)) from student;

update student set name='   ashok' where sno = 1 ;
select * from student;

select * from student order by name ASC;
select * from student order by name DESC;

create view list as 
select rollno , name from student ;

select * from list ;
select gender , COUNT ( gender ) from student group by gender;

create table marks ( sno int , total int ); 

insert into marks values ( 1 , 50 ) ;
insert into marks values ( 3 , 70 ) ;
insert into marks values ( 4 , 80 ) ;

select * from marks ;

select * from student inner join  marks on student.sno = marks.sno ;
select * from student left join  marks on student.sno = marks.sno ;
select * from student right join  marks on student.sno = marks.sno ;
select * from student full join  marks on student.sno = marks.sno ;
