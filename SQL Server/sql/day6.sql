CREATE OR ALTER FUNCTION PrimeNumber(@start INT, @end INT)
RETURNS @PrimeNum TABLE(num INT)
AS
BEGIN
    DECLARE @num1 INT = @start
    DECLARE @num2 INT = @end
    DECLARE @flag INT
    WHILE @num1 <= @num2
    BEGIN
        SET @flag = 0
        DECLARE @num3 INT = 2
        WHILE @num3 <= @num1/2
        BEGIN
            IF @num1 % @num3 = 0
            BEGIN
                SET @flag = 1
                BREAK
            END
            SET @num3 = @num3 + 1
        END
        IF @flag = 0
        BEGIN
            INSERT INTO @PrimeNum VALUES(@num1)
        END
        SET @num1 = @num1 + 1
    END
    RETURN
END
SELECT * FROM dbo.PrimeNumber(5, 50);

create or alter function productsearch(@productname varchar(50))
returns table
as 
return
select * from Production.Product where Name=@productname

SELECT * FROM dbo.productsearch('Adjustable Race');

Create table BankAccounts(
    AccountID INT IDENTITY(101, 1) primary key NOT NULL ,
    CustomerName VARCHAR (25),
    AccountType VARCHAR(25),
    Balance INT  NOT NULL,
    Modified_Date DATE  
)



SELECT * FROM BankAccounts



INSERT INTO BankAccounts (CustomerName ,AccountType ,Balance ,Modified_Date) VALUES ('ABHYANTH' , 'SAVINGS' , 20000 ,'2000-10-1')
INSERT INTO BankAccounts (CustomerName ,AccountType ,Balance ,Modified_Date) VALUES ('XYZ' , 'CURRENT' , 40000 ,'2001-12-24')
INSERT INTO BankAccounts (CustomerName ,AccountType ,Balance ,Modified_Date) VALUES ('XYZ2' , 'CURRENT' , 98000 ,'2011-1-2')



CREATE TABLE BankTransactions(
    TransactionID INT IDENTITY(1, 1)  PRIMARY KEY  NOT NULL,
    AccountID INT FOREIGN KEY REFERENCES BankAccounts(AccountID),
    TransactionDate DATE ,
    TransactionType VARCHAR (25),
    TransactionAmount INT

)










CREATE OR ALTER TRIGGER UpdateTransation
ON BankTransactions AFTER INSERT
AS
BEGIN
    DECLARE @TransactionType VARCHAR(25)
    DECLARE @TransactionAmount INT
    DECLARE @TransactionDate DATE
    DECLARE @AccountID INT
    SET @TransactionDate = GETDATE()
    SELECT @AccountID = AccountID, @TransactionAmount = TransactionAmount , @TransactionType =TransactionType FROM inserted



   IF @TransactionType = 'credit'
    BEGIN
        UPDATE BankAccounts SET Balance = @TransactionAmount + Balance , Modified_Date = GETDATE()  WHERE  AccountID =@AccountID
        print ('IN IF LOOP')
    END
    IF @TransactionType = 'debit'
    BEGIN
        UPDATE BankAccounts SET Balance =  Balance - @TransactionAmount  , Modified_Date = GETDATE()  WHERE  AccountID =@AccountID
        print ('IN ELSE LOOP')
    END
    



END



INSERT INTO BankTransactions (AccountID, TransactionDate ,TransactionType ,TransactionAmount ) VALUES (106 , GETDATE() ,'DEBIT' , 5000)




DROP TABLE  BankTransactions,BankAccounts

SELECT * FROM BankAccounts ;
SELECT * FROM BankTransactions;

