---------------------------------------------------
select * from locations

--SCROLLABLE CURSOR
declare curLocationsCursor cursor
SCROLL
for
	select * from locations

open curLocationsCursor
fetch first from curLocationsCursor
fetch last from curLocationsCursor
fetch prior from curLocationsCursor
fetch absolute 3 from curLocationsCursor
fetch relative 2 from curLocationsCursor
close curLocationsCursor

deallocate curLocationsCursor
------------------------------------------------------------------

--UPDATEABLE AND SCROLLABLE CURSOR
declare curEmpCursor cursor
SCROLL
for select empid, empname, email,deptid from employees where deptid=1000
for update of empname

open curEmpCursor
declare @empid int
declare @empname varchar(30)
declare @email varchar(30)
declare @deptid int
fetch next from curEmpCursor into @empid, @empname, @email, @deptid
while @@FETCH_STATUS = 0
begin
		update employees set empname=empname +'???' where current of curEmpCursor
		fetch relative 0 from curEmpCursor into @empid, @empname, @email, @deptid
		print 'Employee Id: ' +convert(varchar, @empid)
		print 'Employee Name: ' +convert(varchar, @empname)
		print 'Email Id: ' +convert(varchar, @email)
		print 'Department Id: ' +convert(varchar, @deptid)
		print ''
		fetch next from curEmpCursor into @empid, @empname, @email, @deptid
end
close curEmpCursor

deallocate curEmpCursor

select * from employees where deptid=1000
------------------------------------------------------------------------------------------------
