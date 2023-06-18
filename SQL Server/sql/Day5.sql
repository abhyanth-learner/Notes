create database employee

create schema emp



CREATE TABLE emp.Persons (
    empid int,
    empname varchar(255),
    age int,
	dob date,
    email varchar(255),
    nri bit,
	photo varbinary,
	managerid int,
	deptid int
);

bulk insert emp.persons
from 'C:\Users\AbhyanthP\OneDrive - CitiusTech\Desktop\sqlserverdata.csv'
with
(
FIELDTERMINATOR=',',
rowterminator='\n',
firstrow=2,
check_constraints

)

select * from emp.Persons

select t1.empname as 'EMPName' ,t1.managerid as 'ManagerID',
t2.empname as 'ManagerName',t2.empid as'Manager EMPID'
from emp.persons as t1 left join 
emp.persons as t2
on t1.managerid=t2.empid 

alter procedure 
searchdept1 
@deptid1 int,
@count int
as 
select @count=count(*) from emp.Persons as t1 
where t1.deptid=@deptid1 
if @count!=0
   select * from emp.Persons where deptid=@deptid1 
else
	print 'NO RECORDS FOUND'

EXEC searchdept1 @deptid1 = 12,@count=0;


------------------2---------------------
create procedure addemp 
@deptid int,
@age int,
@empname varchar(20)
as
INSERT INTO emp.Persons(deptid,empname,age)
VALUES (@deptid,@empname,@age);

exec addemp @deptid=1123,@empname='abhyanth',@age=32



--------------------------3--------------------
alter procedure nonnri 
as
select empid,empname,nri from emp.Persons where  nri=0 

exec nonnri 


create or alter procedure
empsearch 
@e int,
@count int
as 
declare @d int

select @count=count(*) from emp.Persons as t1 
where t1.empid=@e 
if @count!=0
   select * from emp.Persons where empid=@e 
else
	print 'NO RECORDS FOUND'

exec empsearch @e=1223,@count=0


select * from emp.Persons


create procedure upperemp 
as
select upper(empname) from emp.Persons

exec upperemp


alter procedure primecheck
@num int
as
declare @i int =2
declare @count int =0
while @i<@num/2
begin

	if(@num%@i =0)
		set @count=1
	set @i=@i+1
end
if (@count=0)
	print 'Its a Prime'
else
	print 'Its not a Prime'

exec primecheck @num=11
		
CREATE table emp.temp11
(
    ID varchar(10),
    Name varchar(20),
    Gender varchar(6),
    Dob varchar(20)
)

drop table emp.temp11
create or alter procedure dateextraction
@string varchar(100)
as 
declare @id varchar(10)
set @id=parsename(replace(@string,',','.'),4)
declare @datediff int
set @datediff=DATEDIFF(YEAR,cast(parsename(replace(@string,',','.'),1)as date),getdate())
if   exists(select * from emp.temp11 where id=@id)  
	begin
	print 'Already exist'
	end
else if  @datediff<6 or @datediff>90
	begin
	print 'Age error'
	end
else
	begin
	print @datediff
	insert into emp.temp11(id,name,gender,dob)
	select
	parsename(replace(@string,',','.'),4),
	parsename(replace(@string,',','.'),3),
	parsename(replace(@string,',','.'),2),
	cast(parsename(replace(@string,',','.'),1)as date)
	end


exec dateextraction @string='P9039,Roy,Male,12-Jan-1900'
select * from emp.temp11








