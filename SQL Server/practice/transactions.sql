create table acc1(
	balance float
)

create table acc2(
	balance float
)

insert into acc1 values(5000)
insert into acc2 values(0)

select * from acc1
select * from acc2

delete from acc1
delete from acc2

create or alter proc TransferFunds
@amt float,
@shouldfail bit
as
	begin try
		begin transaction
			update acc1 set balance = balance - @amt
			print 'Amount debited from acc1'
			if @shouldfail = 1
				raiserror('SOME ERROR OCCURED WHILE TRANSFERRING', 16, 1)
			update acc2 set balance = balance + @amt
			print 'Amount credited to acc2'
			commit transaction
			print 'Transfer successful'
		end try

		begin catch
			print ERROR_MESSAGE()
			rollback transaction
			print 'Transaction rolledback'
		end catch


	exec TransferFunds 3000, 1
	
--Common concurrency problems:
--	Dirty Reads
--	Lost Updates
--	Non Repeatable Reads
--	Phantom Reads

--SQL Server Transaction Isolation Levels
--	Read Uncommitted
--	Read Committed
--	Repeatable Read
--	Snapshot
--	Serializable

--TSQL Concurrent Transactions:
--https://www.youtube.com/watch?v=TWv2jpmxaf8

