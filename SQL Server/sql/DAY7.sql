create or alter procedure stoi
@value varchar(50)
as
begin
	begin try 
		declare @intval int
		set @intval=CONVERT(int, @value);
		while(@intval>0)
			begin
			print 'HELLO'
			set @intval=@intval-1
			end
	end try
	begin catch
	
		print error_message()
	    print 'In procedure: ' +ERROR_PROCEDURE()
		print 'At line: ' +convert(varchar, ERROR_LINE())
	end catch
end

exec stoi @value='hello'






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

create or alter procedure findemp
@deptid int
as
begin
	begin try 
			declare @count int=0
			select @count=count(*) from emp.Persons where deptid=@deptid
			if(@count=0)		
			begin
				raiserror('There are no Employees in that deprartment' ,16, 1)
			end

			else
			   select * from emp.Persons where deptid=@deptid
	end try

	begin catch
	
		print error_message()
	    print 'In procedure: ' +ERROR_PROCEDURE()
		print 'At line: ' +convert(varchar, ERROR_LINE())
	end catch
end

exec findemp @deptid=12

declare costiliestproducts cursor
SCROLL
for
	select * from Production.Product order by (ListPrice) desc
open  costiliestproducts
fetch next from costiliestproducts
deallocate  costiliestproducts
