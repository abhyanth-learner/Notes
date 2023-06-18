--This proc takes an empid as an arg, searches for the employee
--If the employee does not exist, it throws a "custom exception" using raiserror()
--If the employee exists, it returns the salary of the employee back

create or alter proc SearchEmployee
@empid int
as
	if not exists(select * from employees where empid = @empid)
	begin
			raiserror('Employee not found', 16, 1)
			return -1
	end
	declare @sal float
	select @sal = salary from employees where empid = @empid
	return @sal

declare @ans float
exec @ans = SearchEmployee 90
print @ans




create or alter proc UpdateSalary
@empid int,
@newsalary float
as
	begin try
		declare @salary float
		exec @salary = SearchEmployee @empid
		print 'Old salary is: ' +convert(varchar, @salary)
		update employees set salary = @newsalary where empid = @empid
		print 'Update Successful'
		select * from employees where empid = @empid
	end try

	begin catch
		print ERROR_MESSAGE()
		print 'In procedure: ' +ERROR_PROCEDURE()
		print 'At line: ' +convert(varchar, ERROR_LINE())
	end catch


exec UpdateSalary 5, 30000
exec UpdateSalary 50, 90000

select salary from employees where empid=5
