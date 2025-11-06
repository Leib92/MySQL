-- 30. Skaleeritavad kasutaja loodud funktsioonid --

-- 30.1 | dbo.age --
Create Function Age(@DOB Date)
RETURNS int
AS
BEGIN
Declare @Age INT
SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
RETURN @Age
END

-- ERROR: (Msg 206 - Operand type clash: int is incompatible with date)
Select dbo.Age(dbo.Age('10/08/1982'))

-- 30.2 | Skalaarne select --
Select FirstName, BirthDate, dbo.Age(BirthDate) as Age from DimEmployee
Where dbo.Age(BirthDate) > 30