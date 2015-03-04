use Academic ;
select dbo.expandMode(mode) from student ;

create function expandMode ( @mode varchar(1) )
returns varchar(20)
as 
begin 
declare @ans varchar(20) ;
set @ans = 'DAYSCHOLAR';
if @mode = 'H'
set @ans = 'HOSTEL'
return @ans
end 

create procedure pStar 
as 
begin 
declare @star varchar(10);
declare @i int ;
set @i = 0 ;
set @star = '*';
while( @i < 5 )
begin 
print @star ;
set @star = @star + '*';
set @i = @i + 1 ;
end 
end 

drop procedure pStar;

exec pStar;

