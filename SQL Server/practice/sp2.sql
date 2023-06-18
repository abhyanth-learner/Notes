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


create procedure 
empsearch 
@empid int,
@count int
as 
select @count=count(*) from emp.Persons as t1 
where t1.empid=@empid 
if @count!=0
   select * from emp.Persons where empid=@empid 
else
	print 'NO RECORDS FOUND'

exec empsearch @empid=1223,@count=0


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

alter procedure dateextraction
@string varchar(100)
as 
declare @substr varchar(50)
declare @date date
set @substr=substring(@string,22,28)

print @substr

exec dateextraction @string='[P9001,John Roy,Male,12-Jan-2009]'

