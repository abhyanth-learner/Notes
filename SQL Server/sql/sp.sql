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

create procedure 
searchdept 
@deptid1 int
as 
select * from emp.Persons as t1 
where t1.deptid=@deptid1 

EXEC searchdept @deptid1 = 123;