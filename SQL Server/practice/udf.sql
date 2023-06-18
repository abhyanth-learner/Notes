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

