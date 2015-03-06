

/* DDL Statements - Data Definition Language */ 
create database College;

use College;

--create table 
create table student(sno int , name varchar(30));

--alter table 
alter table student add rollno varchar(20);
alter table student drop column rollno ;

--drop table 
drop table student;

--truncate table 
truncate table student ;

--creating with constraints 
create table student(sno int primary key ,
					 name varchar(30) not null  ,
					 rollno varchar(20) unique  ,
					 gender varchar(10) check ( gender='M' OR gender='F' ) , 
					 fees int null ,
					 paid bit default 0 , 
					 city int foreign key references city(cid)    
					);

create table city( cid int primary key , 
				   cname varchar(20) not null , 
				 ) ;

create table studentlist(rollno varchar(20) , name varchar(20));


/* DML statements - Data Manipulation Language  */

--insert statement [ constraints satisfied ] 
insert into city values( 1 , 'Chennai');
insert into student values( 1 , 'ashok' , '11cs01' , 'M' , 1000 , 0  , 1 ); --check for dummy data @ the end of the file 
insert into student( sno , name ,  rollno , gender , fees) values ( 2 , 'Bharathi' , '11cs102' , 'M' , 1000);
insert into studentlist select rollno , name from student;

--insert statement [ constraints not satisfied ]
	--violate primary key 
	insert into student values( 1 , 'a' , '11cs01' , 'M' , 1000 , 0 );	
	insert into student values( 1 , 'b' , '11cs02' , 'M' , 1000 , 0 );

	--violate not null 
	insert into student values( 1 , NULL , '11cs01' , 'M' , 1000 , 0 );	
	insert into student( sno , rollno , gender , fees) values ( 2 ,  '11cs102' , 'M' , 1000);

	--violate unique 
	insert into student values( 1 , 'a' , '11cs01' , 'M' , 1000 , 0 );	
	insert into student values( 2 , 'b' , '11cs01' , 'M' , 1000 , 0 );

	--violate check 
	insert into student values(5 , 'a' , '11cs05' , 'X' , 1000 , 0 ) ;

	--null allows null value 

	--default assigns default value if a value is not specified for a field 

	--violate foreign key 
	truncate table city ;
	insert into student values(6 , 'a' , '11cs06' , 'F' , 1000 , 0 , 1 ) ;

-- select statement 
	--select all coumns
	select * from student;
	select * from studentlist;
	select * from city;

	--select specific columns 
	select sno , name from student;

	-- Operators 
	-- Arithmetic Operators + , - , * , / , % 
	select fees + 1000 from student ;
	select fees + paid from student ;

	-- Comparision Operators  > , < , >= , <= , = , != , <> ,!< , !>
	select * from student where gender = 'M' ;

	-- Logical Operators AND , OR , IS NOT NULL , LIKE , IN , NOT , EXISTS , ANY , ALL , BETWEEN
	select * from student where name like '%a';
	select * from student where name like 'a%';
	select * from student where name like '%a%';
	select * from student where sno in ( 1 , 2 ) ;
	select * from student where sno in ( select sno from dayscholar );
	select * from student where sno between 1 and 3 ;

	
--update statement
update student set name = 'M.Ashok' where sno = 1 ;

--delete statement 
delete from student where sno = 1 ;

--Dummy Data 
insert into student values( 2 , 'bharathi' , '11cs02' , 'M' , 1000 , 0  , 1 );
insert into student values( 3 , 'chitra' , '11cs03' , 'F' , 1000 , 0  , 1 );
create table dayscholar ( did int primary key ,  sno int foreign key references student(sno));
insert into dayscholar values ( 1 , 1 ) , ( 2 , 2 ) , ( 3 ,3 ) ;
delete from dayscholar where sno = 3 ;
select * from dayscholar ;